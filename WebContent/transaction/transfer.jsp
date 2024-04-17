<%@page import="java.sql.*"%>
<%@ include file="../../menu.jsp" %>
<html>
 <body onload="makeActive('transfer')">
 <%
 int tamount=(Integer.parseInt(request.getParameter("amount")));
 String san=(String)session.getAttribute("accountno");
 PreparedStatement ps1=(PreparedStatement)application.getAttribute("selectaccount");
 ps1.setString(1,san);
 ResultSet rst=ps1.executeQuery();
 rst.next();
 int camount=rst.getInt(1);
 if(tamount>camount)
 {
	 %>
	 <div class='dv'>
  		<h2 style='color:red;font-family:cursive'>You do not have sufficient amount</h2>
     </div>
	 <%
	 return;
 }
 PreparedStatement ps2=(PreparedStatement)application.getAttribute("withdraw");
 ps2.setInt(1,tamount);
 ps2.setString(2,san);
 ps2.executeUpdate();
 PreparedStatement ps3=(PreparedStatement)application.getAttribute("deposit");
 ps3.setInt(1,tamount);
 String ran=(String)session.getAttribute("ran");
 ps3.setString(2,ran);
 ps3.executeUpdate();
 %> 
 <div class='dv'>
  <h2 style='color:green;font-family:cursive'>Amount <span>&#8377;<%=tamount%></span> has been transfered from your account to account no <%=ran%></h2>
 </div>
 </body>
</html>