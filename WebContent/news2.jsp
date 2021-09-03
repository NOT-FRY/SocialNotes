<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.unisa.model.*,javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SocialNotes - News</title>
<link rel="icon" href="img/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<style>
.paginate_button:hover{
	background:none !important;
	border:none !important;
}
.paginate_button {
	padding: .5em .2em !important;
}

</style>

<style>
.card-horizontal {
  display: flex;
  flex: 1 1 auto;
}

.btn-principale{
	background-color: #9697e7 !important;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.0/datatables.min.js"></script>
<script>

	
$(document).ready(function() {
	$.noConflict();
    $("#table").DataTable({
    		"sPaginationType": "full_numbers",
    		"info":true,
    		//"ordering":false,
    		//"searching":false,
    		"pageLength":6,
    		"lengthChange": false,
    	    language: {
    	        "emptyTable": "La ricerca non ha prodotto risultati",
    	        "infoEmpty": "Nessun risultato disponibile",
    	        "zeroRecords": "Nessun risultato",
	              "paginate": {
	            	  'first':    '<<',
	            	  'last':     '>>',
	                  'previous': 'Precedente',
	                  'next':     'Successivo',
	              },
	              "info": "Pagina _PAGE_ di _PAGES_",
	              "search": "Cerca:",
	  	          "aria": {
		          }
    	      },

    });
} );

</script>

</head>
<body>

 <%    
   if(session.getAttribute("username")==null){
	  System.out.println("L'utente non è loggato");
	  %>
	  <jsp:include page="header.jsp"></jsp:include>
	  <% 
  }else{
	  synchronized(session) {
	  System.out.println("ID SESSIONE NEWS:"+session.getId());
	  Date dataSessione = new Date(session.getCreationTime());
	  System.out.println("Data creazione "+ dataSessione);
	 
	  %>
	  <jsp:include page="header_user.jsp"></jsp:include>
	 <%  
	  }
  } %>



 <!-- DA FARE IMMAGINI E DATE -->



<div class="container">
 <h2 class="pb-2 border-bottom" style="font-family: 'Archivo', sans-serif;">News</h2>
    

  <div class="col" style="margin-bottom:5%">
	  <div class="card shadow-sm">
	  		<div class="card-header">
	   			 <small class="text-muted">gg-mm-aaaa</small>
	  		</div>
		    <div class="card-horizontal">

		        <div class="img-square-wrapper">
		            <img class="" src="img/news3.jpg" width="300" height="182" alt="News">
		        </div>
		        <div class="card-body">
		            <h4 class="card-title">Card title</h4>
		            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		            <br>
		            <a href="https://www.pornhub.com" class="btn btn-principale stretched-link">Vai alla notizia</a>
		            <!-- stretched link rende tutta la card un link -->
		        </div>
		    </div>
			<div class="card-footer">
				<small class="text-muted">-user</small>
			</div>
	    </div>
	</div>


<%
	DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
	NewsModelDS model= new NewsModelDS(ds);
  	Collection <NewsBean> collection = model.doRetrieveAll();
if(collection!=null&&collection.size()>0){
	Iterator<?> it=collection.iterator();
	%>
	<table id="table">
	<thead>
		<tr>
		    <th>Ordina per data caricamento</th>
    	</tr>
    </thead>
    <tbody>
	 <%
	while(it.hasNext()){
		NewsBean nbean=(NewsBean)it.next();
		%>
		
		  <tr>
		   <td>
		  	  <div class="col" style="margin-bottom:3%">
				  <div class="card shadow-sm">
				  		<div class="card-header">
				   			 <small class="text-muted">gg-mm-aaaa</small>
				  		</div>
					    <div class="card-horizontal">
			
					        <div class="img-square-wrapper">
					            <img class="" src="img/news3.jpg" width="300" height="182" alt="News">
					        </div>
					        <div class="card-body">
					            <h4 class="card-title"><%=nbean.getTitolo() %></h4>
					            <p class="card-text"><%=nbean.getArgomento() %></p>
					            <br>
					            <a href="https://www.pornhub.com" class="btn btn-principale stretched-link">Vai alla notizia</a>
					            <!-- stretched link rende tutta la card un link -->
					        </div>
					    </div>
						<div class="card-footer">
							<small class="text-muted">-Utente</small>
						</div>
				    </div>
				</div>
				</td>
            
  		</tr>
		
	
	 <%	
		}
	 %> 
	  </tbody>
	 </table>
	 <% 
}
%>


</div>






<%@ include file="footer.jsp" %>

</body>


<script src="js/search.js" type="text/javascript"></script>

</html>