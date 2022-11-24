package kr.go.jeonju.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.jeonju.dto.PicDTO;
import kr.go.jeonju.model.PlaceDAO;
import net.sf.json.JSONObject;

@WebServlet("/PlaceImgResearchCtrl.do")
public class PlaceImgResearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String tourno = request.getParameter("tourno");
			
		PrintWriter out = response.getWriter();
		PlaceDAO place = new PlaceDAO();
		ArrayList<PicDTO> picList = place.JSONPicList(tourno);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("picList", picList);
		
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json);
	}
}