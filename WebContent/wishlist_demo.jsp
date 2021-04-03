<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String email=(String)session.getAttribute("email");
	int id=Integer.parseInt(request.getParameter("product_id"));
	
	try{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("loaded");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
		System.out.println("connection");
		PreparedStatement pstmt=con.prepareStatement("select * from wishlist where email=? and product_id=?");
		pstmt.setString(1, email);
		pstmt.setInt(2,id);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
		
			response.sendRedirect("wishlist.jsp");
		}
		else{
			pstmt=con.prepareStatement("insert into wishlist values(?,?)");
			pstmt.setString(1, email);
			pstmt.setInt(2, id);
			int n=pstmt.executeUpdate();
			if(n>0){
				
				response.sendRedirect("wishlist.jsp");
			}
		}
	}
	catch(Exception e){
		out.println(e);
	}
%>