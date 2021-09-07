package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.model.FileBean;
import it.unisa.model.FileModelDS;

@WebServlet("/DownloadFile")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DownloadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename=(String) request.getParameter("filename");
		System.out.println(filename);
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		FileModelDS model= new FileModelDS(ds);


		try{
			FileBean bean= model.doRetrieveByKey(filename);
			response.setHeader("Content-Disposition", "attachment; filename="+bean.getFilename());//attachment dopo la virgola per scaricare direttamente
			response.setContentType("application/pdf");
			InputStream is=bean.getContenuto();



			OutputStream outStream = response.getOutputStream();
			byte[] buf = new byte[4096];
			int len = -1;

			//Write the file contents to the servlet response
			//Using a buffer of 4kb (configurable). This can be
			//optimized based on web server and app server
			//properties
			while ((len = is.read(buf)) != -1) {
				outStream.write(buf, 0, len);
			}

			outStream.flush();
			outStream.close();
		}catch (Exception e){}
		
	    response.sendRedirect("/BuyMaterial");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
