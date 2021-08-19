package it.socialnotes.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registrazione
 */
@WebServlet("/CheckUsernameAvailableAJAX")
public class CheckUsernameAvailableAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckUsernameAvailableAJAX() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/strings");
		String name=request.getParameter("param");
		PrintWriter out = response.getWriter();
		if(name!=null) {
			System.out.println(name);
			if(name.equals("Cristiano")||name.equals("Ronaldo")) {
				out.write("false");
				System.out.println("non disponibile");
			}
			else {
				out.write("true");
				System.out.println("disponibile");
			}
			
		}
	}

}
