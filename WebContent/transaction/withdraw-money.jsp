<%@ include file="../../menu.jsp" %>
<html>
 <body onload="makeActive('withdraw')">
 <form action="withdraw.jsp"> 
  <%
  String amount=request.getParameter("money");
  if(amount==null)
	  amount="";
  %>
  <table class='ta' style='background-color:green'>
    <tr>
     <td class='td'>Enter amount:</td>
     <td class='td'><input type='number' name='amount' value="<%=amount%>" class='tb' required></td>
     <td class='td'><button class='bt'>Submit</button></td>
    </tr>
   </table>
  </form> 
 </body>
</html>