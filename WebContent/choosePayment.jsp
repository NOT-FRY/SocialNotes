<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scegli la carta di credito</title>
<link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css" integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"    href="choosePayment.css">
</head>
<body>
<%@include file="header.jsp" %>



<div class="container">
    <div class="row">
        <div class="col-md-3">
            
        </div>
        <div class="col-md-9">
            <div class="osahan-account-page-right shadow-sm bg-white p-4 h-100">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade active show" id="payments" role="tabpanel" aria-labelledby="payments-tab">
                        <h4 class="font-weight-bold mt-0 mb-4">SCEGLI LA CARTA CON CUI EFFETTUARE IL PAGAMENTO</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="bg-white card payments-item mb-4 shadow-sm">
                                    <div class="gold-members p-4">
                                        <a href="#">
                                        </a>
                                        <div class="media">
                                            <div class="media-body">
                                               <a href="payment.jsp">
                                                   <i class="icofont-visa icofont-4x"></i>
                                               </a>
                                                <a href="payment.jsp">
                                                    <h6 class="mb-1">4159-XXXXXXXX-0666</h6>
                                                    <p>SCADENZA 10/2025</p>
                                                </a>
                                                
                                                   
                                                    
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="bg-white card payments-item mb-4 shadow-sm">
                                    <div class="gold-members p-4">
                                        <a href="#">
                                        </a>
                                        <div class="media">
                                            <div class="media-body">
                                                <a href="payment.jsp">
                                                    <i class="icofont-mastercard icofont-4x"></i>
                                                </a>
                                                <a href="payment.jsp">
                                                    <h6 class="mb-1">5333-XXXXXXXX-4567</h6>
                                                    <p>SCADENZA 10/2025</p>
                                                </a>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-2 pb-2">
                            <div class="col-md-6">
                                <div class="bg-white card payments-item mb-4 shadow-sm">
                                    <div class="gold-members p-4">
                                        <a href="#">
                                        </a>
                                        <div class="media">
                                            <div class="media-body">
                                                <a href="payment.jsp#">
                                                    <i class="icofont-american-express icofont-4x"></i>
                                                </a>
                                                <a href="payment.jsp">
                                                    <h6 class="mb-1">3712-XXXXXXXX-0158</h6>
                                                    <p>SCADENZA 10/2025</p>
                                                </a>
                                               
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="bg-white card payments-item mb-4 shadow-sm">
                                    <div class="gold-members p-4">
                                        <a href="#">
                                        </a>
                                        <div class="media">
                                            <div class="media-body">
                                                <a href="payment.jsp">
                                                    <i class="icofont-mastercard icofont-4x"></i>
                                                </a>
                                                <a href="payment.jsp">
                                                    <h6 class="mb-1">5333-XXXXXXXX-1234</h6>
                                                    <p>SCADENZA 10/2025</p>
                                                </a>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
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