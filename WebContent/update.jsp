<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String uname="";
	String email=(String)session.getAttribute("email");
	int id=Integer.parseInt(request.getParameter("product_id"));
	String product_name ="";
	String product_category = "";
	int amazon_cost = 0;
	int flipkart_cost = 0;
	int shopclues_cost = 0;
	int ebay_cost = 0;

	String description = "";
	String specification = "";
	String amazon = "";
	String flipkart = "";
	String shopclues = "";
	String ebay = "";
	String eimage1="";
	
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
			}
			
			PreparedStatement pstmt1=con.prepareStatement("select * from products where product_id=?");
			pstmt1.setInt(1, id);
			ResultSet rs1=pstmt1.executeQuery();
			if(rs1.next()) {
				 product_name = rs1.getString(2);
				 product_category = rs1.getString(3);
				 amazon_cost = rs1.getInt(7);
				 flipkart_cost = rs1.getInt(9);
				 shopclues_cost = rs1.getInt(11);
				 ebay_cost = rs1.getInt(13);

				 description = rs1.getString(4);
				 specification = rs1.getString(5);
				 amazon = rs1.getString(6);
				 flipkart = rs1.getString(8);
				 shopclues = rs1.getString(10);
				 ebay = rs1.getString(12);
				 Blob image1;
				byte [] imageData1;
				 image1=rs1.getBlob(13);
				 imageData1=image1.getBytes(1, (int)image1.length());
				 String encodedImage1=Base64.getEncoder().encodeToString(imageData1);
				 eimage1 = "data.image/jpg;base64,"+encodedImage1;
				 
						 
				 
				 
				 //image1=rs.getString(13);
			}
		}
		catch(Exception e){
			out.println(e);
		}
	

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
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
						      <a class="dropdown-item" href="#"><i class="fa fa-heart"></i> View Statistics</a>
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


<div class="container tm-mt-big tm-mb-big">
    <div class="row">
      <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
          <div class="row">
            <div class="col-12" >
              <center><h2 class="tm-block-title d-inline-block">Update Product</h2></center>
            </div>
          </div>
          <div class="row tm-edit-product-row">
            <div class="col-xl-6 col-lg-6 col-md-12">
              <form action="admin_updateproducts.jsp?product_id=<%=id %>" method="post" class="tm-edit-product-form">
                <div class="form-group mb-3">
                  <label for="name">Product Name</label>
                  <input id="name" name="name" type="text" value="<%=product_name %>" class="form-control validate" required />
                </div>                
                
                <div class="form-group mb-3">
                  <label for="category">Category</label>
                  <select class="custom-select tm-select-accounts" name="<%=product_category %>" id="category">
                    <option selected><%=product_category %></option>
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
                  <textarea name="description" id="description" class="form-control validate" rows="3" required><%=description %></textarea>
                </div>

                <div class="form-group mb-3">
                  <label for="specification">Specification</label>
                  <textarea name="specification" id="specification" class="form-control validate" rows="3" required><%=specification %></textarea>
                </div>
				
				
				
                <div class="form-group mb-3">
                  <label for="amazon">Amazon Link</label>
                  <input id="amazon" name="amazon" type="text" value="<%=amazon %>" class="form-control validate" required />
                </div>

                <div class="form-group mb-3">
                  <label for="flipkart">Flipkart Link</label>
                  <input id="flipkart" name="flipkart" type="text" value="<%=flipkart %>" class="form-control validate" required />
                </div>
                
                <div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="amazon_cost">Amazon Cost
                    </label>
                    <input id="amazon_cost" name="amazon_cost" value="<%=amazon_cost %>" type="text" class="form-control validate"
                      data-large-mode="true" />
                  </div>
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="flipkart_cost">Flipkart Cost
                    </label>
                    <input id="flipkart_cost" name="flipkart_cost" value="<%=flipkart_cost %>" type="text"  class="form-control validate" required />
                  </div>
                </div>

                <div class="form-group mb-3">
                  <label for="shopclues">Shopclues Link</label>
                  <input id="shopclues" name="shopclues" type="text" value="<%=shopclues %>" class="form-control validate" required />
                </div>

                <div class="form-group mb-3">
                  <label for="ebay">E-Bay Link</label>
                  <input id="ebay" name="ebay" type="text" value="<%=ebay %>" class="form-control validate" required />
                </div>
				
				<div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="shopclues_cost">Shopclues Cost
                    </label>
                    <input id="shopclues_cost" name="shopclues_cost" value="<%=shopclues_cost %>" type="text" class="form-control validate"
                      data-large-mode="true" />
                  </div>
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                    <label for="ebay_cost">E-Bay Cost
                    </label>
                    <input id="ebay_cost" name="ebay_cost" type="text" value="<%=ebay_cost %>" class="form-control validate" required />
                  </div>
                </div>
				<div class="tm-product-img-dummy mx-auto ">
                <img class="tm-upload-icon" id="blah1" src="img/cloudimage.png" alt="your image" />
              </div>
              <div class="custom-file mt-3 mb-3">
                <input id="fileInput" type="file" style="display:none;" />
                <input type="file" class="btn btn-primary btn-block mx-auto" value="<%=eimage1 %>>" name="image1"
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
            <div class="col-12">
              <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Product</button>
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

