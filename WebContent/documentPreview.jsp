<%@page import="it.unisa.model.CourseBean"%>
<%@page import="it.unisa.model.CourseModelDS"%>
<%@page import="it.unisa.model.MaterialBean"%>
<%@page import="it.unisa.model.MaterialModelDS"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Anteprima Materiale</title>
<link rel="stylesheet" type="text/css" href="css/documentPreview.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/friendResearch.css">        



</head>
<body>
<%


	DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
	String code=request.getParameter("codice");
	int codiceMateriale=Integer.parseInt(code);
	MaterialModelDS materialModel=new MaterialModelDS(ds);
	MaterialBean material=materialModel.doRetrieveByKey(code);
	int feed=materialModel.doRetrieveFeedback(codiceMateriale);
	UserModelDS userModel=new UserModelDS(ds);
	UserBean user=userModel.doRetrieveByUsername(material.getUsername());
	CourseModelDS courseModel=new CourseModelDS(ds);
	String codiceCorso=""+material.getCodiceCorso();
	CourseBean course=courseModel.doRetrieveByKey(codiceCorso);
%>
<%@include file="header_user.jsp" %>
<br>
<br>
<div class="container">
    <div class="shop-default shop-cards shop-tech">
        <div class="row">
        
            <div class="col-md-6">
                <div class="block product no-border z-depth-2-top z-depth-2--hover">
                    <div class="block-image">
                     
                            <img src="PrintAnteprima?codice=<%=material.getCodiceMateriale() %>" class="img-center">
                        
                    </div>
                    <div class="block-body text-center">
                        <h3 class="heading heading-5 strong-600 text-capitalize"><%=material.getFileName() %></h3>
                  	    <div class="widget-26-job-starred">
	             			<canvas class="myCanvas" data-rating="<%=feed %>" width="100" height="20">not support the canvas tag.</canvas>
	            		</div>
                        
                        <div class="product-buttons mt-4">
                            <div class="row align-items-center">
                               
                               
                                <div class="col-8">
                                    <button type="button" class="btn btn-block btn-primary btn-circle btn-icon-left" id="scarica">
                                        <i class="fas fa-coins"></i>&ensp; SCARICA
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
            </div>
            <div class="col-md-6">
                <div class="block product no-border z-depth-2-top z-depth-2--hover">
                    <div class="block-image">
                       
                            <div class="product-content product-wrap clearfix">
							<div class="row">
				
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="product-deatil">
				</div> 
				<div class="description"><br><br>
				<h4 align=center><b><%=material.getDescrizione() %></b></h4>
				</div>
				<div class="project-info-box">
                <h5>&nbsp;<b>Caricato da: </b><%=user.getNome()%> <%=user.getCognome() %></h5>
                <h5>&nbsp;<b>Data: </b><%=material.getDataCaricamento() %></h5>
                <h5>&nbsp;<b>Corso: </b><%=course.getNome() %></h5>
                <h5>&nbsp;<b>Universita': </b><%=user.getDenominazione() %></h5>
                <h5>&nbsp;<b>Coin: </b><%=material.getCosto() %></h5>
	            </div>
	           <br>
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
<script src="js/homepage_user.js"></script>
</html>