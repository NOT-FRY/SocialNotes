<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.nio.Buffer"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.sql.DataSource,it.unisa.model.*"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
	//MaterialModelDS model= new MaterialModelDS(ds);
	//MaterialBean bean= model.doRetrieveByKey("1");
	//response.setHeader("Content-Disposition", "filename="+bean.getFilename());
		response.setContentType("image/png");

		try{
			//InputStream is=bean.getAnteprima();
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
		}catch (Exception e){}
	%>
</body>
</html>