<%@page import="java.sql.*"%>
<html>
 <body onload="makeActive('withdraw')">
 <%
 PreparedStatement ps1=(PreparedStatement)application.getAttribute("selectaccount");
 ps1.setString(1,(String)session.getAttribute("accountno"));
 ResultSet rst=ps1.executeQuery();
 rst.next();
 int camount=rst.getInt(1);
 int wamount=(Integer.parseInt(request.getParameter("amount")));
 if(wamount>camount)
 {
	 %>
	 <jsp:include page="withdraw-money.jsp">
	    <jsp:param value="<%=wamount%>" name="money"/>
	 </jsp:include>
	 <div class='dvv'>
	  <label style='color:red' class='la'>Sorry you do not have sufficient amount</label>
	 </div>
	 <%
 }
 else
 {
 	PreparedStatement ps2=(PreparedStatement)application.getAttribute("withdraw");
 	ps2.setInt(1,wamount);
 	ps2.setString(2,(String)session.getAttribute("accountno"));
 	ps2.executeUpdate();
 	%> 
 	<%@ include file="../../menu.jsp" %>
 	<div class='dv'>
  		<h2 style='color:green;font-family:cursive'>Amount <span>&#8377;<%=wamount%></span> has been debited from your account</h2>
 	</div>
 <%} %>	
 </body>
</html>