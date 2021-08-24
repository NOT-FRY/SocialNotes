package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		//TODO validazione
		
		//TODO sessione
		
		
		UserBean user = new UserBean();
		
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		UserModelDS model= new UserModelDS(ds);
		try {
			model.doRetrieveByKey(uemail);
		}catch(SQLException e) {
			
		}
		//TODO mail e password corrispondono
		
		
		response.sendRedirect("homepage_user.jsp");
		doGet(request, response);
	}

}
