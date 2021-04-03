<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body>


<!-- tax  discount (%) 
brand name
-->

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
			PreparedStatement pstmt=con.prepareStatement("select * from admin where email=?");
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				uname=rs.getString(1);
				session.setAttribute("email", email);
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
        
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>    

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
                        <a href="adminhome.jsp">
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
						      <a class="dropdown-item" href="#"><i class="fa fa-line-chart"></i> View Statistics</a>
						      <a class="dropdown-item" href="view.jsp"><i class="fa fa-shopping-cart"></i> View Products</a>
						      <a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Log Out</a>
						    </div>
						</div>
					</div>  
                  </div>
                </div>
            </div>
        </div>
    <!-- Bottom Bar End -->
    
    <!-- 
Categories:
Accessories - watches,shoes,belts,caps,
electronic gadgets - mobiles ,laptops ,tabs
Beauty Products - facewash,makeup kits,
Stationary - books,pens,pencils,sharpners ,erazers,geometry

watch-2000 10 % -1800

 -->


<div class="container tm-mt-big tm-mb-big">
    <div class="row">
      <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
          <div class="row">
            <div class="col-12" >
              <center><h2 class="tm-block-title d-inline-block">Add Product</h2></center>
            </div>
          </div>
          <div class="row tm-edit-product-row">
            <div class="col-xl-6 col-lg-6 col-md-12">
              <form action="admin_addproducts.jsp" class="tm-edit-product-form">
                <div class="form-group mb-3">
                  <label for="name">Product Name</label>
                  <input id="name" name="name" type="text" class="form-control validate" required />
                </div>                
                
                <div class="form-group mb-3">
                  <label for="category">Category</label>
                  <select class="custom-select tm-select-accounts" name="category" id="category">
                    <option selected>Select category</option>
                    <option value="Trending">Trending</option>
                    <option value="New Arrival">New Arrival</option>
                    <option value="Most Popular">Most Popular</option>
                    <option value="Fashion & Beauty">Fashion & Beauty</option>
                    <option value="Gadgets & Accessories">Gadgets & Accessories</option>
                    <option value="Electronics & Accessories">Electronics & Accessories</option>
                  </select>
                </div>

               

                <div class="form-group mb-3">
                  <label for="description">Description</label>
                  <textarea name="description" id="description" class="form-control validate" rows="3" required></textarea>
                </div>

                <div class="form-group mb-3">
                  <label for="specification">Specification</label>
                  <textarea name="specification" id="specification" class="form-control validate" rows="3" required></textarea>
                </div>
				
				
				
                <div class="form-group mb-3">
                  <label for="amazon">Amazon Link</label>
                  <input id="amazon" name="amazon" type="text" class="form-control validate" required />
                </div>

                <div class="form-group mb-3">
                  <label for="flipkart">Flipkart Link</label>
                  <input id="flipkart" name="flipkart" type="text" class="form-control validate" required />
                </div>
                
                <div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="amazon_cost">Amazon Cost
                    </label>
                    <input id="amazon_cost" name="amazon_cost" type="text" class="form-control validate"
                      data-large-mode="true" />
                  </div>
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="flipkart_cost">Flipkart Cost
                    </label>
                    <input id="flipkart_cost" name="flipkart_cost" type="text" class="form-control validate" required />
                  </div>
                </div>

                <div class="form-group mb-3">
                  <label for="shopclues">Shopclues Link</label>
                  <input id="shopclues" name="shopclues" type="text" class="form-control validate" required />
                </div>

                <div class="form-group mb-3">
                  <label for="ebay">E-Bay Link</label>
                  <input id="ebay" name="ebay" type="text" class="form-control validate" required />
                </div>
				
				<div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="shopclues_cost">Shopclues Cost
                    </label>
                    <input id="shopclues_cost" name="shopclues_cost" type="text" class="form-control validate"
                      data-large-mode="true" />
                  </div>
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="ebay_cost">E-Bay Cost
                    </label>
                    <input id="ebay_cost" name="ebay_cost" type="text" class="form-control validate" required />
                  </div>
                </div>
				<br>
				<div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah1" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 1" name="image1"
                  onchange="readURL1(this);" />
              </div>
              
              <br><br>
              
              <div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah2" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 2" name="image2"
                  onchange="readURL2(this);" />
              </div>
              <br>
            </div>
            
            <!-- Right side Start -->
            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
              
              <div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah3" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 3" name="image3"
                  onchange="readURL3(this);" />
              </div>
              <br><br>
              <div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah4" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 4" name="image4"
                  onchange="readURL4(this);" />
              </div>
              <br><br>
              <div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah5" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 5" name="image5"
                  onchange="readURL5(this);" />
              </div>
              <br><br>
              <div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah6" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 6" name="image6"
                  onchange="readURL6(this);" />
              </div>
              <br><br>
             <div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah7" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE 7" name="image7"
                  onchange="readURL7(this);" />
              </div>
            </div>
			<br><br>
			<!-- Right side end -->
            <div class="col-12">
              <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
              <br><br>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>


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
    
    <script src="js/jquery-3.3.1.min.js"></script>
  <!-- https://jquery.com/download/ -->
  <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
  <!-- https://jqueryui.com/download/ -->
  <script src="js/bootstrap.min.js"></script>
  <!-- https://getbootstrap.com/ -->
  <script>
    $(function () {
      $("#expire_date").datepicker();
    });
    
    
    
    function readURL1(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah1')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function readURL2(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah2')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function readURL3(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah3')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function readURL4(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah4')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function readURL5(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah5')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function readURL6(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah6')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function readURL7(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah7')
                    .attr('src', e.target.result)
                    .width(398)
                    .height(192);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    
  </script>
    
</body>

</html>

