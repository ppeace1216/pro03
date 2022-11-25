package kr.go.jeonju.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.jeonju.dto.PlaceDTO;
import kr.go.jeonju.model.PlaceDAO;


@WebServlet("/GetPlaceListCtrl.do")
public class GetPlaceListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PlaceDAO dao = new PlaceDAO();
		ArrayList<PlaceDTO> placeList = dao.getPlaceList();
		
		//dao로 부터 받은 데이터를 view에 디스패치함
		request.setAttribute("list", placeList);
		
		RequestDispatcher view = request.getRequestDispatcher("/place/placeList.jsp");
		view.forward(request, response);
	}
}
