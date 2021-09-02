<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Risultati ricerca</title>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/searchResult.css">
</head>
<body>
<%@include file="header.jsp" %>

<div class="container bootstrap snippets bootdey">
   <br>
   
    
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
          
            <div class="well search-result">
                <div class="row">
                    <a href="documentPreview.jsp">
                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <img class="img-responsive" src="https://via.placeholder.com/400x200/7B68EE/000000" alt="">
                        </div>
                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-10 title">
                            <h3> Materiale 1</h3>
                            <p>Ut quis libero id orci semper porta ac vel ante. In nec laoreet sapien. Nunc hendrerit ligula at massa sodales, ullamcorper rutrum orci semper.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="well search-result">
                <div class="row">
                    <a href="documentPreview.jsp">
                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <img class="img-responsive" src="https://via.placeholder.com/400x200/FA8072/000000" alt="">
                        </div>
                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-10 title">
                            <h3>Materiale 2</h3>
                            <p>Nulla rhoncus lacus tortor, vel tincidunt dolor eleifend et. Ut consequat elit quam, iaculis volutpat ipsum fermentum pulvinar. Pellentesque nec sem vel arcu ornare faucibus.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="well search-result">
                <div class="row">
                    <a href="documentPreview.jsp">
                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-2">
                            <img class="img-responsive" src="https://via.placeholder.com/400x200/48D1CC/000000" alt="">
                        </div>
                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-10 title">
                            <h3>Materiale 3</h3>
                            <p>Cras nisi dolor, tristique id vehicula vitae, mollis at eros. Ut euismod sem eu tellus vestibulum, in facilisis est feugiat. Mauris sed leo sed erat vestibulum suscipit.</p>
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