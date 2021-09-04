<%@page import="it.unisa.model.MaterialModelDS"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.mysql.cj.jdbc.Blob"%>
 <%@page import="java.io.InputStream"%>  
 <%@page import="java.util.Collection"%>
 <%@page import="it.unisa.model.MaterialBean"%> 
 <%@page import="java.util.Iterator"%>
 <%@page import="java.sql.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Gestione Materiale</title>
    <link rel="stylesheet" type="text/css" href="css/materiale.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  </head>
  <body>
  <%
	  if (session.getAttribute("username")==null)
		  response.sendRedirect("login.jsp");

	  DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
	  MaterialModelDS material=new MaterialModelDS(ds);
	  UserModelDS user=new UserModelDS(ds);
	  Collection<MaterialBean> materials=material.notValidated();
  %>
  <%@include file="header_user.jsp" %>
    <div class="container">
    	<div class="row">
    	<%
	    	if(materials!=null&&materials.size()>0){
				Iterator<?> it=materials.iterator();
				while(it.hasNext()){
    				MaterialBean mat=(MaterialBean)it.next();
    				UserBean bean=user.doRetrieveByUsername(mat.getUsername());
    				Date dataAttuale = new Date(System.currentTimeMillis());
					Date dataCaricamento=mat.getDataCaricamento();
					long diffInMillies=dataAttuale.getTime()-dataCaricamento.getTime();
					long diff=TimeUnit.DAYS.convert(diffInMillies,TimeUnit.MILLISECONDS);
    				
    	%>
    	<div class="card social-timeline-card">
					<div class="card-header">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex justify-content-between align-items-center">
								<div class="mr-2">
									<img class="rounded-circle"src="PrintImage?username=<%=mat.getUsername()%>" alt="ciao" width="45">
								</div>
								<div class="ml-2">
									<div class="h5 m-0 text-blue"><%=mat.getUsername() %></div>
									<div class="h7 text-muted"><%=bean.getNome() %> <%=bean.getCognome() %></div>
								</div>
							</div>
							<div>
								<!-- <div class="dropdown">
									<button class="btn btn-link dropdown-toggle" type="button"
										id="gedf-drop11" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="fa fa-ellipsis-h"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-right"
										aria-labelledby="gedf-drop11" x-placement="bottom-end"
										style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(42px, 38px, 0px);">
										<div class="h6 dropdown-header">Configuration</div>
										<a class="dropdown-item" href="#">Save</a> <a
											class="dropdown-item" href="#">Hide</a> <a
											class="dropdown-item" href="#">Report</a>
									</div>
								</div> -->
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="text-muted h7 mb-2">
							<i class="fa fa-clock-o"></i><%=diff %> days ago
						</div>
						<a class="card-link" href="provaDownloadFile.jsp?filename=<%=mat.getFileName()%>"><h5 class="card-title"><%=mat.getDescrizione() %></h5> </a> 
						<img src="PrintAnteprima?codice=<%=mat.getCodiceMateriale() %>" height="500px" width="500px"
							class="img-fluid">
					</div>
					<div class="card-footer">
						<form method="post" action=<%="SetPrice;jsessionid="+session.getId()%> enctype="multipart/form-data">
							<div class="btn-group">
								<input type="hidden" name="codice" value="<%=mat.getCodiceMateriale() %>">
								<input type="number" class="form-control" name="costo" id="costo" placeholder="Costo" required>&nbsp&nbsp&nbsp&nbsp
								<button type="submit" class="btn bottone-principale text-light" style="background-color: #9697e7" onclick="prova()">Imposta prezzo</button>
							</div>
						</form>
					</div>
				</div>
				
				<br>
				<hr>
				<%}} %>
				
			
    	</div>
    </div>
    <br>
<%@include file="footer.jsp" %>
  </body>
</html>
