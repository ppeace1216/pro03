package kr.go.jeonju.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Maria {
    static final String DRIVER = "org.mariadb.jdbc.Driver";
    static final String URL = "jdbc:mariadb://127.0.0.1:3308/goverment?serverTimezone=Asia/Seoul";
    static final String USER = "root";
    static final String PW = "1234";
    
	public final static String TEST_SELECT_ONE = "select * from test where name=?";
	public final static String TEST_SELECT_ALL = "select * from test";
    
	final static String NOTICE_SELECT_ALL = "select * from notice order by regdate desc";
	final static String NOTICE_VISITED_UPDATE = "update notice set visited = visited + 1 where no=?";
	final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
	final static String NOTICE_INSERT = "insert into notice(title, content) values (?, ?)";
	final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
	final static String NOTICE_DELETE = "delete from notice where no=?";
	
	final static String USER_JOIN = "insert into user(id, pw, name, birth, email, tel, addr) values (?,?,?,?,?,?,?)";
	final static String USER_LOGIN = "select * form user where id=? and pw=?";
	final static String USER_ID_CHECK = "select * from user where id=?";
	final static String USER_ALL = "select * from user";
	final static String USER_UPDATE = "update user set pw=?, name=?, birth=?, email=?, tel=?, addr=? where id=?";
	final static String USER_VISIT_UPDATE = "update user set visted=visted+1 where id=?";
	final static String USER_DELETE = "delete from user where id=?";
	
	final static String LOAD_LAST_NO = "select no from tour order by no desc limit 1";
	final static String FILE_UPLOAD = "insert into pic(tourno, picname, pos) values (?,?,?)";
	final static String JSON_PICLIST = "select * from pic where tourno=?";
	final static String PIC_SELECT_ONE = "select * from pic where tourno=? order by pos asc limit 1";
	final static String ADD_TOUR = "insert into tour(tourno, cate, title, subtitle, content, addr) values (?,?,?,?,?,?)";
	final static String TOUR_LIST_ALL = "select * from tour";
	final static String TOUR_CATE_LIST = "select a.no, a.tourno, a.cate, a.title, a.subtitle, a.content, b.picname, b.pos from tour a inner join pic b on a.tourno=b.tourno where a.cate=? and b.pos=1";
	final static String TOUR_VISITED_UPDATE = "update tour set visited = visited + 1 where no=?";
	final static String TOUR_IMPRESS_PLACE = "select * from tour where tourno=?";
	
	final static String TOUR_SEARCH_PLACE_LIST = "select * from tour where title like CONCAT('%',?,'%')"; //'%'+?+'%'
	final static String TOUR_SEARCH_COMMENT_LIST = "select * from tour where content like ?";
	final static String TOUR_SEARCH_ALL_LIST = "select * from tour where title like ? or content like ?";
	final static String TOUR_LIST_DETAIL = "select * from tour where no=?";
	final static String TOUR_DEL = "delete from tour where no=?";
	final static String MODIFY_TOUR = "update tour set tourno=?, cate=?, title=?, subtitle=?, content=?, addr=? where no=?";
	
	final static String LOAD_LAST_PNO = "select no from place order by no desc limit 1";
	final static String ADD_PLACE = "insert into place(tourno, cate, place, comment1, comment2, addr, tel) values (?,?,?,?,?,?,?)";
	final static String PLACE_LIST_ALL = "select * from place";
	final static String PLACE_IMPRESS_PLACE = "select * from place where tourno=?";
	final static String PLACE_CATE_LIST = "select a.no, a.tourno, a.cate, a.place, a.comment1, a.addr, a.tel, b.picname, b.pos from place a inner join pic b on a.tourno=b.tourno where a.cate=? and b.pos=1";
	
	final static String PLACE_SEARCH_PLACE_LIST = "select * from place where title like CONCAT('%',?,'%')"; //'%'+?+'%'
	final static String PLACE_SEARCH_COMMENT_LIST = "select * from place where content like ?";
	final static String PLACE_SEARCH_ALL_LIST = "select * from place where title like ? or content like ?";
	final static String PLACE_LIST_DETAIL = "select * from place where no=?";
	final static String PLACE_DEL = "delete from place where no=?";
	final static String MODIFY_PLACE = "update place set tourno=?, cate=?, title=?, subtitle=?, content=?, addr=?, tel=? where no=?";
	
	public static final String IMPRESS_SELECT_ALL = "select * from impress order by regdate desc";
	public static final String IMPRESS_SELECT_ONE = "select * from impress where no=?";
	public static final String IMPRESS_INSERT = "insert into impress(cate, tourno, id, content, star, imgSrc) values (?,?,?,?,?,?)";
	public static final String IMPRESS_DELETE = "delete from impress where no=?";
	public static final String IMPRESS_UPDATE = "update impress SET content=?, star=? where id=? and no=?";
	
	public static final String QNA_SELECT_ALL = "select * from qna order by parno desc, no asc, lev asc";
	public static final String QNA_VISITED_UPDATE = "update qna set visited=visited+1 where no=?";
	public static final String QNA_SELECT_ONE = "select * from qna where no=?";
	public static final String QNA_INSERT = "insert into qna(title, content, author, lev, sec) values (?,?,?,?,?)";
	public static final String QNA_SELECT_UP = "select no from qna order by regdate desc limit 1";
	public static final String QNA_INSERT_UPDATE = "update qna set parno=no where lev = 0 AND no=?";
	public static final String QNA_DELEDTE = "delete from qna where no=?";
	public static final String QNA_ALL_DELEDTE = "delete from qna where parno=?";
	public static final String QNA_UPDATE = "update qna set title=?, content=?, author=?, sec=?, lev=? where no=?";
	public static final String QNA_REPLY_INSERT = "insert into qna(title, content, author, lev, parno, sec) values (?,?,?,?,?,?)";
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(URL, USER, PW);
		return con;
	}
	
	public static void close(PreparedStatement pstmt, Connection con) {
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if(rs!=null){
			try {
				rs.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
