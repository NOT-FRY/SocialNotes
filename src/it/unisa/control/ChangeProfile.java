package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.PaymentMethodBean;
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
		//da fare controlli javascript anche con ajax
		
		String success =""; //I messaggi da mettere negli alert
		String error ="";
		
		
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
		
		if(mail!=null && !mail.trim().equals("") && Validation.validateEmail(mail)) {
			//TODO CAMBIA MAIL
		}
		
		String nomeuni = request.getParameter("nomeuni");
		String indirizzo = request.getParameter("indirizzo");
		String dipartimento = request.getParameter("dipartimento");
		
		String current_password = request.getParameter("current_password");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		if(current_password !=null && !current_password.trim().equals("")) {
			UserBean bean = new UserBean();
			//Vedo se la password � corretta
			try {
				bean = model_utente.checkLogin(username,current_password);
			}catch(SQLException e) {
				System.out.println("Errore checkLogin in ChangeProfile");
			}
			
			if(password!=null && !password.trim().equals("") && Validation.validatePassword(password)) {
				if(confirm_password!=null && !confirm_password.trim().equals("") && Validation.validatePassword(confirm_password)) {
					if(password.compareTo(confirm_password)==0){
						try {
							model_utente.doUpdatePassword(username, confirm_password);
							success+=" Password aggiornata-";
							request.setAttribute("success", success);
							}
						catch(SQLException e) {
							System.out.println("Errore: Password non aggiornata");
							error+=" Errore password non aggiornata";
							request.setAttribute("error",error);	
							
							e.printStackTrace();
						}
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
		/*
		 * 
		 * 
		 * CVC non lo prendo per ora
		 * 
		 * 
		 * 
		 * 
		 * */
		if(nomecarta!=null && !nomecarta.trim().equals("")) {
			if(cognomecarta!=null && !cognomecarta.trim().equals("")) {
				if(numerocarta!=null && !numerocarta.trim().equals("") && numerocarta.length()<=16) { //<=16 vincolo DB
					if(mesecarta!=null && !mesecarta.trim().equals("")) {
						if(annocarta!=null && !annocarta.trim().equals("")) {
							Calendar calendar = Calendar.getInstance();
							calendar.set(Integer.parseInt(annocarta),Integer.parseInt(mesecarta), 1);
							Date datacarta = new Date(calendar.getTimeInMillis());
							PaymentMethodBean pbean = new PaymentMethodBean();
							pbean.setNomeIntestatario(nomecarta);
							pbean.setCognomeIntestatario(cognomecarta);
							pbean.setNumeroCarta(numerocarta);
							pbean.setDataScadenza(datacarta);
							pbean.setUsername(username);
							try {
								model_carta.doSave(pbean);
								success+=" Metodo di pagamento aggiornato-";
								request.setAttribute("success", success);
								
							}catch(SQLException e) {
								System.out.println("Errore: Metodo di pagamento non inserito\n");
								error+=" Errore: metodo di pagamento non aggiornato-";
								request.setAttribute("error",error);							
								e.printStackTrace();
							}
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
				"\n nomecarta:"+nomecarta+
				"\n cognomecarta:"+cognomecarta+
				"\n numerocarta:"+numerocarta+
				"\n mesecarta:"+mesecarta+
				"\n annocarta:"+annocarta+
				"\n username:"+username);
		
		
		doGet(request, response);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/change.jsp");
		dispatcher.forward(request, response);
		
	}

}