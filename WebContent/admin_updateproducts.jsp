<%@ page import="java.sql.*,java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String email=(String)session.getAttribute("email");
int product_id = Integer.parseInt(request.getParameter("product_id"));
String product_name = request.getParameter("name");
String product_category = request.getParameter("category");
int amazon_cost = Integer.parseInt(request.getParameter("amazon_cost"));
int flipkart_cost = Integer.parseInt(request.getParameter("flipkart_cost"));
int shopclues_cost = Integer.parseInt(request.getParameter("shopclues_cost"));
int ebay_cost = Integer.parseInt(request.getParameter("ebay_cost"));

String path="D:\\Laptop\\Lokesh\\EP\\Project\\ProductBazaar-Official\\ProductBazaar\\adminimages\\";
String description = request.getParameter("description");
String specification = request.getParameter("specification");
String amazon = request.getParameter("amazon");
String flipkart = request.getParameter("flipkart");
String shopclues = request.getParameter("shopclues");
String ebay = request.getParameter("ebay");

String image1=request.getParameter("image1");
String path1=path+image1;
File imagefile1=new File(path1);
FileInputStream fis1=new FileInputStream(imagefile1);

String image2=request.getParameter("image2");
String path2=path+image2;
File imagefile2=new File(path2);
FileInputStream fis2=new FileInputStream(imagefile2);

String image3=request.getParameter("image3");
String path3=path+image3;
File imagefile3=new File(path3);
FileInputStream fis3=new FileInputStream(imagefile3);

String image4=request.getParameter("image4");
String path4=path+image4;
File imagefile4=new File(path4);
FileInputStream fis4=new FileInputStream(imagefile4);

String image5=request.getParameter("image5");
String path5=path+image5;
File imagefile5=new File(path5);
FileInputStream fis5=new FileInputStream(imagefile5);

String image6=request.getParameter("image6");
String path6=path+image1;
File imagefile6=new File(path6);
FileInputStream fis6=new FileInputStream(imagefile6);

String image7=request.getParameter("image7");
String path7=path+image7;
File imagefile7=new File(path7);
FileInputStream fis7=new FileInputStream(imagefile7);

try{
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
	System.out.println("connection");
	PreparedStatement pstmt=con.prepareStatement("update products set product_name=?, product_category=?, description=?, specification=?, amazon_link=?, amazon_cost=?, flipkart_link=?, flipkart_cost=?, shopclues=?, shopclues_cost=?, ebay_link=?, ebay_cost=?, image1=?, image2=?, image3=?, image4=?, image5=?, image6=?, image7=? where product_id=?");
	pstmt.setString(1,product_name);
	pstmt.setString(2,product_category);
	pstmt.setString(3,description);
	pstmt.setString(4,specification);
	pstmt.setString(5,amazon);
	pstmt.setInt(6,amazon_cost);
	pstmt.setString(7,flipkart);
	pstmt.setInt(8,flipkart_cost);
	pstmt.setString(9,shopclues);
	pstmt.setInt(10,shopclues_cost);
	pstmt.setString(11,ebay);
	pstmt.setInt(12,ebay_cost);
	pstmt.setBinaryStream(13, (InputStream)fis1, (int)(imagefile1.length()));
	pstmt.setBinaryStream(14, (InputStream)fis2, (int)(imagefile2.length()));
	pstmt.setBinaryStream(15, (InputStream)fis3, (int)(imagefile3.length()));
	pstmt.setBinaryStream(16, (InputStream)fis4, (int)(imagefile4.length()));
	pstmt.setBinaryStream(17, (InputStream)fis5, (int)(imagefile5.length()));
	pstmt.setBinaryStream(18, (InputStream)fis6, (int)(imagefile6.length()));
	pstmt.setBinaryStream(19, (InputStream)fis7, (int)(imagefile7.length()));
	pstmt.setInt(20,product_id);
	
	int n=pstmt.executeUpdate();
	if(n>0){
		System.out.println("Product Updated Successfully ");
		response.sendRedirect("view.jsp");
	}
}
catch(Exception e){
	out.println(e);
}
%>