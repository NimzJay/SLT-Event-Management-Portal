package util;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbCon.DBconnection;
import util.Session;

/**
 * Servlet implementation class register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		try {

			String fname = request.getParameter("fname");
			System.out.println(fname);
			String lname = request.getParameter("lname");
			String username = request.getParameter("user");
			String password = request.getParameter("pass");
			String email = request.getParameter("email");
			String nic = request.getParameter("nic");
			String x = request.getParameter("phone");
			int phone = Integer.parseInt(x);

			Session.setUser(username);
    		System.out.println("Session UN: " + Session.getUser());

			Connection con = DBconnection.getconn();
			String sql = "INSERT INTO sltemp_user(fname,lname,username,password,email,nic,mobile,userType) VALUES ('" + fname + "','"
					+ lname + "','" + username + "','" + password + "','" + email + "','" + nic + "','" + phone + "', 'member')";
			System.out.println("sql : " + sql);

			java.sql.PreparedStatement stm = con.prepareStatement(sql);
			stm.executeUpdate(sql);
			System.out.println("Successfully Registered!");
			request.getRequestDispatcher("index.html").forward(request, response);

		} catch (Exception ex) {
			System.out.println("error " + ex);
		}

	}
}
