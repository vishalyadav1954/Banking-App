<html>
 <head>
  <link href='/banking-app/CSS/style.css' rel='stylesheet'>
 </head>
 <body class='bgi'>
  <div>
    <img src="/banking-app/images/thnk.png" width="100%" height="34%"/>
  </div>
  <hr style='border:2px solid green'><br>
  <div style='margin-top:30pd;color:white ' align='center'>
 	<h1><%=session.getAttribute("username")%>,thank you for using app</h1>
 	<h1>You have successfully logged out...</h1>
  </div>
  <div style='margin-top:30px;font-family:lucida bright' align='center'>
     <a href='/banking-app/user/login.jsp' style='font-size:20px;color:#8E44AD'>Click here for re-login</a>
  </div>
  <%
  session.invalidate();
  %>
 </body> 
</html>