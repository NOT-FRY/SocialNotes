<%@page import="it.unisa.model.UserModelDS"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.Collection"%>
<%@page import="it.unisa.model.UserBean"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestione Utenti</title>
<link rel="stylesheet" type="text/css" href="css/editUser.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
</head>
<body>
<%
	if (session.getAttribute("username")==null)
		  response.sendRedirect("login.jsp");

	DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
	UserModelDS model=new UserModelDS(ds);
	Collection<UserBean> users=model.doRetrieveUsers();
%>


<%@include file="header.jsp" %>

<div class="container mt-3 mb-4">
<div class="col-lg-9 mt-4 mt-lg-0">
    <div class="row">
      <div class="col-md-12">
        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
          <table class="table manage-candidates-top mb-0">
            <thead>
              <tr>
                <th>UTENTI</th>
                <th class="text-center">Stato</th>
                <th class="action text-right">Azioni</th>
              </tr>
            </thead>
            <tbody>
             <!--  codice java-->
             <%
				if(users!=null&&users.size()>0){
					Iterator<?> it=users.iterator();
					while(it.hasNext()){
						UserBean bean=(UserBean)it.next();
						String ban;
						if(bean.getBan())
							ban="Bloccato";
						else
							ban="Sbloccato";
			%>
              <tr class="candidates-list">
                <td class="title">
                  <div class="thumb">
                    <img class="img-fluid" src="PrintImage?username=<%=bean.getUsername() %>" alt="haloo">
                  </div>
                  <div class="candidate-list-details">
                    <div class="candidate-list-info">
                      <div class="candidate-list-title">
                        <h5 class="mb-0"><a href="visitUser.jsp?friendname=<%=bean.getUsername()%>"><%=bean.getUsername() %> - <%=bean.getNome() %> <%=bean.getCognome() %></a></h5>
                      </div>
                      
                    </div>
                  </div>
                </td>
                <td class="candidate-list-favourite-time text-center">
                 
                  <span class="candidate-list-time order-1"><%=ban %></span>
                </td>
                <td>
                  <ul class="list-unstyled mb-0 d-flex justify-content-end">
                    <li><a href="visitUser.jsp?friendname=<%=bean.getUsername() %>" class="text-primary" data-toggle="tooltip" title="" data-original-title="Visita"><i class="far fa-eye"></i></a></li>
                    <li><a href="RemoveBan?username=<%=bean.getUsername() %>" class="text-info" data-toggle="tooltip" title="" data-original-title="Sblocca"><i class="fas fa-lock-open"></i></a></li>
                    <li><a href="SetBan?username=<%=bean.getUsername() %>" class="text-danger" data-toggle="tooltip" title="" data-original-title="Blocca"><i class="fas fa-lock"></i></a></li>
                  </ul>
                </td>
              </tr>
              <!-- fine codice java -->
              <%}} %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>






<%@include file="footer.jsp" %>
</body>
</html>