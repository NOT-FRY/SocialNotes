package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.model.MaterialBean;
import it.unisa.model.MaterialModelDS;
import it.unisa.model.UserModelDS;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String str = (String)request.getParameter("ricerca");
		System.out.println("STRINGA: "+str);
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		MaterialModelDS model= new MaterialModelDS(ds);
		
		
		

		try {
			Collection<MaterialBean> material= model.doRetrieveByString(str);
			
			
			request.setAttribute("materiale", material);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Search.jsp");
			dispatcher.forward(request, response);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
