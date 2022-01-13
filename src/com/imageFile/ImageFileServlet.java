package com.imageFile;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.Custominfo;
import com.kmlogin.KmmemberDAO;
import com.kmlogin.KmmemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyUtil;

public class ImageFileServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);		
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn = DBConn.getConnection();
		ImageFileDAO dao = new ImageFileDAO(conn);
		MyUtil myUtil = new MyUtil();

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "imageFileTest";

		File f = new File(path);

		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("write.do")!=-1) {
			url= "/kmong/kmlogin/write.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1) {
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;

			MultipartRequest mr =
					new MultipartRequest(req, path, maxSize,encType,
							new DefaultFileRenamePolicy());
			if(mr.getFile("upload")!=null) {

				ImageFileDTO dto = new ImageFileDTO();
				int maxNum = dao.getMaxNum();
				dto.setNum(maxNum + 1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));

				dao.insertData(dto);
			}

			url = cp + "/images/list2.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list2.do")!=-1) {
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;

			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			//�˻�----------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){
				
				//�Ѿ�� ���� GET����̶�� ���ڵ�,���ڵ��� �Ѵ�
				if(req.getMethod().equalsIgnoreCase("GET")){
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
				
			}else{
				searchKey = "subject";
				searchValue = "";
			}
			
			//�˻�----------------------------
			
			
			//��ü �������� ����

			int dataCount = dao.getDataCount(searchKey,searchValue);

			//�� �������� ǥ���� ������ ����

			int numPerPage = 9;

			//��ü �������� ����

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//��ü�������� ������ ������ ���� �������������� �۾������

			if(currentPage>totalPage){
				currentPage = totalPage;
			}

			//db���� ������ �������� ���۰� ��
			int start  = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ImageFileDTO> lists = dao.getList(start,end,searchKey,searchValue);
			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param = "?searchKey=" + searchKey;
				param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			
			HttpSession session = req.getSession();
			
			Custominfo info = (Custominfo)session.getAttribute("customInfo");
			
			if(info == null) {
				
				url = "/kmong/kmlogin/login.jsp";	
				forward(req, resp, url);
				return;
				
			}
			
			KmmemberDAO dao2 = new KmmemberDAO(conn);
			
			String userId = info.getUserId();
			
			KmmemberDTO dto2 = dao2.getReadData(userId);

			String deletePath2 = cp + "/imgBoard/delete.do";
			String imagePath2 = cp + "/pds/saveimgFile";
			
			req.setAttribute("deletePath2", deletePath2);
			req.setAttribute("imagePath2", imagePath2);
			req.setAttribute("dto2", dto2);
			
			
			String listUrl = cp + "/images/list2.do" + param;
			
			String pageIndexList = 
					myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String deletePath = cp + "/images/delete.do";
			String imagePath = cp + "/pds/imageFileTest";
			
			dataCount = dao.getDataCount(searchKey,searchValue);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("lists", lists);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("totalPage", totalPage);

			url = "/kmong/kmlogin/list2.jsp";
				forward(req, resp, url);
				
		}else if(uri.indexOf("deleted.do")!=-1) {
			int num = Integer.parseInt(req.getParameter("num"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));

			ImageFileDTO dto =dao.getReadData(num);


			//������ ���� ����
			FileManager.doFileDelete(dto.getSaveFileName(), path);

			//���̺����� ����
			dao.deleteData(num);

			url = cp + "/images/list2.do?pageNum=" + pageNum;
			resp.sendRedirect(url);

		}
	}
}
