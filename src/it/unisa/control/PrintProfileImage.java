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
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Blob;


@WebServlet("/PrintProfileImage")
public class PrintProfileImage extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public PrintProfileImage() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("username")==null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
		response.setContentType("image/png");
		try{
			Blob image=(Blob)session.getAttribute("img");
				InputStream is=image.getBinaryStream();
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
		}catch (Exception e){
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
