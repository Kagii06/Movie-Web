package com.poly.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.constant.SessionAttr;
import com.poly.dto.UserDto;
import com.poly.dto.VideoLikedInfo;
import com.poly.entity.User;
import com.poly.service.StatsService;
import com.poly.service.UserService;
import com.poly.service.impl.StatsServiceImpl;
import com.poly.service.impl.UserServiceImpl;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(name = "HomeControllerOfAdmin", urlPatterns = { "/admin", "/admin/favorites" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private StatsService statsService = new StatsServiceImpl(); 
    private UserService userService = new UserServiceImpl();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			
			String path = request.getServletPath();
			switch (path) {
			case "/admin":
				doGetHome(request, response);
				break;
			case "/admin/favorites":
				doGetFavorites(request, response);
				break;
			}
			
		}else {
			response.sendRedirect("index");
		}
		
	}
	
	protected void doGetHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		request.setAttribute("videos", videos);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
		rd.forward(request, response);
	}
	
	protected void doGetFavorites(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String videoHref = request.getParameter("href");
		List<UserDto> users = userService.findUsersLikedVideoByVideoHref(videoHref);
		if (users.isEmpty()) {
			response.setStatus(400);
		}else {
			ObjectMapper mapper = new ObjectMapper();
			String dataResponse = mapper.writeValueAsString(users);
			response.setStatus(200);
			out.print(dataResponse);
			out.flush();
		}
	}
	
	
	protected void doGetUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		List<User> users = userService.findAll();
		if (users.isEmpty()) {
			response.setStatus(400);
		}else {
			ObjectMapper mapper = new ObjectMapper();
			String dataResponse = mapper.writeValueAsString(users);
			response.setStatus(200);
			out.print(dataResponse);
			out.flush();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
