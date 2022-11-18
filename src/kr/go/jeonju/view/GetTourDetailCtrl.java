package kr.go.jeonju.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.jeonju.dto.PicDTO;
import kr.go.jeonju.dto.TourDTO;
import kr.go.jeonju.model.TourDAO;

@WebServlet("/GetTourDetailCtrl.do")
public class GetTourDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8 초기화
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				
				int no = Integer.parseInt(request.getParameter("no"));
				String tourno = request.getParameter("tourno");
				
				//dao에서 항목 불러오기 호출하여 반환받음
				TourDAO dao = new TourDAO();
				TourDTO dto = dao.getTour(no);
				ArrayList<PicDTO> picList = dao.JSONPicList(tourno);
				
				//dao로 부터 받은 데이터를 view에 디스패치함
				request.setAttribute("dto", dto);
				request.setAttribute("list", picList);
				
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/tour/tourDetail.jsp");
				view.forward(request, response);
	}

}
