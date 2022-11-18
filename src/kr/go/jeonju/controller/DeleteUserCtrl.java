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
		
		if (id=="admin"){
			if (cnt>=1){
				response.sendRedirect("/WEB-INF/user/userList.jsp");
			} else {
				response.sendRedirect("GetUserDetailCtrl.do?id="+id);
			}
		} else {
			if (cnt>=1){
				session.invalidate();
				response.sendRedirect(request.getContextPath());
			} else {
				response.sendRedirect("UserInfoCtrl.do?id="+id);
			}
		}
	}
}
