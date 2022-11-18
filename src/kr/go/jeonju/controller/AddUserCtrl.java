package kr.go.jeonju.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.jeonju.dto.UserDTO;
import kr.go.jeonju.model.UserDAO;
import kr.go.jeonju.service.AES256;

@WebServlet("/AddUserCtrl.do")
public class AddUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		String addr1 = request.getParameter("address1");
		String addr2 = request.getParameter("address2");
		
		boolean result = false;
		int cnt = 0, suc = 0;
		UserDAO dao = new UserDAO();
		cnt = dao.idCheckPro(id);
		
		
		UserDTO user = new UserDTO();
		//비밀번호를 암호화
		String key = "%02x";
		String encrypted = "";
		try {
			encrypted = AES256.encryptAES256(pw, key);
			System.out.println("비밀번호 암호화 : "+encrypted);
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(cnt>=1){ 		//이미 있는 아이디일 경우
			result = false;
			response.sendRedirect("./user/join.jsp?qid="+id);
		} else {	//없는 아이디인 경우
			result = true;	//true로 바꿔서 가입이 가능하게 함
			user.setId(id);
			user.setPw(encrypted);
			user.setName(name);
			user.setEmail(email);
			user.setBirth(birth);
			user.setTel(tel);
			user.setAddr(addr1 + "<br>" + addr2);
			suc = dao.addUser(user);
			if(suc>=1){
				response.sendRedirect("./user/login.jsp");
			} else {
				response.sendRedirect("./user/join.jsp?qid="+id);
			}
		}
	}
}
