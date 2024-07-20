package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;


@WebServlet(urlPatterns= {"/admin/video"}, name="/VideoControllerOfAdmin")
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private VideoService videoService = new VideoServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoController() {
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
			String action = request.getParameter("action");
			switch (action) {
			case "view":
				doGetOverView(request, response);
				break;
			case "delete":
				doGetDelete(request, response);
				break;
			case "add":
				request.setAttribute("isEdit", false);
				doGetAdd(request, response);
				break;
			case "edit":
				request.setAttribute("isEdit", true);
				doGetEdit(request, response);
				break;
			
			}
		}else {
			response.sendRedirect("index");
		}
	}
	
	protected void doGetOverView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Video> videos = videoService.findAll();
		request.setAttribute("videos", videos);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/video-overview.jsp");
		rd.forward(request, response);
	}
	
	protected void doGetDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		String href = request.getParameter("href");
		Video videoDeleted = videoService.delete(href);
		if (videoDeleted != null) {
			response.setStatus(204);
		}else {
			response.setStatus(400);
		}
	}
	protected void doGetAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/video-edit.jsp");
		rd.forward(request, response);
	}
	
	protected void doGetEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String href = request.getParameter("href");
		Video video = videoService.findByHref(href);
		request.setAttribute("video", video);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/video-edit.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = request.getParameter("action");
			switch (action) {
			case "add":
				doPostAdd(request, response);
				break;
			case "edit":
				doPostEdit(request, response);
				break;
			}
		}else {
			response.sendRedirect("index");
		}
	}
	
	protected void doPostAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String description = request.getParameter("description");
		String poster = request.getParameter("poster");

		Video video = new Video();
		video.setTitle(title);
		video.setHref(href);
		video.setDescription(description);
		video.setPoster(poster);
		
		Video videoReturn = videoService.create(video);
		if (videoReturn != null) {
			response.setStatus(204);
		}else {
			response.setStatus(400);
		}
	}
	
	protected void doPostEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String description = request.getParameter("description");
		String poster = request.getParameter("poster");
		String hrefOrigin = request.getParameter("hrefOrigin");
		
		Video video = videoService.findByHref(hrefOrigin);
		video.setTitle(title);
		video.setHref(href);
		video.setDescription(description);
		video.setPoster(poster);
		
		Video videoReturn = videoService.update(video);
		if (videoReturn != null) {
			response.setStatus(204);
		}else {
			response.setStatus(400);
		}
	}
	
}
