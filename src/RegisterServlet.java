import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/html");
		String fname= req.getParameter("fname");
		String lname= req.getParameter("lname");
		String email= req.getParameter("email");
		String pwd= req.getParameter("pwd");
		PrintWriter out=res.getWriter();
		try {
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
			System.out.println("connection");
			PreparedStatement pstmt=con.prepareStatement("insert into user values(?,?,?,?)");
			pstmt.setString(1, fname);
			pstmt.setString(2, lname);
			pstmt.setString(3, email);
			pstmt.setString(4, pwd);


			int n=pstmt.executeUpdate();
			out.println("Record Inserted Succesfully");
			if(n>0) {
//				res.sendRedirect("sendMail.jsp");
				res.sendRedirect("login.html");
			}
		}
		catch(Exception e){
			out.println(e);
		}
	}
}