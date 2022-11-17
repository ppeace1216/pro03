package kr.go.jeonju.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.jeonju.dto.TourDTO;
import kr.go.jeonju.model.TourDAO;


@WebServlet("/AddTourCtrl.do")
public class AddTourCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String cate = request.getParameter("cate");
		String tourno = request.getParameter("tourno");
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		String content = request.getParameter("content");
		
		TourDTO dto = new TourDTO();
		dto.setCate(cate);
		dto.setTourno(tourno);
		dto.setTitle(title);
		dto.setSubtitle(subtitle);
		dto.setContent(content);
		
		TourDAO dao = new TourDAO();
		int cnt = dao.addTour(dto);
		
		if(cnt>=1){
			response.sendRedirect("GetTourListCtrl.do");
		} else {
			response.sendRedirect("./tour/addTour.jsp");
		}
	}
}