package kr.go.jeonju.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.jeonju.dto.ImpDTO;
import kr.go.jeonju.dto.PicDTO;
import kr.go.jeonju.dto.TourDTO;
import kr.go.jeonju.model.ImpDAO;
import kr.go.jeonju.model.TourDAO;


@WebServlet("/AddImpressCtrl.do")
public class AddImpressCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sid");
		
		String cate = request.getParameter("cate");
		String tourno = request.getParameter("tourno");
		String content = request.getParameter("content");
		Double star = Double.parseDouble(request.getParameter("star"));
		
		TourDAO picture = new TourDAO();
		PicDTO pic = picture.getPic(tourno);
		TourDTO tour = picture.getTitle(tourno); 
		
		String imgSrc = pic.getPicname();
		
		ImpDTO dto = new ImpDTO();
		dto.setCate(cate);
		dto.setTourno(tourno);
		dto.setId(id);
		dto.setContent(content);
		dto.setStar(star);
		dto.setImgSrc(imgSrc);
		
		ImpDAO dao = new ImpDAO();
		dto.setPlace(tour.getTitle());
		dao.addImpress(dto);
		
		response.sendRedirect("GetImpressListCtrl.do");
	}
}