<%@page import="it.unisa.model.MessageModelDS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.sql.DataSource"%>
    <%@page import="java.util.Collection"%>
    <%@page import="it.unisa.model.MessageBean"%>
    <%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="InsertMessage">
	<input type="text" name="mex" required placeholder="nuovo messaggio">
	<input type="submit" value="invia">

</form>
<%
	DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
	MessageModelDS messageModel=new MessageModelDS(ds);
	Collection<MessageBean> messages=messageModel.doRetrieveByChatID(8);
	if(messages!=null&&messages.size()>0){
		Iterator<?> it=messages.iterator();
		while(it.hasNext()){
			MessageBean bean=(MessageBean)it.next();
%>
<p>Testo:<%=bean.getTesto() %></p>
<p>DataInvio:<%=bean.getDataInvio().getYear()+1900 %>/<%=bean.getDataInvio().getMonth()+1 %>/<%=bean.getDataInvio().getDate() %>		<%=bean.getDataInvio().getHours() %>:<%=bean.getDataInvio().getMinutes() %></p>
<p>Username:<%=bean.getUsername() %></p>
<p>ChatID:<%=bean.getChatID() %></p>
<br><br><br>
<%}} %>
</body>
</html>