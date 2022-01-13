package com.kmBoard;

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

import com.imageFile.ImageFileDTO;
import com.join.Custominfo;
import com.kmlogin.KmmemberDAO;
import com.kmlogin.KmmemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.MyUtil;


public class KmBoardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;



	/*
	�����ϱ� ������ ��α��� -> �α�������
	�α��ν� ����â���� �̵�


	 */ 



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, 
			HttpServletResponse resp, String url) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);


	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		MyUtil myUtil = new MyUtil();

		Connection conn = DBConn.getConnection();
		KmBoardDAO dao = new KmBoardDAO(conn);

		//���� ���� ��� pds
		String root = getServletContext().getRealPath("/");
		String path = root+"pds" + File.separator + "kmFile";

		File f = new File(path);



		//��� ������ ���ϻ���
		if(!f.exists()) {
			f.mkdirs();
		}
		String url;

		if(uri.indexOf("upload.do")!=-1) { //uri�ȿ� created.do �� ������

			/*		
			HttpSession session = req.getSession();
			CustomInfo info =
					(CustomInfo)session.getAttribute("customInfo");

			if(info==null) {
				url = "/kmong/kmlogin/login.jsp";
				forward(req, resp, url);
				return;


			}
			 */		
			
			
			url = "/kmong/kmBoard/upload.jsp";

			//���� ������
			forward(req, resp, url);



		} else if (uri.indexOf("upload_ok.do")!=-1) {

			HttpSession session = req.getSession();

			int categoryNum = Integer.parseInt( req.getParameter("ctgNum"));
			
			//Custominfo info = (CustomInfo)session.getAttribute("customInfo");
			
			Custominfo info = new Custominfo();
			session.setAttribute("customInfo", info);
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			MultipartRequest mr = 
					new MultipartRequest(req, path, maxSize, encType,
							new DefaultFileRenamePolicy());


			if(mr.getFile("upload")!=null) {

				KmBoardDTO dto = new KmBoardDTO();

				int maxNum = dao.getMaxNum();


				dto.setGdsNum(maxNum+1);
				dto.setGdsName(mr.getParameter("gdsName"));
				dto.setGdsDes(mr.getParameter("gdsDes"));
				dto.setGdsDate(mr.getParameter("gdsDate"));
				dto.setGdsImg(mr.getFilesystemName("upload"));
				dto.setCateCode(mr.getParameter("cateCode"));
				dto.setGdsSell(mr.getParameter("gdsSell"));
				dto.setSubCate(mr.getParameter("subCate"));
				//userName�� session���� �޾ƿ;��ϴ°žƴѰ�..?
				dto.setUserName("aa");
				dto.setGdsPrice(Integer.parseInt(mr.getParameter("gdsPrice")));
				dto.setWorkDate(Integer.parseInt(mr.getParameter("workDate")));

				dao.insertData(dto);

			}
			
			url = cp + "/km/list2.do?ctgNum=" + categoryNum;
			resp.sendRedirect(url);

		} else if (uri.indexOf("article.do")!=-1) {



			String imagePath = cp + "/pds/kmFile";

			int gdsNum = Integer.parseInt(req.getParameter("gdsNum"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			HttpSession session = req.getSession();
			
			Custominfo info = (Custominfo)session.getAttribute("customInfo");
			
			KmmemberDAO dao2 = new KmmemberDAO(conn);
			
			
			if(info != null) {
				
				String userId = info.getUserId();
				
				KmmemberDTO dto2 = dao2.getReadData(userId);
				
				req.setAttribute("dto2", dto2);
				
			}
			
			String imagePath2 = cp + "/pds/saveimgFile";
			req.setAttribute("imagePath2", imagePath2);
			
			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue,"UTF-8");
			}

			dao.updateHitCount(gdsNum); //��ȸ��
			KmBoardDTO dto = dao.getReadData(gdsNum); //�ϳ� ����Ÿ�о����

			if(dto==null) {
				
				url = cp + "/sbbs/list.do";
				resp.sendRedirect(url);
				
			}

			int lineSu = dto.getGdsDes().split("\n").length;

			dto.setGdsDes(dto.getGdsDes().replaceAll("\r\n", "<br>"));

			String param = "pageNum="+pageNum;
			if(searchValue!=null) {
				param+= "&searchKey="+searchKey+"&searchValue="+searchValue;
			}
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);
			
			req.setAttribute("params", param);
			req.setAttribute("lineSu", lineSu);
			req.setAttribute("pageNum", pageNum);




			url = "/kmong/kmBoard/article.jsp";
			forward(req, resp, url);


		} else if (uri.indexOf("article_ok.do")!=-1) {

			HttpSession session = req.getSession();

			//CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

			Custominfo info = new Custominfo();
			session.setAttribute("customInfo", info);

			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			MultipartRequest mr = 
					new MultipartRequest(req, path, maxSize, encType,
							new DefaultFileRenamePolicy());
			int gdsNum= Integer.parseInt(req.getParameter("gdsNum"));

			if(mr.getFile("upload")!=null) {

				KmBoardDTO dto = new KmBoardDTO();

				int maxNum = dao.getMaxNum();


				dto.setGdsNum(maxNum+1);
				dto.setGdsName(mr.getParameter("gdsName"));
				dto.setGdsDes(mr.getParameter("gdsDes"));
				dto.setGdsDate(mr.getParameter("gdsDate"));
				dto.setGdsImg(mr.getFilesystemName("upload"));
				dto.setCateCode(mr.getParameter("cateCode"));
				dto.setGdsSell(mr.getParameter("gdsSell"));
				//userName�� session���� �޾ƿ;��ϴ°žƴѰ�..?
				dto.setUserName("aa");
				dto.setGdsPrice(Integer.parseInt(mr.getParameter("gdsPrice")));
				dto.setWorkDate(Integer.parseInt(mr.getParameter("workDate")));

				dao.getPayData(gdsNum);
				







			}
			url = cp + "/km/payment.do";
			resp.sendRedirect(url);



		} else if (uri.indexOf("payment.do")!=-1) {

			HttpSession session = req.getSession();
			
			Custominfo info = (Custominfo)session.getAttribute("customInfo");
			
			if(info == null) {
				
				url = "/kmong/kmlogin/login.jsp";	
				forward(req, resp, url);
				return;
				
			}
			

			String imagePath = cp + "/pds/kmFile";




			int gdsNum = Integer.parseInt(req.getParameter("gdsNum"));


			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue,"UTF-8");
			}


			KmBoardDTO dto = dao.getPayData(gdsNum); //�ϳ� ����Ÿ�о����

			if(dto==null) {
				url = cp + "/km/upload.do";
				resp.sendRedirect(url);
			}




			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);
			req.setAttribute("gdsPrice", dto.getGdsPrice());
			req.setAttribute("workDate", dto.getWorkDate());
			


			url =  "/kmong/kmBoard/payment.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("list2.do")!=-1) {
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;
			
			String categoryNum =  req.getParameter("ctgNum");
			
			String category = categoryNum;
			
			List<SubCateDTO> lists3 = dao.getSubCate(categoryNum);
			CategoryDTO dto3 = dao.getCategory(categoryNum);
			
			
			
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
				searchKey = "gdsDes";
				searchValue = "";
			}
			
			//�˻�----------------------------
			
			
			//��ü �������� ����

			int dataCount = dao.getDataCount(searchKey,searchValue, category);

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
			
			
			
			List<KmBoardDTO> lists = dao.getList(start,end,searchKey,searchValue, category);
			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param = "?searchKey=" + searchKey;
				param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			
			HttpSession session = req.getSession();
			
			Custominfo info = (Custominfo)session.getAttribute("customInfo");
			
			KmmemberDAO dao2 = new KmmemberDAO(conn);
			
			
			if(info != null) {
				
				String userId = info.getUserId();
				
				KmmemberDTO dto2 = dao2.getReadData(userId);
				
				req.setAttribute("dto2", dto2);
				
			}
			
			String articleUrl = cp + "/km/article.do";
			if(param.equals("")){
				
				articleUrl += "?pageNum=" + currentPage;
				
			}else{
				
				articleUrl += param + "&pageNum=" + currentPage;
			}

			String deletePath2 = cp + "/imgBoard/delete.do";
			String imagePath2 = cp + "/pds/saveimgFile";
			req.setAttribute("imagePath2", imagePath2);
			req.setAttribute("deletePath2", deletePath2);
			
			String listUrl = cp + "/km/list2.do" + param;
			
			String pageIndexList = 
					myUtil.pageIndexList(currentPage, totalPage, listUrl, categoryNum);

			String deletePath = cp + "/images/delete.do";
			String imagePath = cp + "/pds/kmFile";
			req.setAttribute("ctgNum", categoryNum);
			req.setAttribute("lists3", lists3);
			dataCount = dao.getDataCount(searchKey,searchValue, category);
			req.setAttribute("dto3", dto3);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("param", param);
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
				
		}

	} 

}
