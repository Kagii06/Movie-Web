package com.poly.controller;

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
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = {"/video"})
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);
		
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		switch (actionParam) {
		case "watch":
			doGetWatch(session, href, req,resp);
			break;
		case "like":
			doGetLike(session, href, req,resp);
			break;
		default:
			break;
		}
	}
	
	private void doGetWatch(HttpSession session, String href,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);
		
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		
		if (currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLikedBtn", history.getIsLiked());
		}
		
		RequestDispatcher rq = req.getRequestDispatcher("/views/user/video-detail.jsp");
		rq.forward(req, resp);
	}
	
	private void doGetLike(HttpSession session, String href,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null) {
		boolean result = historyService.updateLikeOrUnLike(currentUser, href);
		if (result == true) {
			resp.setStatus(204); //succeed but no data
		}else {
			resp.setStatus(400);
		}
		}
	}
	
}
