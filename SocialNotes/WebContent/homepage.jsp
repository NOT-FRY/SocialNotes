<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SocialNotes</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="icon" href="img/favicon.ico">


<style>
.immagine {
	text-align: center;
}

.carduni {
	box-shadow: 5px 5px 10px 2px #333333;
	-webkit-box-shadow: 5px 5px 10px 2px #333333;
	-moz-box-shadow: 5px 5px 10px 2px #333333;
	margin-bottom: 2%;
}

.divtrasparente {
	background-color: #000;
	color: #fff;
	opacity: .5;
}

svg.radial-progress {
	height: auto;
	max-width: 200px;
	padding: 1em;
	transform: rotate(-90deg);
	width: 100%;
}

svg.radial-progress circle {
	fill: rgba(0, 0, 0, 0);
	stroke: #000;
	stroke-dashoffset: 219.91148575129;
	stroke-width: 10;
}

svg.radial-progress circle.incomplete {
	opacity: 0.25;
}

svg.radial-progress circle.complete {
	stroke-dasharray: 219.91148575129;
}

svg.radial-progress text {
	fill: #000;
	text-anchor: middle;
}

svg.radial-progress circle {
	stroke: #9697e6;
}
</style>


</head>
<body>

	<%@ include file="header.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="img/carousel1.jpg" alt="First slide">
							<div class="carousel-caption d-none d-md-block divtrasparente">
								<h5>Campus Unisa</h5>
								<p>RITORNO DAD OTTOBRE 2021</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="img/carousel2.jpg" alt="Second slide">
							<div class="carousel-caption d-none d-md-block divtrasparente">
								<h5>Campus Unisa</h5>
								<p>RITORNO DAD OTTOBRE 2021</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="img/carousel3.jpg" alt="Third slide">
							<div class="carousel-caption d-none d-md-block divtrasparente">
								<h5>Campus Unisa</h5>
								<p>RITORNO DAD OTTOBRE 2021</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>



		</div>

		<br>

		<div class="row">
			<div class="col-md-4">
				<div class="card carduni">
					<div class="card-body">

						<div style="float: left; margin-right: 5px;">
							<img src="img/unisa.png" alt="..." width="70" height="70">
						</div>
						<p align=center>Materiale Universit&agrave;  degli studi di Salerno</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card carduni">
					<div class="card-body">

						<div style="float: left; margin-right: 5px;">
							<img src="img/unisa.png" alt="..." width="70" height="70">
						</div>
						<p align=center>Materiale Universit&agrave;  degli studi di Salerno</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card carduni">
					<div class="card-body">

						<div style="float: left; margin-right: 5px;">
							<img src="img/unisa.png" alt="..." width="70" height="70">
						</div>
						<p align=center>Materiale Universit&agrave;  degli studi di Salerno</p>
					</div>
				</div>
			</div>





		</div>
		<br>
		<br>
		<br>
		<br>
		<h3>News</h3>
		<div class="row">

			<div class="col-md-6">
				<div class="card flex-md-row mb-4 box-shadow h-md-250">
					<img class="card-img-left flex-auto d-none d-md-block" src="img/1.jpg" alt="Card image cap" height="100" width="100"
						style="margin-top: 15px; margin-left: 15px;">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>

						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
						<a href="www.google.com">Continua</a>
					</div>

				</div>

				<div class="card flex-md-row mb-4 box-shadow h-md-250">
					<img class="card-img-left flex-auto d-none d-md-block" src="img/2.jpg" alt="Card image cap" height="100" width="100"
						style="margin-top: 15px; margin-left: 15px;">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>

						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
						<a href="www.google.com">Continua</a>
					</div>

				</div>

				<div class="card flex-md-row mb-4 box-shadow h-md-250">
					<img class="card-img-left flex-auto d-none d-md-block" src="img/unisa.png" alt="Card image cap" height="100" width="100"
						style="margin-top: 15px; margin-left: 15px;">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>

						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
						<a href="www.google.com">Continua</a>
					</div>

				</div>


			</div>

			<div class="col-md-6">

				<div class="card mb-3">
					<img src="img/unisa.png" class="card-img-top" alt="..." height="400" width="400">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a
							little bit longer.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>

		</div>
		<br>

		<div class="row">


			<div class="col-lg-4" style="text-align: center;">
				<svg class="radial-progress" data-percentage="45" viewBox="0 0 80 80">
  <circle class="incomplete" cx="40" cy="40" r="35"></circle>
  <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 39.58406743523136;"></circle>
  <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">45%</text>
  <h3>Studenti</h3>
</svg>
			</div>


			<div class="col-lg-4" style="text-align: center;">

				<svg class="radial-progress" data-percentage="80" viewBox="0 0 80 80">
  <circle class="incomplete" cx="40" cy="40" r="35"></circle>
  <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 39.58406743523136;"></circle>
  <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">80%</text>
  <h3>Materiale</h3>
</svg>
			</div>

			<div class="col-lg-4" style="text-align: center;">
				<svg class="radial-progress" data-percentage="75" viewBox="0 0 80 80">
  <circle class="incomplete" cx="40" cy="40" r="35"></circle>
  <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 39.58406743523136;"></circle>
  <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">1500</text>
  <h3>Post</h3>
</svg>
			</div>



		</div>




	</div>
	<br>
	<br>

	<%@ include file="footer.jsp"%>



</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous">
</script>




<script type="text/javascript">
$('svg.radial-progress').each(function( index, value ) { 
  $(this).find($('circle.complete')).removeAttr( 'style' );
});
</script>

<script type="text/javascript">
$(window).scroll(function(){
  $('svg.radial-progress').each(function( index, value ) { 
    // If svg.radial-progress is approximately 25% vertically into the window when scrolling from the top or the bottom
    if ( 
        $(window).scrollTop() > $(this).offset().top - ($(window).height() * 0.75) &&
        $(window).scrollTop() < $(this).offset().top + $(this).height() - ($(window).height() * 0.25)
    ) {
        // Get percentage of progress
        percent = $(value).data('percentage');
        // Get radius of the svg's circle.complete
        radius = $(this).find($('circle.complete')).attr('r');
        // Get circumference (2Ï€r)
        circumference = 2 * Math.PI * radius;
        // Get stroke-dashoffset value based on the percentage of the circumference
        strokeDashOffset = circumference - ((percent * circumference) / 100);
        // Transition progress for 1.25 seconds
        $(this).find($('circle.complete')).animate({'stroke-dashoffset': strokeDashOffset}, 1250);
    }
  });
}).trigger('scroll');
</script>
</html>