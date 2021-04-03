import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/html");
		String email= req.getParameter("email");
		String pwd= req.getParameter("pwd");
		PrintWriter out=res.getWriter();
		System.out.println(pwd);
		
		try {
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("loaded");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/productbazaar","root","root");
			System.out.println("connection");
			PreparedStatement pstmt=con.prepareStatement("select * from admin where email=? and password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);

			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				HttpSession session=req.getSession();
				session.setAttribute("email", email);
				//session.setMaxInactiveInterval(600);
				res.sendRedirect("adminhome.jsp");
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
			PreparedStatement pstmt=con.prepareStatement("select * from user where email=? and pwd=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);

			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				HttpSession session=req.getSession();
				session.setAttribute("email", email);
				//session.setMaxInactiveInterval(600);
				res.sendRedirect("index.jsp");
			}
			else {
				res.sendRedirect("invalidLogin.html");
			}
		}
		catch(Exception e){
			out.println(e);
		}
	}
}