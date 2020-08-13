package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbCon.DBconnection;
import util.Session;

/**
 * Servlet implementation class AdminUpdate
 */
@WebServlet("/InviteeUpdate")
public class InviteeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InviteeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String nicc = Session.getNicc();
		String fname = request.getParameter("fname");
		System.out.println(fname);
		String lname = request.getParameter("lname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nic = request.getParameter("nic");
		String x = request.getParameter("mobile");
		int mobile = Integer.parseInt(x);
		
		try {
			String user=request.getParameter("username");
			System.out.println(nicc);
			//where id=(select MAX(uid) from user)
			String sql = "UPDATE sltemp_user SET fname='"+fname+"',lname='"+lname+"',username='"+username+"',password='"+password+"',email='"+email+"',nic='"+nic+"',mobile='"+mobile+"' WHERE nic ='"+nicc+"'";
			Connection con = DBconnection.getconn();
			java.sql.PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs;
			st.executeUpdate(sql);
			System.out.println("Succesfully Updated !!");
			request.getRequestDispatcher("InviteeView.jsp").forward(request,response);
			
			
		}catch(Exception ex) {
			System.out.println("Error" +ex);
			
		}
		//WebDriver webdriver;
	}

}
