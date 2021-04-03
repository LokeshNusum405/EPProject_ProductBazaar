<%@ page import="java.sql.*" %>
<%
	String uname="";
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
				uname=rs.getString(1);
				uname=uname+" "+rs.getString(2);
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
							<button id="btnGroupDrop1" type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" class="btn"><i class="fa fa-user"></i>&nbsp;<%=uname %></button>
						    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
						      <a class="dropdown-item" href="wishlist.jsp"><i class="fa fa-heart"></i> WishList</a>
						      <a class="dropdown-item" href="myaccount.jsp"><i class="fa fa-user"></i> My Account</a>
						      <a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Log Out</a>
						    </div>
						</div>
					</div>  
                  </div>
                </div>
            </div>
        </div>
    <!-- Bottom Bar End -->

    <!-- Main Slider Start -->
    <div class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <nav class="navbar bg-light">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp"><i class="fa fa-home"></i>Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="trending.jsp"><i class="fa fa-shopping-bag"></i>Trending</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="new_arrival.jsp"><i class="fa fa-plus-square"></i>New Arrivals</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="most_popular.jsp"><i class="fa fa-tags"></i>Most Popular</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="fashion_beauty.jsp"><i class="fa fa-female"></i>Fashion & Beauty</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="gadgets_accessories.jsp"><i class="fa fa-mobile-alt"></i>Gadgets & Accessories</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="electronics_accessories.jsp"><i class="fa fa-microchip"></i>Electronics & Accessories</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6">
                    <div class="header-slider normal-slider">
                        <div class="header-slider-item">
                            <img src="img/slider-1.jpg" alt="Slider Image" height="400px" width="700px"/>
                            <div class="header-slider-caption">

                                <a class="btn" href="gadgets_accessories.jsp"><i class="fa fa-shopping-cart" ></i>Shop Now</a>
                            </div>
                        </div>
                        <div class="header-slider-item">
                            <img src="img/slider-2.jpg" alt="Slider Image"  height="400px" width="700px"/>
                            <div class="header-slider-caption">
                                <a class="btn" href="fashion_beauty.jsp"><i class="fa fa-shopping-cart" ></i>Shop Now</a>
                            </div>
                        </div>
                        <div class="header-slider-item">
                            <img src="img/slider-3.jpeg" alt="Slider Image" height="400px" width="700px"/>
                            <div class="header-slider-caption">
                                <a class="btn" href="gadgets_accessories.jsp"><i class="fa fa-shopping-cart"></i>Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="header-img">
                        <div class="img-item">
                            <img src="img/category-1.jpg" />
                            <a class="img-text" href="fashion_beauty.jsp">
                                <p style="color: #600001;">Fashion & Beauty</p>
                            </a>
                        </div>
                        <div class="img-item">
                            <img src="img/category-2.jpg" />
                            <a class="img-text" href="fashion_beauty.jsp">
                                <p style="color:#600001;">Kids & Babies Clothes</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Slider End -->

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

    

    <!-- Category Start-->
    <div class="category">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="category-item ch-400">
                        <img src="img/category-3.jpg" />
                        <a class="category-name" href="fashion_beauty.jsp">
                            <p style="color:#600001;">Fashion</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-250">
                        <img src="img/category-4.jpg" />
                        <a class="category-name" href="fashion_beauty.jsp">
                            <p style="color:#600001;">Beauty products</p>
                        </a>
                    </div>
                    <div class="category-item ch-150">
                        <img src="img/category-5.jpg" />
                        <a class="category-name" href="gadgets_accessories.jsp">
                            <p style="color:#600001;">Accessories</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-150">
                        <img src="img/category-6.jpg" />
                        <a class="category-name" href="fashion_beauty.jsp">
                            <p style="color:#600001;">Facials</p>
                        </a>
                    </div>
                    <div class="category-item ch-250">
                        <img src="img/category-7.jpg" />
                        <a class="category-name" href="electronics_accessories.jsp">
                            <p style="color:#600001;">Electronics</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-400">
                        <img src="img/category-8.jpg" />
                        <a class="category-name" href="fashion_beauty.jsp">
                            <p style="color:#600001;"> Fashion & Beauty </p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Category End-->



    <!-- Featured Product Start -->
    <div class="featured-product product">
        <div class="container-fluid">
            <div class="section-header">
                <h1>Featured Product</h1>
            </div>
            <div class="row align-items-center product-slider product-slider-4">
                    <%
                    int i=1;
                    
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
			                            <a href="productdetail.jsp?product_id=<%=rs.getInt(1)%>"><%=rs.getString(2) %></a>
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
			                            <img  src="getImage.jsp?product_id=<%=rs.getInt(1)%> &i=<%=i%>" alt="Product Image" width="350px" height="350px" >
			                            </a>
			                            <div class="product-action">
			                                <a href="wishlist_demo.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-heart"></i></a>
			                            </div>
			                        </div>
			                        <div class="product-price">
			                        	<h3><span></span></h3>
			                            <a class="btn" href="productdetail.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-eye"></i>View Details</a>
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
    <!-- Featured Product End -->


    <!-- Recent Product Start -->
    <div class="recent-product product">
        <div class="container-fluid">
            <div class="section-header">
                <h1>Recent Product</h1>
            </div>
            <div class="row align-items-center product-slider product-slider-4">
                <%
                    try {
            			Connection con=null;
            			Class.forName("com.mysql.jdbc.Driver");
            			System.out.println("loaded");
            			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
            			System.out.println("connection");
            			PreparedStatement pstmt=con.prepareStatement("select * from products where product_category='New Arrival'");
						
            			ResultSet rs=pstmt.executeQuery();
            			while(rs.next()) {
            				%>
            				<div class="col-lg-12">
            					<div class="product-item">
			                        <div class="product-title">
			                            <a href="productdetail.jsp?product_id=<%=rs.getInt(1)%>"><%=rs.getString(2) %></a>
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
			                                <img src="getImage.jsp?product_id=<%=rs.getInt(1)%> &i=<%=i%>" alt="Product Image" width="350px" height="350px">
			                            </a>
			                            <div class="product-action">
			                                <a href="wishlist_demo.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-heart"></i></a>
			                            </div>
			                        </div>
			                        <div class="product-price">
			                        	<h3><span></span></h3>
			                            <a class="btn" href="productdetail.jsp?product_id=<%=rs.getInt(1)%>"><i class="fa fa-eye"></i>View Details</a>
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
    <!-- Recent Product End -->

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
                        <a href="index.jsp">
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