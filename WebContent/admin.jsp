<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" type="text/css" href="css/admin.css">
    <meta charset="utf-8">
    <title>Admin</title>
  </head>
  <body>
  <%@include file="header_user.jsp" %>
     
<div class="container-fluid">
  <div class="row">
  <div class="col-md-2">
 
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="admin.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home" aria-hidden="true"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
              Torna alla Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="notizie.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file" aria-hidden="true"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              News
            </a>
          </li>
       
          <li class="nav-item">
            <a class="nav-link" href="editUser.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users" aria-hidden="true"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              Utenti
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="grafici.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2" aria-hidden="true"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
              Grafici
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="materiale.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers" aria-hidden="true"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
              Materiale
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Documenti SocialNotes</span>
         
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="documento1.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Documento 1
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="documento2.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Documento 2
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="documento3.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Documento 3
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="documento4.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#9697e7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Documento 4
            </a>
          </li>
        </ul>
      </div>
    </div>

<div class="col-md-10">
<section class="page-content">
  <section class="search-and-user">

    <div  class="admin-profile">

      <h1>  &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;&emsp;   BENTORNATO ADMIN!</h1>


    </div>
  </section>
  <section class="grid">


    <article class="andamento">
    <h1>Andamento settimanale</h1>

      <div class="skills" height="530" width="300">

<div class="charts">
  <div class="chart chart--dev">
    <span class="chart__title">UTENZA</span>
    <ul class="chart--horiz">
      <li class="chart__bar" style="width: 78%;">
        <span class="chart__label">
          LUNEDI'
        </span>
      </li>
      <li class="chart__bar" style="width: 86%;">
        <span class="chart__label">
          MARTEDI'
        </span>
      </li>
      <li class="chart__bar" style="width: 54%;">
        <span class="chart__label">
          MERCOLEDI'
        </span>
      </li>
      <li class="chart__bar" style="width: 70%;">
        <span class="chart__label">
          GIOVEDI'
        </span>
      </li>
      <li class="chart__bar" style="width: 45%;">
        <span class="chart__label">
          VENERDI'
        </span>
      </li>
      <li class="chart__bar" style="width: 30%;">
        <span class="chart__label">
          SABATO
        </span>
      </li>
      <li class="chart__bar" style="width: 25%; height: 26px;">
        <span class="chart__label">
          DOMENICA
        </span>
      </li>
      </ul>
  </div>
  </div>

  </div>

</article>



     <article>
       <h1>&ensp;Gestisci Materiale</h1>
       <a href="materiale.jsp" target="_self">
   <img ismap src="img/materiale.jpg" alt="materiale" id="materiale" />
     </a>

    </article>


    <article id="sposta">
     <a href="notizie.jsp" target="_self">
     <h1>&ensp;Carica News</h1>
     </a>
     
  <img ismap src="img/news.png" alt="notizie" id="news" width="290px"/>
  
</article>




  </section>

</section>
</div>
</div>
</div>
  <script>
    const html = document.documentElement;
const body = document.body;
const menuLinks = document.querySelectorAll(".admin-menu a");
const collapseBtn = document.querySelector(".admin-menu .collapse-btn");
const toggleMobileMenu = document.querySelector(".toggle-mob-menu");
const switchInput = document.querySelector(".switch input");
const switchLabel = document.querySelector(".switch label");
const switchLabelText = switchLabel.querySelector("span:last-child");
const collapsedClass = "collapsed";
const lightModeClass = "light-mode";

/*TOGGLE HEADER STATE*/
collapseBtn.addEventListener("click", function () {
  body.classList.toggle(collapsedClass);
  this.getAttribute("aria-expanded") == "true"
    ? this.setAttribute("aria-expanded", "false")
    : this.setAttribute("aria-expanded", "true");
  this.getAttribute("aria-label") == "collapse menu"
    ? this.setAttribute("aria-label", "expand menu")
    : this.setAttribute("aria-label", "collapse menu");
});

/*TOGGLE MOBILE MENU*/
toggleMobileMenu.addEventListener("click", function () {
  body.classList.toggle("mob-menu-opened");
  this.getAttribute("aria-expanded") == "true"
    ? this.setAttribute("aria-expanded", "false")
    : this.setAttribute("aria-expanded", "true");
  this.getAttribute("aria-label") == "open menu"
    ? this.setAttribute("aria-label", "close menu")
    : this.setAttribute("aria-label", "open menu");
});

/*SHOW TOOLTIP ON MENU LINK HOVER*/
for (const link of menuLinks) {
  link.addEventListener("mouseenter", function () {
    if (
      body.classList.contains(collapsedClass) &&
      window.matchMedia("(min-width: 768px)").matches
    ) {
      const tooltip = this.querySelector("span").textContent;
      this.setAttribute("title", tooltip);
    } else {
      this.removeAttribute("title");
    }
  });
}

/*TOGGLE LIGHT/DARK MODE*/
if (localStorage.getItem("dark-mode") === "false") {
  html.classList.add(lightModeClass);
  switchInput.checked = false;
  switchLabelText.textContent = "Chiaro";
}

switchInput.addEventListener("input", function () {
  html.classList.toggle(lightModeClass);
  if (html.classList.contains(lightModeClass)) {
    switchLabelText.textContent = "Chiaro";
    localStorage.setItem("dark-mode", "false");
  } else {
    switchLabelText.textContent = "Scuro";
    localStorage.setItem("dark-mode", "true");
  }
});



  </script>
<%@include file="footer.jsp" %>
  </body>
</html>
