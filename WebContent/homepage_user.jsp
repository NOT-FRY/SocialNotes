<%@page import="it.unisa.model.MaterialModelDS"%>
<%@page import="it.unisa.model.FriendsModelDS"%>
<%@page import="it.unisa.model.FriendsBean"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SocialNotes - Home</title>

<link rel="icon" href="img/favicon.ico">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">




<link rel="stylesheet" href="package/dist/sweetalert2.min.css">

<style type="text/css">
@import url("css/homepage_user.css");
</style>

<style>
.form-control::file-selector-button {
	padding: 0.55rem 0.75rem;
	margin: -0.375rem -0.75rem;
	-webkit-margin-end: 0.75rem;
	margin-inline-end: 0.75rem;
	color: white;
	background-color: #9697e7;
	pointer-events: none;
	border-color: inherit;
	border-style: solid;
	border-width: 0;
	border-inline-end-width: 1px;
	border-radius: 0;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

#img-2 {
	filter: blur(10px);
	-webkit-filter: blur(10px);
}
</style>



</head>
<body>

	<%
  if (session.getAttribute("username")==null)
	  response.sendRedirect("login.jsp");

  String nome = (String)session.getAttribute("nome");
  String cognome = (String)session.getAttribute("cognome");
  String dipName = (String)session.getAttribute("dipName");
  String universita = (String)session.getAttribute("denominazione");
  String username=(String)session.getAttribute("username");
  DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
  FriendsModelDS friends=new FriendsModelDS(ds);
  int numeroAmici=friends.getNumerFriends(username);
  MaterialModelDS material=new MaterialModelDS(ds);
  int quantitaMateriale=material.getQuantitaMaterialeCondiviso(username);
  Collection<FriendsBean> f=friends.doRetrieveByUsername(username);
  
%>

	<%@ include file="header_user.jsp"%>

	<br>
	<main class="container">


		<script>
			function prova() {
				Swal.fire('Good job!', 'You clicked the button!', 'success')
			}
		</script>

		<div class="row g-5">

			<div class="col-md-4">
				<div class="position-sticky" style="top: 2rem;">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4><%=nome%>
										<%=cognome %></h4>
									<p class="text-secondary mb-1"><%=dipName %></p>
									<p class="text-muted font-size-sm"><%=universita %></p>
								</div>
							</div>
						</div>
					</div>



					<div class="card">

						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h6 text-muted">Amici</div>
								<div class="h5"><%=numeroAmici %></div>
							</li>
							<li class="list-group-item">
								<div class="h6 text-muted">Materiale condiviso</div>
								<div class="h5"><%=quantitaMateriale %></div>
							</li>
							<li class="list-group-item">
								<div class="h6 text-muted">Valutazione</div>
								<canvas class="myCanvas" data-rating="3.12" width="100"
									height="20">
not support the canvas tag.</canvas>
							</li>
						</ul>
					</div>


					<div class="card social-timeline-card">
						<div class="card-body">
							<h5 class="card-title">Amici aggiunti di ricente</h5>
							<ul class="friend-list">
								<%
									if(f!=null&&f.size()>0){
										Iterator<?> it=f.iterator();
										while(it.hasNext()){
											FriendsBean bean=(FriendsBean)it.next();
								%>
								<li>
									<div class="left">
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
											alt="">
									</div>
									<div class="right">
										<h3><%=bean.getUsername1() %></h3>
										<p><%=friends.getNumerFriends(bean.getUsername1()) %> Friends</p>
									</div>
								</li>
								
								<%
										}
									}
								%>
							</ul>
						</div>
					</div>
					<br>
				</div>
			</div>

			<div class="col-md-8">
				<div class="card social-timeline-card">

					<div class="card-body">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade active show" id="posts" role="tabpanel"
								aria-labelledby="posts-tab">
								<div class="form-group">
									<form method="post" action="FileUploadServlet"
										enctype="multipart/form-data">
										<h4>Condivisione materiale</h4>
										<div class="mb-3">
											<label>File PDF</label> <input class="form-control"
												type="file" id="formFile" name="Contenuto"
												accept=".pdf,.doc,.docx,.odt,.ppt,.pptx"> <br>
											<label>Immagine anteprima del materiale</label> <input
												class="form-control" type="file" id="formFile"
												name="Anteprima" accept=".jpeg,.png,.jpg,.PNG">
										</div>

										<br>

										<textarea
											placeholder="Inserisci una descrizione del materiale"
											rows="3" class="form-control" name="Descrizione" required></textarea>

										<br>
										<textarea placeholder="Inserisci il corso" rows="1"
											class="form-control" name="Corso" required></textarea>
										<br>

										<div class="btn-toolbar justify-content-between">
											<div class="btn-group">
												<button type="submit"
													class="btn bottone-principale text-light"
													style="background-color: #9697e7" onclick="prova()">Share</button>
											</div>
										</div>
									</form>

								</div>
							</div>

						</div>

					</div>
				</div>

				<div class="card social-timeline-card">
					<div class="card-header">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex justify-content-between align-items-center">
								<div class="mr-2">
									<img class="rounded-circle"
										src="https://bootdey.com/img/Content/avatar/avatar1.png"
										alt="" width="45">
								</div>
								<div class="ml-2">
									<div class="h5 m-0 text-blue">@JaneSmith</div>
									<div class="h7 text-muted">Miracles Lee Cross</div>
								</div>
							</div>
							<div>
								<div class="dropdown">
									<button class="btn btn-link dropdown-toggle" type="button"
										id="gedf-drop11" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="fa fa-ellipsis-h"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-right"
										aria-labelledby="gedf-drop11" x-placement="bottom-end"
										style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(42px, 38px, 0px);">
										<div class="h6 dropdown-header">Configuration</div>
										<a class="dropdown-item" href="#">Save</a> <a
											class="dropdown-item" href="#">Hide</a> <a
											class="dropdown-item" href="#">Report</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="text-muted h7 mb-2">
							<i class="fa fa-clock-o"></i>10 min ago
						</div>
						<a class="card-link" href="#"><h5 class="card-title">Lorem
								ipsum dolor sit amet, consectetur adip.</h5> </a> <img
							src="provvisorio/Cattura6.PNG" height="500px" width="500px"
							class="img-fluid">
					</div>
					<div class="card-footer">
						<a href="#" class="card-link"><i class="fa fa-gittip"></i>
							Compra</a> <a href="#" class="card-link"><i class="fa fa-comment"></i>
							Effettua una recensione</a>
					</div>
				</div>

				<div class="d-flex justify-content-center">
					<div class="spinner-border" role="status">
						<span class="sr-only">Loading...</span>
					</div>
				</div>
				<br>

			</div>


		</div>


	</main>

	<%@ include file="footer.jsp"%>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>


<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script src="js/homepage_user.js"></script>



<script src="package/dist/sweetalert2.all.min.js"></script>
<script src="package/dist/sweetalert2.min.js"></script>
</html>