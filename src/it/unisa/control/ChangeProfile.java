package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeProfile
 */
@WebServlet("/ChangeProfile")
@MultipartConfig(maxFileSize = 1024*1024*5)
public class ChangeProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangeProfile() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nome e cognome titolare
		//da controllare se diversi da null
		//da fare controlli
		
		String mail = request.getParameter("mail");
		
		// DATABASE?
		String nomeuni = request.getParameter("nomeuni");
		String indirizzo = request.getParameter("indirizzo");
		String dipartimento = request.getParameter("dipartimento");
		
		String current_password = request.getParameter("current_password");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		
		//Da prendere il nome del titolare
		String numerocarta = request.getParameter("numcarta");
		// da convertire
		String mesecarta = request.getParameter("month");
		String annocarta = request.getParameter("year");
		//CVC non lo prendo
		
		System.out.println("mail:"+mail+
				"\n nomeuni:"+nomeuni+
				"\n indirizzo:"+indirizzo+
				"\n dipartimento:"+dipartimento+
				"\n current_password:"+current_password+
				"\n password:"+password+
				"\n confirm_password:"+confirm_password+
				"\n numerocarta:"+numerocarta+
				"\n mesecarta:"+mesecarta+
				"\n annocarta:"+annocarta);
		
		
		doGet(request, response);
	}

}
