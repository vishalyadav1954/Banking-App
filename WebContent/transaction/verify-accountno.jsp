<%@page import="java.sql.*"%>
<%
int ran=Integer.parseInt(request.getParameter("accountno"));
int san=Integer.parseInt((String)session.getAttribute("accountno"));
session.setAttribute("ran",String.valueOf(ran));
if(ran==san)
{
	%>
	<jsp:include page="transfer-money.jsp" />
	<div class='dvv'>
   	   <label class='lah' id="error" style='color:red'>This <%=ran%> is your own account number</label>
  	 </div> 
	<%
	return;
}
PreparedStatement ps=(PreparedStatement)application.getAttribute("selectaccount");
ps.setInt(1,ran);
ResultSet rst=ps.executeQuery();
if(!rst.next())
{
	%>
	<jsp:include page="transfer-money.jsp" />
	<div class='dvv'>
   	   <label class='lah' id="error" style='color:red'>This <%=ran%> does not exist</label>
  	 </div> 
	<%
	return;
}
%>
<%@ include file="../../menu.jsp" %>
<div class='dvv'>
  <label class='lah' style='color:green'>You are transferring to <span><%=ran%></span></label>
</div> 
<form action="transfer.jsp"> 
  <table class='ta' style='background-color:magenta'>
    <tr>
     <td class='td'>Enter amount:</td>
     <td class='td'><input type='number' id="amount" name='amount' class='tb' required></td>
     <td class='td'><button class='bt'>Submit</button></td>
    </tr>
   </table>
  </form>
