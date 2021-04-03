<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");
String email=(String)session.getAttribute("email");
try{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("loaded");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
		System.out.println("connection");
		PreparedStatement pstmt=con.prepareStatement("update user set fname=?,lname=?,mobile=?,address=? where email=?");
		pstmt.setString(1, fname);
		pstmt.setString(2, lname);
		pstmt.setString(3, mobile);
		pstmt.setString(4, address);
		pstmt.setString(5, email);
		
		int n=pstmt.executeUpdate();
		if(n>0) {
			response.sendRedirect("index.jsp");
		}
		else{
			out.println("Not updated");
		}
	}
	catch(Exception e){
		out.println(e);
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>