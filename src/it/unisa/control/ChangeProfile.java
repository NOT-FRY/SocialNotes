package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.PaymentMethodModelDS;
import it.unisa.model.UserBean;
import it.unisa.model.UserModelDS;
import it.unisa.utils.Validation;

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
		//da fare controlli javascript
		
		HttpSession session = request.getSession(false);
		if(session==null) {
			 String linkLogin = "login.jsp";
			 String encodeURL = response.encodeRedirectURL(linkLogin);
			 response.sendRedirect(encodeURL);
		}
		
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		UserModelDS model_utente= new UserModelDS(ds);
		
		String username = (String)session.getAttribute("username");
		
		
		String mail = request.getParameter("mail");
		
		if(mail!=null && mail!="" && Validation.validateEmail(mail)) {
			//TODO CAMBIA MAIL
		}
		
		
		// DATABASE?
		String nomeuni = request.getParameter("nomeuni");
		String indirizzo = request.getParameter("indirizzo");
		String dipartimento = request.getParameter("dipartimento");
		
		String current_password = request.getParameter("current_password");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		if(current_password !=null && current_password!="") {
			UserBean bean = new UserBean();
			//Vedo se la password è corretta
			try {
				bean = model_utente.checkLogin(username,current_password);
			}catch(SQLException e) {
				System.out.println("Errore checkLogin in ChangeProfile");
			}
			
			if(password!=null && password!="" && Validation.validatePassword(password)) {
				if(confirm_password!=null && confirm_password!="" && Validation.validatePassword(confirm_password)) {
					if(password.compareTo(confirm_password)==0){
						//TODO CAMBIA PASSWORD
					}
				}
			}
		}

		PaymentMethodModelDS model_carta= new PaymentMethodModelDS(ds);
		
		String nomecarta = request.getParameter("nomecarta");
		String cognomecarta = request.getParameter("cognomecarta");
		String numerocarta = request.getParameter("numcarta");
		String mesecarta = request.getParameter("month");
		String annocarta = request.getParameter("year");
		//CVC non lo prendo
		if(nomecarta!=null && nomecarta!="") {
			if(cognomecarta!=null && cognomecarta!="") {
				if(numerocarta!=null && numerocarta!="") {
					if(mesecarta!=null && mesecarta!="") {
						if(annocarta!=null && annocarta!="") {
							Calendar calendar = Calendar.getInstance();
							calendar.set(Integer.parseInt(annocarta),Integer.parseInt(mesecarta), 1);
							Date datacarta = new Date(calendar.getTimeInMillis());
							//TODO Salva carta
						}
					}
				}
			}
		}
		
		
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
