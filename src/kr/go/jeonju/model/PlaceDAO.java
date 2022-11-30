package kr.go.jeonju.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.go.jeonju.dto.PicDTO;
import kr.go.jeonju.dto.PlaceDTO;

public class PlaceDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public int loadLastNo() {
		int no = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.LOAD_LAST_PNO);
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				no = rs.getInt("no") + 1;	
			} else { 
				no = 1;	
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return no;
	}

	public int fileUpload(PicDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.FILE_UPLOAD);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getPicname());
			pstmt.setInt(3, dto.getPos());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public ArrayList<PicDTO> JSONPicList(String tourno) {
		ArrayList<PicDTO> picList = new ArrayList<PicDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.JSON_PICLIST);
			pstmt.setString(1, tourno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PicDTO pic = new PicDTO();
				pic.setNo(rs.getInt("no"));
				pic.setTourno(rs.getString("tourno"));
				pic.setPicname(rs.getString("picname"));
				pic.setPos(rs.getInt("pos"));
				picList.add(pic);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return picList;
	}

	public PicDTO getPic(String tourno) {
		PicDTO pic = new PicDTO();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.PIC_SELECT_ONE);
			pstmt.setString(1, tourno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				pic.setNo(rs.getInt("no"));
				pic.setTourno(rs.getString("tourno"));
				pic.setPicname(rs.getString("picname"));
				pic.setPos(rs.getInt("pos"));
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return pic;
	}
	
	public int addPlace(PlaceDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.ADD_PLACE);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getPlace());
			pstmt.setString(4, dto.getComment1());
			pstmt.setString(5, dto.getComment2());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getTel());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public ArrayList<PlaceDTO> getPlaceList() {
		ArrayList<PlaceDTO> placeList = new ArrayList<PlaceDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.PLACE_LIST_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PlaceDTO tour = new PlaceDTO();
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tour.setComment1(rs.getString("comment1"));
				tour.setComment2(rs.getString("comment2"));
				tour.setAddr(rs.getString("addr"));
				tour.setTel(rs.getString("tel"));
				placeList.add(tour);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return placeList;
	}

	public ArrayList<PlaceDTO> getPlaceCateList(String cate) {
		ArrayList<PlaceDTO> placeList = new ArrayList<PlaceDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_CATE_LIST);
			pstmt.setString(1, cate); 
			rs = pstmt.executeQuery();
			while(rs.next()){
				PlaceDTO tour = new PlaceDTO();
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tour.setImgURL(rs.getString("picname"));
				tour.setComment1(rs.getString("comment1"));
				tour.setComment2(rs.getString("comment2"));
				tour.setAddr(rs.getString("addr"));
				tour.setTel(rs.getString("tel"));
				placeList.add(tour);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return placeList;
	}

	public PlaceDTO getPlace(int no) {
		// TODO Auto-generated method stub
		return null;
	}
}
