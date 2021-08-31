<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cerca Materiale - SocialNotes</title>
<link rel="icon" href="img/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<style>
/* use reverse flexbox to take advantage of flex-direction: reverse */
.star-rating {
  display: flex;
  align-items: center;
  width: 160px;
  flex-direction: row-reverse;
  justify-content: space-between;
  margin: 40px auto;
  position: relative;
}
/* hide the inputs */
.star-rating input {
  display: none;
}
/* set properties of all labels */
.star-rating > label {
  width: 30px;
  height: 30px;
  font-family: Arial;
  font-size: 30px;
  transition: 0.2s ease;
  color: orange;
}
/* give label a hover state */
.star-rating label:hover {
  color: #9697e7;
  transition: 0.2s ease;
}
.star-rating label:active::before {
  transform:scale(1.1);
}

/* set shape of unselected label */
.star-rating label::before {
  content: '\2606';
  position: absolute;
  top: 0px;
  line-height: 26px;
}
/* set full star shape for checked label and those that come after it */
.star-rating input:checked ~ label:before {
  content:'\2605';
}

@-moz-document url-prefix() {
  .star-rating input:checked ~ label:before {
  font-size: 36px;
  line-height: 21px;
  }
}  
</style>

</head>
<body>
<% 
    if (session.getAttribute("username")==null){
%>
      <jsp:include page="header.jsp"></jsp:include>
<%
    }else{
%>
<jsp:include page="header_user.jsp"></jsp:include>

<% } %>


<div class="container">
<br><br>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form class="form-inline shadow p-3 mb-5 bg-white rounded" action="" >
  <div class="col">
    <label for="email">Ordine di caricamento</label>
     <select class="custom-select d-block w-100" id="date" name="date">
     <option value="ASC">Crescente</option>
     <option value="DESC">Decrescente</option>
     </select>
  </div>
<br>
<label>Rating:</label>
     <div class="col">
     <div class="star-rating">
      <input type="radio" name="stars" id="star-a" value="5"/>
      <label for="star-a"></label>

      <input type="radio" name="stars" id="star-b" value="4"/>
      <label for="star-b"></label>
  
      <input type="radio" name="stars" id="star-c" value="3"/>
      <label for="star-c"></label>
  
      <input type="radio" name="stars" id="star-d" value="2"/>
      <label for="star-d"></label>
  
      <input type="radio" name="stars" id="star-e" value="1"/>
      <label for="star-e"></label>
</div>
  </div>
  <button type="submit" class="btn btn-default" style="background-color:#9697e7; color:white">Cerca</button>
</form>

</div>
<div class="col-md-3"></div>


<%
  Collection <MaterialModelDS> collection = (Collection<MaterialModelDS>) request.getAttribute("materiale");

if(collection!=null&&collection.size()>0){
	Iterator<?> it=collection.iterator();
	%>
	<table>
	<tr>
	    <th>Descrizione</th>
    <th>Costo</th>
    <th>Username</th>
    <th>Data Caricamento</th>
    </tr>
	 <%
	while(it.hasNext()){
		MaterialBean mbean=(MaterialBean)it.next();
		%>
		  <tr>
    <th><%=mbean.getDescrizione() %></th>
    <th><%=mbean.getCosto() %></th>
    <th><%=mbean.getUsername() %></th>
    <th><%=mbean.getDataCaricamento() %></th>
  </tr>
		
		<% 
		
	}
	 %> 
	 
	 </table>
	 <% 
}
%>

</div>

</div>




<%@ include file="footer.jsp" %>
</body>


<script src="js/search.js" type="text/javascript"></script>

</html>