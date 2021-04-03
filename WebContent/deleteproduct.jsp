<%@ page import="java.sql.*" %>

<%
String product_id=request.getParameter("product_id");
String email=(String)session.getAttribute("email");
try{
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
	System.out.println("connection");
	
	PreparedStatement pstmt=con.prepareStatement("delete from products where product_id=?");
	pstmt.setString(1, product_id);
	
	pstmt.executeUpdate();
	response.sendRedirect("view.jsp");
}
  catch(Exception e){
      out.println(e);
  }								                                        	
%>