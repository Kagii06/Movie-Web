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
import com.poly.service.UserService;
import com.poly.service.VideoService;
import com.poly.service.impl.UserServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/user" }, name = "/UserControllerOfAdmin")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		} else {
			response.sendRedirect("index");
		}
	}

	protected void doGetOverView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<User> user = userService.findAll();
		request.setAttribute("user", user);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user-overview.jsp");
		rd.forward(request, response);
	}

	protected void doGetDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		String username = request.getParameter("username");
		User userDeleted = userService.delete(username);
		if (userDeleted.getIsActive() == Boolean.FALSE) {
			response.setStatus(204);
		} else {
			response.setStatus(400);
		}
	}

	protected void doGetAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user-edit.jsp");
		rd.forward(request, response);
	}

	protected void doGetEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		User user = userService.findByUsername(username);
		request.setAttribute("user", user);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user-edit.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		} else {
			response.sendRedirect("index");
		}

	}

	protected void doPostAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String userOrigin = request.getParameter("userOrigin");
		
		User userUpdate = userService.findByUsername(userOrigin);
		
		if (userUpdate == null) {
			User user = userService.create(username, password, email);
			if (user != null) {
				response.setStatus(204);
			} else {
				response.setStatus(400);
			}
		}else {
			userUpdate.setUsername(username);
			userUpdate.setPassword(password);
			userUpdate.setEmail(email);
			User userReturn = userService.update(userUpdate);
			if (userReturn != null) {
				response.setStatus(204);
			} else {
				response.setStatus(400);
			}
		}
		
		

	}

	protected void doPostEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String userOrigin = request.getParameter("userOrigin");

		User user = userService.findByUsername(userOrigin);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);

		User userReturn = userService.update(user);
		if (userReturn != null) {
			response.setStatus(204);
		} else {
			response.setStatus(400);
		}
	}

}
