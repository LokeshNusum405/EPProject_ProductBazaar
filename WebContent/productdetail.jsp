<%@ page import="java.sql.*" %>
<%
	int product_id=Integer.parseInt(request.getParameter("product_id"));
	String uname="";
	String email=(String)session.getAttribute("email");
	String product_name="";
	String product_category="";
	String description="";
	String specification="";
	String amazon_link="";
	int amazon_cost=0;
	String flipkart_link="";
	int flipkart_cost=0;
	String shopclues="";
	int shopclues_cost=0;
	String ebay_link="";
	int ebay_cost=0;
	
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
				uname=rs.getString(1);
				uname=uname+" "+rs.getString(2);
			}
		}
		catch(Exception e){
			out.println(e);
		}
		try {
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
			System.out.println("connection");
			PreparedStatement pstmt=con.prepareStatement("select * from products where product_id=?");
			pstmt.setInt(1,product_id);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				product_name =rs.getString(2);
				product_category=rs.getString(3);
				description=rs.getString(4);
				specification=rs.getString(5);
				amazon_link=rs.getString(6);
				amazon_cost=rs.getInt(7);
				flipkart_link=rs.getString(8);
				flipkart_cost=rs.getInt(9);
				shopclues=rs.getString(10);
				shopclues_cost=rs.getInt(11);
				ebay_link=rs.getString(12);
				ebay_cost=rs.getInt(13);
			}
		}
		catch(Exception e){
			out.println(e);
		}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Product Bazaar</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="EpProject" name="products">


    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
        rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/slick/slick.css" rel="stylesheet">
    <link href="lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

    <body>
        <!-- Bottom Bar Start -->
    <div class="bottom-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-3">
                    <div class="logo">
                        <a href="index.jsp">
                            <img src="img/productbazaarlogo.JPG" alt="Product Bazaar" height="50px" width="250px">
                        </a>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="search">
                        <input type="text" placeholder="Search">
                        <button><i class="fa fa-search"></i></button>
                    </div>
                </div>


                <div class="col-md-3">
                    <div class="user">
                        <a href="aboutus.html" class="btn wishlist">
                            <i class="fa fa-address-card"></i>
                            <span>About Us</span>
                        </a>

						<div class="btn-group" role="group">
							<button id="btnGroupDrop1" type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" class="btn"><%=uname %></button>
						    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
						      <a class="dropdown-item" href="wishlist.jsp"><i class="fa fa-heart"></i> WishList</a>
						      <a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Log Out</a>
						    </div>
						</div>
					</div>  
                  </div>
                </div>
            </div>
        </div>
    <!-- Bottom Bar End -->        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Product Detail</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Product Detail Start -->
        <div class="product-detail">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="product-detail-top">
                            <div class="row align-items-center">
                                <div class="col-md-5">
                                    <div class="product-slider-single normal-slider">
                                        <img src="getImage.jsp?product_id=<%=product_id%>&i=1" alt="Product Image" >
                                        <img src="getImage.jsp?product_id=<%=product_id%>&i=2" alt="Product Image" height="50px" width="250px">
                                        <img src="getImage.jsp?product_id=<%=product_id%>&i=3" alt="Product Image" height="50px" width="250px">
                                        <img src="getImage.jsp?product_id=<%=product_id%>&i=4" alt="Product Image" height="50px" width="250px">
                                        <img src="getImage.jsp?product_id=<%=product_id%>&i=5" alt="Product Image" height="50px" width="250px">
                                        <img src="getImage.jsp?product_id=<%=product_id%>&i=6" alt="Product Image" height="50px" width="250px">
                                    </div>
                                    <div class="product-slider-single-nav normal-slider">
                                        <div class="slider-nav-img"><img src="getImage.jsp?product_id=<%=product_id%>&i=1" alt="Product Image"></div>
                                        <div class="slider-nav-img"><img src="getImage.jsp?product_id=<%=product_id%>&i=2" alt="Product Image"></div>
                                        <div class="slider-nav-img"><img src="getImage.jsp?product_id=<%=product_id%>&i=3" alt="Product Image"></div>
                                        <div class="slider-nav-img"><img src="getImage.jsp?product_id=<%=product_id%>&i=4" alt="Product Image"></div>
                                        <div class="slider-nav-img"><img src="getImage.jsp?product_id=<%=product_id%>&i=5" alt="Product Image"></div>
                                        <div class="slider-nav-img"><img src="getImage.jsp?product_id=<%=product_id%>&i=6" alt="Product Image"></div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="product-content">
                                        <div class="title"><h2><%=product_name %></h2></div>
                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        
                                        <div class="action">
                                        	<a class="btn" href="wishlist_demo.jsp?product_id=<%=product_id%>"><i class="fa fa-heart"></i>Add to Wishlist</a>
                                        </div>
                                        
                                        <br>
                                        
                                        <div class="price">
                                            <h4>Amazon: </h4>
                                            <p>$<%=amazon_cost%> <span>$<%=amazon_cost + 100%> </span></p>
                                        </div>
                                        
                                        <div class="action">
                                        	<a class="btn" href="<%=amazon_link %>"><i class="fa fa-shopping-cart"></i>Buy on Amazon</a>
                                        </div>
                                        <br>
                                        <div class="price">
                                            <h4>Flipkart: </h4>
                                            <p><%=flipkart_cost %> <span>$<%=flipkart_cost %></span></p>
                                        </div>
                                        
                                        <div class="action">
                                            <a class="btn" href="<%=flipkart_link %>"><i class="fa fa-shopping-cart"></i>Buy on Flipkart</a>
                                        </div>
                                        
                                        <br>
                                        
                                        <div class="price">
                                            <h4>Shopclues: </h4>
                                            <p>&nbsp;&nbsp;<%= shopclues_cost%> <span><%= shopclues_cost%></span></p>
                                        </div>
                                        
                                        <div class="action">
                                        	<a class="btn" href="<%=shopclues %>"><i class="fa fa-shopping-cart"></i>Buy on Shopclues</a>
                                        </div>
                                        
                                        <br>
                                        
                                        <div class="price">
                                            <h4>E-Bay: </h4>
                                            <p><%=ebay_cost %> <span>$<%=ebay_cost %></span></p>
                                        </div>
                                        
                                        <div class="action">
                                            <a class="btn" href="<%=ebay_link %>"><i class="fa fa-shopping-cart"></i>Buy on E-Bay</a>
                                        </div>
                                        
                                        <br>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row product-detail-bottom">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#specification">Specification</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#reviews">Reviews (1)</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div id="description" class="container tab-pane active">
                                        <h4>Product description</h4>
                                        <p>
                                           <%=description %> 
                                        </p>
                                    </div>
                                    <div id="specification" class="container tab-pane fade">
                                        <h4>Product specification</h4>
                                        <p>
                                           <%=specification %> 
                                        </p>
                                    </div>
                                    <div id="reviews" class="container tab-pane fade">
                                        <div class="reviews-submitted">
                                            <div class="reviewer">Phasellus Gravida - <span>01 Jan 2020</span></div>
                                            <div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p>
                                                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.
                                            </p>
                                        </div>
                                        <div class="reviews-submit">
                                            <h4>Give your Review:</h4>
                                            <div class="ratting">
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <div class="row form">
                                                <div class="col-sm-6">
                                                    <input type="text" placeholder="Name">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="email" placeholder="Email">
                                                </div>
                                                <div class="col-sm-12">
                                                    <textarea placeholder="Review"></textarea>
                                                </div>
                                                <div class="col-sm-12">
                                                    <button>Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="product">
                            <div class="section-header">
                                <h1>Related Products</h1>
                            </div>

                            <div class="row align-items-center product-slider product-slider-3">
                                <%
			                    try {
			            			Connection con=null;
			            			Class.forName("com.mysql.jdbc.Driver");
			            			System.out.println("loaded");
			            			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
			            			System.out.println("connection");
			            			PreparedStatement pstmt=con.prepareStatement("select * from products where product_category='Most Popular'");
									
			            			ResultSet rs=pstmt.executeQuery();
			            			while(rs.next()) {
			            				%>
			            				<div class="col-lg-12">
			            					<div class="product-item">
						                        <div class="product-title">
						                            <a href="#"><%=rs.getString(2) %></a>
						                            <div class="ratting">
						                                <i class="fa fa-star"></i>
						                                <i class="fa fa-star"></i>
						                                <i class="fa fa-star"></i>
						                                <i class="fa fa-star"></i>
						                                <i class="fa fa-star"></i>
						                            </div>
						                        </div>
						                        <div class="product-image">
						                            <a href="product-detail.html">
						                                <img src="getImage.jsp?product_id=<%=rs.getInt(1)%>&i=1" alt="Product Image" width="350px" height="350px" >
						                            </a>
						                            <div class="product-action">
						                                <a href="wishlist_demo.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-heart"></i></a>
						                            </div>
						                        </div>
						                        <div class="product-price">
						                        	<h3><span></span></h3>
						                            <a class="btn" href="product-detail.html"><i class="fas fa-eye"></i>View Details</a>
						                        </div>
						                    </div>
			      						</div>
			            				<%
			            			}
			            		}
			            		catch(Exception e){
			            			out.println(e);
			            		}
			                    %>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Side Bar Start -->
                    <div class="col-lg-4 sidebar">
                        <div class="sidebar-widget category">
                            <h2 class="title">Category</h2>
                            <nav class="navbar bg-light">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fa fa-female"></i>Fashion & Beauty</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fa fa-child"></i>Kids & Babies Clothes</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fa fa-tshirt"></i>Men & Women Clothes</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fa fa-mobile-alt"></i>Gadgets & Accessories</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fa fa-microchip"></i>Electronics & Accessories</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        
                        <div class="sidebar-widget widget-slider">
                            <div class="sidebar-slider normal-slider">
                                <%
                                try{
                        			Connection con=null;
                        			Class.forName("com.mysql.jdbc.Driver");
                        			System.out.println("loaded");
                        			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
                        			System.out.println("connection");
                        			PreparedStatement pstmt=con.prepareStatement("select * from products where not product_id=?");
                        			pstmt.setInt(1,product_id);
                        			ResultSet rs = pstmt.executeQuery();
                        			while(rs.next()){
                        				%>
                        				<div class="product-item">
			                                <div class="product-title">
			                                    <a href="#"><%=rs.getString(2) %></a>
			                                    <div class="ratting">
			                                        <i class="fa fa-star"></i>
			                                        <i class="fa fa-star"></i>
			                                        <i class="fa fa-star"></i>
			                                        <i class="fa fa-star"></i>
			                                        <i class="fa fa-star"></i>
			                                    </div>
			                                </div>
			                                <div class="product-image">
			                                    <a href="product-detail.html">
			                                        <img src="getImage.jsp?product_id=<%=rs.getInt(1)%>&i=1" alt="Product Image" width="350px" height="350px" >
			                                    </a>
			                                    <div class="product-action">
					                                <a href="wishlist_demo.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-heart"></i></a>
					                            </div>
			                                </div>
			                                <div class="product-price">
					                        	<h3><span></span></h3>
					                            <a class="btn" href="productdetail.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-shopping-cart"></i>View Details</a>
					                        </div>
			                            </div>
                        				<%
                        			}
                                }
                        		catch(Exception e){
                        			out.println(e);		
                        		}
                                %>
                        
                            </div>
                        </div>
                        
                        
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
        <!-- Product Detail End -->
        
        <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/brand-1.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-2.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-3.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-4.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-5.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-6.png" alt=""></div>
                </div>
            </div>
        </div>
        <!-- Brand End -->
        <!-- Footer Start -->
    <div class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="footer-widget">
                        <h2>Get in Touch </h2>
                        <div class="contact-info">
                            <p><i class="fa fa-map-marker"></i>123 product Bazzar, Vijayawada, India</p>
                            <p><i class="fa fa-envelope"></i>product@bazaar.com</p>
                            <p><i class="fa fa-phone"></i>+91 12345 67890</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="footer-widget">
                        <h2>Follow Us On</h2>
                        <div class="contact-info">
                            <div class="social">
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
                                <a href=""><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="footer-widget">
                        <h2>Website Info</h2>
                        <ul>
                            <li><a href="aboutus.html">About Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Condition</a></li>
                        </ul>
                    </div>
                </div>

                
            </div>
        </div>
    </div>
    <!-- Footer End -->

    <!-- Footer Bottom Start -->
    <div class="footer-bottom">
        <div class="container">
            <div class="text-center">
            	<div class="copyright " style="text-align: center;">
                    <p>Copyright &copy; 2021, E-Commerce pvt Limited. All Rights Reserved</p>
                </div>
                
                <div class=" mt-2 text-center">
                      <div class="logo">
                        <a href="index.html">
                            <img src="img/productbazaarlogo.JPG" alt="Product Bazaar" height="70px" width="350px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Bottom End -->     
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
