package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.FileBean;
import it.unisa.model.FileModelDS;
import it.unisa.model.MaterialBean;

@WebServlet("/BuyMaterial")
public class BuyMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BuyMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session==null) {
			response.sendRedirect("homepage.jsp");
		}
		Collection<MaterialBean>cart=(Collection<MaterialBean>)session.getAttribute("cart");
		String tot=request.getParameter("totale");
		int totale=Integer.parseInt(tot);
		int coins=(int)session.getAttribute("coin");
		//try {
			if(totale<=coins) {
				if(cart!=null&&cart.size()>0){
					Iterator<?> it=cart.iterator();
					while(it.hasNext()) {
						MaterialBean material=(MaterialBean)it.next();
						//download
						
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DownloadFile?filename="+material.getFileName());
						//request.setAttribute("filename", material.getFileName());
						dispatcher.forward(request, response);
						return;
						/*String filename=material.getFileName();
						System.out.println(filename);
						DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
						FileModelDS model= new FileModelDS(ds);


						try{
							FileBean bean= model.doRetrieveByKey(filename);
							response.setHeader("Content-Disposition","attachment; filename="+bean.getFilename());//attachment dopo la virgola per scaricare direttamente
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
							
						}catch (Exception e){
							e.printStackTrace();
						}*/
						
					}
					cart.clear();
					session.setAttribute("cart",cart);
				}
			}
			else
				System.out.println("Non hai abbastanza coin");
		/*}finally {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cart.jsp");
			dispatcher.forward(request, response);
		}*/


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
