package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.model.UserModelDS;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		
		String login = request.getParameter("login");
		String pwd = request.getParameter("password");
		System.out.println(login);
		System.out.println(pwd);

		//TODO validazione

		//TODO sessione



		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		UserModelDS model= new UserModelDS(ds);
		try {
			if ((!(model.checkLogin(login, pwd).isEmpty()))) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/homepage_user.jsp");
				dispatcher.forward(request, response);
			}
			else {
				String error="Login e/o password non corretti.";
				request.setAttribute("error",error);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			String error="Problema con la query";
			request.setAttribute("error",error);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
		//TODO mail e password corrispondono

		doGet(request, response);
	}


}
