package util;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbCon.DBconnection;
import util.Session;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
	public class loginDao 
	{
		public String check(String user,String pass)
		{
			try {
				
				String sql = "SELECT * FROM sltemp_user";			
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DBconnection.getconn();
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()) 
				{
					String typeDB = rs.getString("userType");
					
					if(user.equals(rs.getString("username"))&& pass.equals(rs.getString("password"))&& typeDB.equals("member")) {
						return "clientUI";
					}
					if(user.equals(rs.getString("username"))&& pass.equals(rs.getString("password"))&& typeDB.equals("admin")) {
						return "adminUI";
					}
				}
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}				
			return "Invalid User Credentials";
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String user = request.getParameter("username");   
        String pass = request.getParameter("Password");
		
		System.out.println(user+pass); 
        
        loginDao dao = new loginDao();      
        
        try {
        
        	String userValidate = dao.check(user,pass);
        	if(userValidate.equals("clientUI")) 
        	{        		
        		System.out.println("Member");
        		Session.setUser(user);
        		System.out.println(Session.getUser());
        		request.getRequestDispatcher("EventsUpcoming.jsp").forward(request, response);   		           
           	}
        	else if(userValidate.equals("adminUI"))
        	{
        		System.out.println("Admin");
        		request.getRequestDispatcher("index.html").forward(request, response);
        	}
        	else 
        	{
           		request.getRequestDispatcher("Signin.jsp").forward(request, response);
        	}  
        }catch (Exception e) {
        	e.printStackTrace();
        }

	}

}
