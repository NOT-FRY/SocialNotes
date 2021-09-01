<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Gestione News</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/editnotizie.js" charset="utf-8"></script> 
<link rel="stylesheet" type="text/css" href="css/editNotizie.css">

  </head>
  <body>
  <%@include file="header.jsp" %>
    <div class="container">
          <div class="table-wrapper">
              <div class="table-title">
                  <div class="row">
                      <div class="col-sm-8"><h2>Modifica <b>NEWS</b></h2></div>
                    <!--  <div class="col-sm-4">
                          <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                      </div> -->
                  </div>
              </div>
              <table class="table table-bordered">
                  <thead>
                      <tr>
                          <th>Titolo</th>
                          <th>Pubblicato da:</th>
                          <th>Data</th>
                          <th>Azioni</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td>Novità UNISA</td>
                          <td>Alfonso</td>
                          <td>11/07/2021</td>
                          <td>
<!-- <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons"></i></a> -->                              <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons"></i></a>
                              <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons"></i></a>
                          </td>
                      </tr>
                      <tr>
                          <td>Sciopero dei mezzi a Milano</td>
                          <td>Armando</td>
                          <td>11/07/2021</td>
                          <td>
<!-- <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons"></i></a> -->                              <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons"></i></a>
                              <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons"></i></a>
                          </td>
                      </tr>
                      <tr>
                          <td>Test di ingresso LUISS</td>
                          <td>Simone</td>
                          <td>11/07/2021</td>
                          <td>
  						<!-- <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons"></i></a> -->
                              <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons"></i></a>
                              <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons"></i></a>
                          </td>
                      </tr>
                  </tbody>
              </table>
          </div>
      </div>
      <%@include file="footer.jsp" %>
  </body>
</html>
