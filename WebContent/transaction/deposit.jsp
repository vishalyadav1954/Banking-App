<%@page import="java.sql.*"%>
<%@ include file="../../menu.jsp" %>
<html>
 <body onload="makeActive('deposit')">
 <%
 int amount=(Integer.parseInt(request.getParameter("amount")));
 PreparedStatement ps=(PreparedStatement)application.getAttribute("deposit");
 ps.setInt(1,amount);
 ps.setString(2,(String)session.getAttribute("accountno"));
 ps.executeUpdate();
 %> 
 <div class='dv'>
  <h2 style='color:green;font-family:cursive'>Amount <span>&#8377;<%=amount%></span> has been credited into your account
 </h2>
 </div>
 </body>
</html>