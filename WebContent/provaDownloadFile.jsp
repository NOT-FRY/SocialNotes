<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.nio.Buffer"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.sql.DataSource,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setContentType("application/pdf");
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		FileModelDS model= new FileModelDS(ds);
		FileBean bean= model.doRetrieveByKey("Esercizi8.pdf");
		try{
			InputStream is=bean.getContenuto();
			/*byte[] bytes=new byte[1024*1024*50];
			int bytesRead;
			while((bytesRead=is.read(bytes))!=-1){
				response.getOutputStream().write(bytes, 0, bytesRead);
			}*/
			Part p=request.getPart("Contenuto");
			System.out.println("Ciao");
		}
		catch(Exception e){
			throw new ServletException(e);
		}
	
	%>
</body>
</html>