package com.util;

public class MyUtil {
	
	//��ü��������
	//numPerPage => ���������� ���� �� dataCount => ��ü ����Ÿ ��
	public int getPageCount(int numPerPage, int dataCount) {
	
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage !=0) {
			
			pageCount++;
			
		}
		
		return pageCount;
		
	}
	
	//������ó��
	
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //�� ����  6  7  8  9  10   �� ����
		int currentPageSetup; // �� ����(ǥ���� 6 - 1�� 5�� ��)
		int page; // 6  7  8  9  10 for���� i���� ����
		
		StringBuffer sb = new StringBuffer();		
				
		if(currentPage == 0 || totalPage == 0) {
			
			return "";
			
		}
		
		//�˻�x : list.jsp
		//�˻�o : list.jsp?searchKey=subject&searchValue=3
		
		if(listUrl.indexOf("?") != -1) {
			
			listUrl = listUrl + "&";
			
		}else {
			
			listUrl = listUrl + "?";
			
		}
		
		//ǥ���� ù �������� -1 ���ذ�
		currentPageSetup = (currentPage/numPerBlock) * numPerBlock;
		
		if(currentPage % numPerBlock == 0) {
			
			currentPageSetup = currentPageSetup - numPerBlock;
			
		}
		
		// �� ���� ��ư
		if(totalPage > numPerBlock && currentPageSetup >0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">�� ����</a>&nbsp;");
			
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) {
				
				sb.append("<font color=\"fuchsia\">" + page + "</font>&nbsp;");
				//<font color = "Fuchsia">6</font>&nbsp;				
				
			}else{
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				
				//<a href="list.jsp?pageNum=7">7</a>&nbsp;
				
			}
			
			page++;
			
			
		
			
		}
		
		//������
		if(totalPage-currentPageSetup>numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">������</a>&nbsp;");
			
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
			
		}	
		
		return sb.toString();
		
	}public String pageIndexList(int currentPage, int totalPage, String listUrl, String ctgNum) {
		
		int numPerBlock = 5; //�� ����  6  7  8  9  10   �� ����
		int currentPageSetup; // �� ����(ǥ���� 6 - 1�� 5�� ��)
		int page; // 6  7  8  9  10 for���� i���� ����
		
		StringBuffer sb = new StringBuffer();		
				
		if(currentPage == 0 || totalPage == 0) {
			
			return "";
			
		}
		
		//�˻�x : list.jsp
		//�˻�o : list.jsp?searchKey=subject&searchValue=3
		
		if(listUrl.indexOf("?") != -1) {
			
			listUrl = listUrl + "&";
			
		}else {
			
			listUrl = listUrl + "?";
			
		}
		
		//ǥ���� ù �������� -1 ���ذ�
		currentPageSetup = (currentPage/numPerBlock) * numPerBlock;
		
		if(currentPage % numPerBlock == 0) {
			
			currentPageSetup = currentPageSetup - numPerBlock;
			
		}
		
		// �� ���� ��ư
		if(totalPage > numPerBlock && currentPageSetup >0) {
			
			sb.append("<a href=\"" + listUrl + "ctgNum=" + ctgNum + "&pageNum=" + currentPageSetup + "\">�� ����</a>&nbsp;");
			
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) {
				
				sb.append("<font color=\"fuchsia\">" + page + "</font>&nbsp;");
				//<font color = "Fuchsia">6</font>&nbsp;				
				
			}else{
				
				sb.append("<a href=\"" + listUrl  +  "ctgNum=" + ctgNum + "&pageNum=" + page + "\">" + page + "</a>&nbsp;");
				
				//<a href="list.jsp?pageNum=7">7</a>&nbsp;
				
			}
			
			page++;
			
		}
		
		//������
		if(totalPage-currentPageSetup>numPerBlock) {
			
			sb.append("<a href=\"" + listUrl +  "ctgNum=" + ctgNum + "&pageNum=" + page + "\">������</a>&nbsp;");
			
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
			
		}	
		
		return sb.toString();
		
	}
	
		

}
