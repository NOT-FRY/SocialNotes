package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.model.UserBean;
import it.unisa.model.UserModelDS;

/**
 * Servlet implementation class SignupControl
 * Registra l'utente
 */
@WebServlet("/SignupControl")
public class SignupControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignupControl() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//TODO controlli lato server
		
		
		String username = request.getParameter("username");
		String nome = request.getParameter("firstName");
		String cognome = request.getParameter("lastName");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
        String nascita = request.getParameter("nascita");
		String denomonazione = request.getParameter("uni");
		String dipName = request.getParameter("corso");
		
	    java.util.Date javaDate = new java.util.Date();
	    long javaTime = javaDate.getTime();
		Timestamp ultimoAccesso = new Timestamp(javaTime);
		
		Date dataNascita = new Date(System.currentTimeMillis());
		
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-gg");
			java.util.Date data = formatter.parse(nascita);
			dataNascita = new Date(data.getTime());
		}catch(Exception e) {
			
		}
		
		
		if(!checkValidity(nome,cognome,username,pwd,email)) {
			String error = "Spiacenti, la registrazione non � andata a buon fine.";
			request.setAttribute("error", error);
			//Mando una alert 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatcher.forward(request, response);	
		}else {
			request.removeAttribute("error");
		}
		
		UserBean user = new UserBean();
		
		user.setNome(nome);
		user.setCognome(cognome);
		user.setUsername(username);
		user.setPass(pwd);
		user.setEmail(email);
		user.setDenominazione(denomonazione);
		user.setDipName(dipName);
		user.setUltimoAccesso(ultimoAccesso);
		user.setDataNascita(dataNascita);
		
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		UserModelDS model= new UserModelDS(ds);
		
	
		
			try {
				model.doSave(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//System.out.println("ho lanciato l'eccezione");
				String error = "Spiacenti, la registrazione non � andata a buon fine.";
				request.setAttribute("error", error);
				//Mando una alert 
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
				dispatcher.forward(request, response);
				e.printStackTrace();
			}
		//	System.out.println("Ciao");
	
		
		
		
		response.sendRedirect("success.html");
		
		
		
		doGet(request, response);
	}
	//Da migliorare il filtro
	private boolean checkValidity(String nome,String cognome,String uname,String pwd, String email) {
		if(nome!=null && nome != "") {
			if(cognome!=null && cognome!= "") {
				if(uname!=null && uname!= "") {
					if(pwd!=null && pwd != "") {
						if(email!=null && email != "") {
							return true;
						}
					}
				}
			}
		}
		return false;
	}
	
}
