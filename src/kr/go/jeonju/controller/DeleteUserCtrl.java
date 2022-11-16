package kr.go.jeonju.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.jeonju.model.UserDAO;


@WebServlet("/DeleteUserCtrl.do")
public class DeleteUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		
		UserDAO dao = new UserDAO();
		int cnt = dao.userDelete(id);
		
		if (cnt>=1){
			if (id.equals("admin")){
				response.sendRedirect("/WEB-INF/user/userList.jsp");
			} else {
				session.invalidate();
				response.sendRedirect("/");
			}
		} else {
			if (id.equals("admin")){
				response.sendRedirect("/WEB-INF/user/userUpdate.jsp");
			} else {
				response.sendRedirect("/WEB-INF/user/userDetail.jsp");
			}
		}
	}

}
