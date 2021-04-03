<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String pwd=request.getParameter("pwd");
String npwd=request.getParameter("npwd");
String cpwd=request.getParameter("cpwd");
String email=(String)session.getAttribute("email");
try{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("loaded");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
		System.out.println("connection");

		PreparedStatement pstmt=con.prepareStatement("select * from user where email=?");
		pstmt.setString(1, email);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			if(rs.getString(4).equals(pwd)){
				if(npwd.equals(cpwd)){
					PreparedStatement pstmt1=con.prepareStatement("update user set pwd=? where email=?");
					pstmt1.setString(1, npwd);
					pstmt1.setString(2, email);
					int n=pstmt1.executeUpdate();
					if(n>0) {
						response.sendRedirect("index.jsp");
					}
					else{
						out.println("Not updated");
					}
				}
			}
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