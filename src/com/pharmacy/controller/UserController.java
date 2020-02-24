package com.pharmacy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.jrockit.jfr.RequestDelegate;
import com.pharmacy.data.UserDAOImpl;
import com.pharmacy.model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAOImpl userUtil;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		@Override
	public void init() throws ServletException {
		userUtil = new UserDAOImpl();
		super.init(); 
		//init is use only once in whole life by the first user only rest user reuse the object
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException{
	
	try 
	{
		String command=request.getParameter("command");
		switch(command)
		{
		case "ADD":
			addUser(request, response);
			break;
			
		case "USER":
			getUser(request, response);
			break;
			
		case "LOGOUT":
			logOut(request, response);
			break;
		}
		
	}
	catch (Exception e)
	{
		throw new ServletException(e);
		
	}
}
	
	
	private void logOut(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session= request.getSession();
		session.invalidate();
		String message= "log out successfully";
		RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
		request.setAttribute("msg", message);
		rd.forward(request, response);
		
	}

	private void getUser(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		
		String message=null;
		String resource="login.jsp";
		
		try {
			
			User user = userUtil.getUser(userId);
			if(user.getPassword().equals(password))
			{
				resource = "ItemController";
				HttpSession session=request.getSession();// this is use for session 
				session.setAttribute("user", user);
			}
			else {
				message = "Wrong password : please try again";
			}
		}
		catch (Exception e) 
		{
			message = e.getMessage();
		}
		request.setAttribute("msg", message);
		RequestDispatcher rd = request.getRequestDispatcher(resource);
		rd.forward(request, response);
		// TODO Auto-generated method stub
		
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	
	
	{
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String firstName=request.getParameter("FirstName");
		String lastName=request.getParameter("LastName");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		
		String message= null;	//
		String resource="signup.jsp";
		
		User user=new User(userId, password, firstName, lastName, address, city );
				
					try
					{
					userUtil.addUser(user);
					System.out.println("Record Inserted Successfully");
					message="signup Insert successfully: please Login";
					resource="login.jsp";
					
					}
		catch (Exception e) {
		message = e.getMessage();					//System.out.println(e);
		}
		
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher(resource);
					rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
