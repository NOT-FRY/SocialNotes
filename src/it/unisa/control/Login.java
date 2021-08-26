package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.UserBean;
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
		
		HttpSession session = request.getSession(true);
		System.out.println("SSSSSS:"+session.getId());
		if(session.getAttribute("username")!=null){
			String link = "homepage_user.jsp";
			 String encodedURL = response.encodeRedirectURL(link);
			 response.sendRedirect(encodedURL);
		}else {
		
		String login = request.getParameter("login");
		String pwd = request.getParameter("password");
		//System.out.println(login);
		//System.out.println(pwd);

		//TODO validazione

		//TODO sessione



		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		UserModelDS model= new UserModelDS(ds);
		try {
			UserBean bean = model.checkLogin(login, pwd);
			if (bean==null) {
				String error="Login e/o password non corretti.";
				request.setAttribute("error",error);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
				
			}
			else {
		   // System.out.println("USERNAME: "+bean.getUsername());		
			session.setAttribute("username",bean.getUsername());
			session.setAttribute("nome",bean.getNome());
			session.setAttribute("cognome",bean.getCognome());
			session.setAttribute("img",bean.getImg());
			session.setAttribute("email",bean.getEmail());
			session.setAttribute("password",bean.getPass());
			session.setAttribute("dataNascita",bean.getDataNascita());
			session.setAttribute("matricola",bean.getMatricola());
			session.setAttribute("ultimoAccesso",bean.getUltimoAccesso());
			session.setAttribute("coin",bean.getCoin());
			session.setAttribute("ban",bean.getBan());
			session.setAttribute("denominazione",bean.getDenominazione());
			session.setAttribute("dipName",bean.getDipName());
				
			String homeURL = response.encodeURL("homepage_user.jsp");
			
			response.sendRedirect(homeURL);
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
}