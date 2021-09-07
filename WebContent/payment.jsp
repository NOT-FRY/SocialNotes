<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Effettua Pagamento</title>
<link rel="stylesheet" type="text/css" href="css/payment.css">
</head>
<body>
<%@include file="header.jsp" %>

        <!-- ==============================================
	    Credit Card Payment Section
	    =============================================== -->		
		
		<section class="credit-card">
		 <div class="container">
		  
			<div class="card-holder">
			  <div class="card-box bg-news">
		       <div class="row">
				<div class="col-lg-6">
				 <div class="img-box">
				   <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="img-fluid" />
				 </div>
				</div>
				<div class="col-lg-6">
				
				
				<form>
				  <div class="card-details">
					<h3 class="title">Dettagli Carta di Credito</h3>
					<div class="row">
					  <div class="form-group col-sm-7">
					   <div class="inner-addon right-addon">
						<label for="card-holder">Titolare Carta</label>
                        <i class="far fa-user"></i>
						<input id="card-holder" type="text" class="form-control" placeholder="Titolare Carta" aria-label="Titolare Carta" aria-describedby="basic-addon1" value="Armando Caso" disabled>
						
					   </div>	
					  </div>
					  <div class="form-group col-sm-5">
						<label for="">Scadenza</label>
						<div class="input-group expiration-date">
						  <input type="text" class="form-control" placeholder="MM" aria-label="MM" aria-describedby="basic-addon1" disabled value="10">
						  <span class="date-separator">/</span>
						  <input type="text" class="form-control" placeholder="YY" aria-label="YY" aria-describedby="basic-addon1" disabled value="2025">
						</div>
					  </div>
					  <div class="form-group col-sm-8">
					   <div class="inner-addon right-addon">
						<label for="card-number">Numero Carta</label>
                        <i class="far fa-credit-card"></i>
						<input id="card-number" type="text" class="form-control" placeholder="Numero Carta" aria-label="Numero Carta" aria-describedby="basic-addon1" disabled value="4159-6543-2178-0666">
					   </div>	
					  </div>
					  <div class="form-group col-sm-4">
						<label for="cvc">CVC</label>
						<input id="cvc" type="text" class="form-control" placeholder="CVC" aria-label="CVC" aria-describedby="basic-addon1" disabled value="824">
					  </div>
					  <div class="form-group col-sm-12">
						<button type="button" class="btn btn-primary btn-block">Conferma Acquisto</button>
					  </div>
					</div>
				  </div>
				</form>				
				
				</div><!--/col-lg-6 --> 
		  
		       </div><!--/row -->
			  </div><!--/card-box -->
			</div><!--/card-holder -->		 
			
		 </div><!--/container -->
		</section>

<%@include file="footer.jsp" %>
</body>
</html>