<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestione News</title>
    <link rel="stylesheet" type="text/css" href="css/notizie.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/notizie.js" charset="utf-8"></script>
  </head>
  <body>
  <%@include file="header.jsp" %>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<div class="file-upload">
 <!--   <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">AGGIUNGI FOTO</button>-->
<form method="post" action=<%="NewsUploadServlet;jsessionid="+session.getId()%> enctype="multipart/form-data">
	  <div class="image-upload-wrap">
	    <input class="file-upload-input" name="img" type='file' onchange="readURL(this);" accept="image/*" />
	    <div class="drag-text">
	      <h3>TRASCINA E RILASCIA UNA FOTO</h3>
	    </div>
	  </div>
	  <div class="file-upload-content">
	    <img class="file-upload-image" src="#" alt="your image" />
	    <div class="image-title-wrap">
	      <button type="button" onclick="removeUpload()" class="remove-image">RIMUOVI <span class="image-title">FILE CARICATI</span></button>
	    </div>
	  </div>
	  <br>
	  <textarea placeholder="Inserisci il titolo della news" rows="3" class="form-control" name="titolo" required></textarea>
	  <br>
	  <textarea placeholder="Inserisci l'argomento trattato" rows="3" class="form-control" name="argomento" required></textarea>
	  <br>
	  <textarea placeholder="Inserisci il contenuto" rows="4" class="form-control" name="contenuto" required></textarea>
	  <br>
	  	<div class="btn-toolbar justify-content-between">
			<div class="btn-group">
				<button type="submit" class="btn bottone-principale text-light" style="background-color: #9697e7" onclick="prova()">Pubblica News</button>
			</div>
	    </div>
</form>
</div>
<br>

<br>
<br>
<h1> ULTIME NEWS CARICATE</h1> <a href="editNotizie.jsp"><button id="modifica"> Modifica
  
  </button></a>

<div class="container">
    
    
    <div class="friend-list">
        <div class="row">
            <div class="col-md-4 col-sm-6">
              <div class="friend-card">
                  <img src="https://via.placeholder.com/200x100/6495ED" alt="profile-cover" class="img-responsive cover">
                  <div class="card-info">
                 
                  <div class="friend-info">
                    <p class="pull-right text-green">[Calcio]</p>
                  	<h5><a href="timeline.html" class="profile-link">Messi al PSG</a></h5>
                  	<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>
                  </div>
                </div>
              </div>
            </div>
            <br>
            <div class="col-md-4 col-sm-6">
              <div class="friend-card">
                  <img src="https://via.placeholder.com/200x100/008B8B" alt="profile-cover" class="img-responsive cover">
                  <div class="card-info">
                  <div class="friend-info">
                    <p class="pull-right text-green">[Calcio]</p>
                  	<h5><a href="timeline.html" class="profile-link">Messi al PSG</a></h5>
                  	                  	<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>

                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-4 col-sm-6">
              
              <div class="friend-card">
                 <img src="https://via.placeholder.com/200x100/9932CC" alt="profile-cover" class="img-responsive cover"> 
                  <div class="card-info">
                  <div class="friend-info">
                     <p class="pull-right text-green">[Calcio]</p>
                  	<h5><a href="timeline.html" class="profile-link">Messi al PSG</a></h5>
                  	<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>
                  </div>
                </div>
              </div>
         
            </div>
            
        
            
         
            
         </div>
    </div>
</div>


<%@include file="footer.jsp" %>
  </body>
</html>
