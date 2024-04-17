package com.cetpa;

import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ConnectionListener implements ServletContextListener 
{
	public void contextInitialized(ServletContextEvent evt)
	{
		ServletContext context=evt.getServletContext();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp12?createDatabaseIfNotExist=true","root","mysql");
			Statement st=cn.createStatement();
			createTable(st);
			PreparedStatement pscreateuser=cn.prepareStatement("insert into userinfo values(?,?,?,?,?)");
			context.setAttribute("createuser", pscreateuser);
			PreparedStatement pscreateaccount=cn.prepareStatement("insert into accountinfo(userid,amount) values(?,?)");
			context.setAttribute("createaccount", pscreateaccount);
			PreparedStatement psselectano=cn.prepareStatement("select * from accountinfo where userid=?");
			context.setAttribute("selectano", psselectano);
			PreparedStatement psselectuser=cn.prepareStatement("select * from userinfo where userid=?");
			context.setAttribute("selectuser", psselectuser);
			PreparedStatement psselectaccount=cn.prepareStatement("select amount from accountinfo where accountno=?");
			context.setAttribute("selectaccount", psselectaccount);
			PreparedStatement psdeposit=cn.prepareStatement("update accountinfo set amount=amount+? where accountno=?");
			context.setAttribute("deposit",psdeposit);
			PreparedStatement pswithdraw=cn.prepareStatement("update accountinfo set amount=amount-? where accountno=?");
			context.setAttribute("withdraw",pswithdraw);
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	private void createTable(Statement st)throws Exception 
	{
		st.execute("create table if not exists userinfo(userid varchar(30) primary key,password varchar(30),username varchar(30),phone varchar(20),address varchar(50))");
		st.execute("create table if not exists accountinfo(accountno int primary key auto_increment,userid varchar(30),amount int)auto_increment=11111");
	}
}
