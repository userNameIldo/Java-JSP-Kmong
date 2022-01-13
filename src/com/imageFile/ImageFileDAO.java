package com.imageFile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ImageFileDAO {
	private Connection conn;
	public ImageFileDAO(Connection conn) {

		this.conn = conn;
	}
	
	//������ �߰�
	
	public int insertData(ImageFileDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "insert into imageFile (num,subject,saveFileName) values (?,?,?)";


			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//��ü�������� ����
	public int getDataCount(String searchKey, String searchValue) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			searchValue = "%" + searchValue + "%";
			
			sql = "select nvl(count(*),0) from imageFile ";
			sql+= "where " + searchKey + " like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	public int getMaxNum() {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		try {
			sql = "select nvl(max(num),0) from imageFile";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	
	//��ü������ ��������
	public List<ImageFileDTO> getList(int start,int end,String searchKey, String searchValue){
		
		List<ImageFileDTO> lists = new ArrayList<ImageFileDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			searchValue = "%" + searchValue + "%";
			sql = "select * from("
		               + "select rownum rnum, data.* from("
		               + "select num, subject, saveFileName from imageFile where " + searchKey + " like ? order by num desc) data ) "
		               + "where rnum>=? and rnum <=?";

			

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);

			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ImageFileDTO dto  = new ImageFileDTO();

				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				lists.add(dto);

			}
			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	
	//������ ��ȸ
	public ImageFileDTO getReadData(int num){

		ImageFileDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select num,subject,saveFileName from imageFile where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto  = new ImageFileDTO();

				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));


			}
			pstmt.close();
			rs.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	
	//�̹�������
	public int deleteData(int num) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete imageFile where num=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result  = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
