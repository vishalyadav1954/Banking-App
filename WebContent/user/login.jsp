<%
if(session.getAttribute("username")!=null)
{
	response.sendRedirect("/banking-app");
	return;
}
%>
<html>
 <head>
 <link href='/banking-app/CSS/style.css' rel='stylesheet'>
 <link href='/banking-app/CSS/login.css' rel='stylesheet'>
 </head>
 <body class='bgi'>
 <body>
  <%
  String message=request.getParameter("msg");
  String uid=request.getParameter("userid");
  if(message==null)
	  message=uid="";
  %>
  <div class='dvv'>
   <label  style='color:orange;font-size:3vw'>ONLINE BANKING</label>
  </div>
  <div align='center'>
    <div class='dvuser'>
     <h2 style='font-size:2.1vw'>User account sign in</h2>
     <form action="authenticate-user.jsp" method='post'>
       <div class='dvlog'>
         <label class='la' style='font-size:2vw'>Enter user id</label><br>
         <input type='text' name='userid' value="<%=uid%>" class='tblog' required>
       </div>
       <div class='dvlog'>
         <label class='la' style='font-size:2vw'>Enter password</label><br>
         <input type='password' name='password' class='tblog' required>
       </div>	
       <div class='dvlog' style='margin-top:2vw'>	
         <button class='btlog'>Submit</button>
         <div style="text-align:center;margin-top:1vw" >
            <label class='la' style='color:red'><%=message%></label>
         </div>
       </div>	
      </form> 
    </div>
    <div class='dvuser' style='padding:5px 10px 10px 10px'>
     <h2 style='font-size:2.1vw'>Don't have an account?</h2>
     <div class='dvlog' style='margin-top:1vw'>	
      <form action='registration.jsp'>
        <button class='btlog' style='background-color:#008CBA'>Create Account</button>
      </form>
     </div>
  </div>
  </div>
 </body>
</html>