<%@page import="java.sql.*"%>
<html>
<head>
  <link href='/banking-app/CSS/style.css' rel='stylesheet'>
  <link href='/banking-app/CSS/bootstrap.min.css' rel='stylesheet'>
</head>
<body class='bgi'>
 <%
 String uid=request.getParameter("userid");
 PreparedStatement ps1=(PreparedStatement)application.getAttribute("selectuser");
 ps1.setString(1,uid);
 ResultSet rst1=ps1.executeQuery();
 if(rst1.next())
 {
	 %>
	  <div class='dvv'>
	  	<label class='la' style='color:red'>User with user id <%=uid%> already exists</label>
	   </div>
	   <jsp:include page="registration.jsp" />
	 <%
	 return;
 }
 PreparedStatement ps2=(PreparedStatement)application.getAttribute("createuser");
 ps2.setString(1,uid);
 ps2.setString(2,request.getParameter("password"));
 ps2.setString(3,request.getParameter("name"));
 ps2.setString(4,request.getParameter("phone"));
 ps2.setString(5,request.getParameter("address"));
 ps2.executeUpdate();
 //code to save account details into accountinfo table
 PreparedStatement ps3=(PreparedStatement)application.getAttribute("createaccount");
 ps3.setString(1,uid);
 ps3.setInt(2,0);
 ps3.executeUpdate();
 //code to get accountno from accountinfo table
 PreparedStatement ps4=(PreparedStatement)application.getAttribute("selectano");
 ps4.setString(1,uid);
 ResultSet rst2=ps4.executeQuery();
 rst2.next();
 int accountno=rst2.getInt(1);
 %>
 <div class='dvv'>
   <label class='lah' style='color:white;text-decoration:underline;font-size:2.5vw'>User Registration</label>
  </div>
  <hr>
 <div class='dv'>
  <label class='lah' style='color:white'>Congratulations!!!<%=request.getParameter("name")%> </label>
  <br><br>
  <label class='la' style='color:white'>You have been registered successfully</label>
  <br><br>
  <label class='la' style='color:white'>Your account number is <%=accountno%></label>
 </div>
 <div class='dvv'>
   <a href='login.jsp' class='btl'>Click to Login</a>
 </div>
</body>
</html>