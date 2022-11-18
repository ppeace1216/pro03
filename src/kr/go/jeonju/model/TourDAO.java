package kr.go.jeonju.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.jeonju.dto.NoticeDTO;
import kr.go.jeonju.dto.PicDTO;
import kr.go.jeonju.dto.TourDTO;

public class TourDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int loadLastNo() {
		int no = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.LOAD_LAST_NO);
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

	public int addTour(TourDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.ADD_TOUR);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getSubtitle());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getAddr());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public ArrayList<TourDTO> getTourList() {
		ArrayList<TourDTO> tourList = new ArrayList<TourDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_LIST_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TourDTO tour = new TourDTO();
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setTitle(rs.getString("title"));
				tour.setRegdate(rs.getString("regdate"));
				tourList.add(tour);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tourList;
	}

	public TourDTO getTour(int no) {
		TourDTO tour = new TourDTO();
		try {
			con = Maria.getConnection();
			//읽은 횟수 증가
			pstmt = con.prepareStatement(Maria.TOUR_VISITED_UPDATE);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = con.prepareStatement(Maria.TOUR_LIST_DETAIL);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setTitle(rs.getString("title"));
				tour.setSubtitle(rs.getString("subtitle"));
				tour.setContent(rs.getString("content"));
				tour.setRegdate(rs.getString("regdate"));
				tour.setVisited(rs.getInt("visited"));
				tour.setAddr(rs.getString("addr"));
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tour;
	}

	public int delTour(int no) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//글 삭제
			pstmt = con.prepareStatement(Maria.TOUR_DEL);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}
}
