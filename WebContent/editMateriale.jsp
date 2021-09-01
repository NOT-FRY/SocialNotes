<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Gestione Materiale</title>
  <link rel="stylesheet" type="text/css" href="editmateriale.css">
<script src="materiale.js" charset="utf-8"></script>
  </head>
  <body>
<%@include file="header.jsp" %>
    <form action="">
      <!--  General -->
      <div class="form-group">
        <h2 class="heading">GENERALI</h2>
        <div class="controls">
          <input type="text" id="name" class="floatLabel" name="name">
          <label for="name">AUTORE</label>
        </div>

      </div>

      <div style=
  "width:200px;background-color:#E4F3FF;border:1px solid #79BCEA;border-radius:4px;padding:10px; margin:10px 5px">
  <div style="padding-right:10px;padding-left:10px">
      <a href="file:///C:/Users/arman/Downloads/Ammessi11Giugno2021.pdf" style="text-decoration:none" target="_blank"><span style=
      "font-size:12px;font-family:Arial;font-weight:bold;color:#9697e7;white-space:nowrap;display:block; text-align:center">
      Visiona materiale</span></a>
    </div>
  </div>


      <div class="form-group">
        <h2 class="heading">DESCRIZIONE</h2>
        <div class="controls">
          <textarea name="comments" class="floatLabel" id="comments"></textarea>

          <button>CONSENTI PUBBLICAZIONE</button>
        </div>
      </div>
    </form>
    <%@include file="footer.jsp" %>
  </body>
</html>