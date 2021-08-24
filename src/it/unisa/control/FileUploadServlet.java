package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;


import it.unisa.model.FileBean;
import it.unisa.model.FileModelDS;

@WebServlet("/FileUploadServlet")
@MultipartConfig(maxFileSize = 1024*1024*50)  
public class FileUploadServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = -4001419296020204828L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields
		//String description = request.getParameter("Descrizione");

		InputStream is = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
		FileBean file=new FileBean();
		Part filePart = request.getPart("Contenuto");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			//inserimento informazioni nel bean
			file.setFilename(filePart.getSubmittedFileName());
			file.setFormato(filePart.getContentType());
			file.setDimensione((int)filePart.getSize());

			is=filePart.getInputStream();
			file.setContenuto(is);


			// obtains input stream of the upload file

		}



		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		FileModelDS model= new FileModelDS(ds);
		try {
			model.doSave(file);
		} 
		catch (SQLException e) {
			String error = "Spiacenti, la registrazione non � andata a buon fine.";
			request.setAttribute("error", error);
			//Mando una alert 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		} 
	}
}