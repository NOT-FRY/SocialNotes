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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/notizie.js" charset="utf-8"></script>
  </head>
  <body>
  <%@include file="header.jsp" %>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<div class="file-upload">
  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">AGGIUNGI NEWS</button>

  <div class="image-upload-wrap">
    <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
    <div class="drag-text">
      <h3>TRASCINA E RILASCIA UNA NEWS</h3>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" src="#" alt="your image" />
    <div class="image-title-wrap">
      <button type="button" onclick="removeUpload()" class="remove-image">RIMUOVI <span class="image-title">FILE CARICATI</span></button>
    </div>
  </div>
</div>
<br>
<br>
<br>
<h1> ULTIME NEWS CARICATE</h1>
<div class="col-md-9 animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="file-box">
                    <div class="file">
                        <a href="https://www.adisurcampania.it/">
                            <span class="corner"></span>

                            <div class="icon">
                                <img src="img/adisurc.png" alt="adisurc" class="img-responsive">
                            </div>
                            <div class="file-name">
                                Novità ADISURC
                                <br>
                                <small>Aggiunto: 11 luglio, 2021</small>
                            </div>
                        </a>
                    </div>

                </div>
                <div class="file-box">
                    <div class="file">
                        <a href="https://www.unisa.it/">
                            <span class="corner"></span>

                            <div class="image">
                                <img alt="unisa" class="img-responsive" src="img/unisa.png">
                            </div>
                            <div class="file-name">
                                Novità UNISA
                                <br>
                                <small>Aggiunto: 11 luglio, 2021</small>
                            </div>
                        </a>

                    </div>
                </div>
                <div class="file-box">
                    <div class="file">
                        <a href="https://www.milanotoday.it/tag/scioperi/">
                            <span class="corner"></span>

                            <div class="image">
                                <img alt="image" class="img-responsive" src="img/sciopero.jpg" class="img-responsive">
                            </div>
                            <div class="file-name">
                                Sciopero dei mezzi a Milano
                                <br>
                                <small>Aggiunto: 11 luglio, 2021</small>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="file-box">
                    <div class="file">
                        <a href="https://easycourse.unisa.it/EasyTest/Calendario/index.php?_lang=it">
                            <span class="corner"></span>

                            <div class="icon">
                              <img src="img/esami.jpg" alt="esami" class="img-responsive">
                            </div>
                            <div class="file-name">
                                Pubblicati calendari appelli
                                <br>
                                <small>Aggiunto: 11 luglio, 2021</small>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="file-box">
                    <div class="file">
                        <a href="https://www.luiss.it/entra-luiss/ammissione-triennali-e-ciclo-unico">
                            <span class="corner"></span>

                            <div class="image">
                                <img alt="image" class="img-responsive" src="img/luiss.jpg">
                            </div>
                            <div class="file-name">
                                Test di ingresso LUISS
                                <br>
                                <small>Aggiunto: 11 luglio, 2021</small>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="file-box">
                    <div class="file">
                        <a href="editNotizie.jsp">
                            <span class="corner"></span>

                            <div class="icon">
                                <img alt="image" class="img-responsive" src="img/impostazioni.jpg">
                            </div>
                            <div class="file-name">
                                MODIFICA
                                <br>

                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        </div>

<%@include file="footer.jsp" %>
  </body>
</html>
