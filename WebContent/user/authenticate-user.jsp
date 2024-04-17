<%@page import="java.sql.*"%>
<html>
<head>
  <link href='/banking-app/CSS/style.css' rel='stylesheet'>
  <link href='/banking-app/CSS/bootstrap.min.css' rel='stylesheet'>
</head>
<body class='bgi'>
 <%
 String uid=request.getParameter("userid");
 String upass=request.getParameter("password");
 PreparedStatement ps=(PreparedStatement) application.getAttribute("selectuser");
 ps.setString(1,uid);
 ResultSet rst=ps.executeQuery();
 if(rst.next())
 {
	 String dpass=rst.getString(2);
	 if(upass.equals(dpass))
	 {
		 String name=rst.getString(3);
		 PreparedStatement ps1=(PreparedStatement) application.getAttribute("selectano");
		 ps1.setString(1,uid);
		 ResultSet rst1=ps1.executeQuery();
		 rst1.next();
		 String an=rst1.getString(1);
		 rst1.close();
		 //session.setMaxInactiveInterval(10);
		 session.setAttribute("username",name);
		 session.setAttribute("accountno",an);
		 response.sendRedirect("/banking-app");
	 }
	 else
	 {
		 %>
		 <jsp:include page="login.jsp">
		  <jsp:param value="Password is wrong" name="msg"/>
		  <jsp:param value="<%=uid%>" name="userid"/>
		 </jsp:include>
		 <%
	 }
 }
 else
 {
	 %>
	 <jsp:include page="login.jsp">
	  <jsp:param value="Userid does not exist" name="msg"/>
	  <jsp:param value="<%=uid%>" name="userid"/>
	 </jsp:include>
	 <%
 }
 %>
</body>
</html>