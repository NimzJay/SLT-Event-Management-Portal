package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbCon.DBconnection;
import util.Session;

/**
 * Servlet implementation class EventUpdate
 */
@WebServlet("/EventUpdate")
public class EventUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdate() {
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
		
		String eid = Session.getEid();
		String ename = request.getParameter("ename");
		System.out.println(ename);
		String etype = request.getParameter("etype");
		String edesc = request.getParameter("edesc");
		String venue = request.getParameter("venue");
		String edate = request.getParameter("edate");
		String stime = request.getParameter("stime");
		String etime = request.getParameter("etime");
		String x = request.getParameter("capacity");
		int capacity = Integer.parseInt(x);
		
		try {
			String user=request.getParameter("username");
			System.out.println(eid);
			//where id=(select MAX(uid) from user)
			String sql = "UPDATE sltemp_event SET eName='"+ename+"',eType='"+etype+"',eDesc='"+edesc+"',eVenue='"+venue+"',capacity='"+capacity+"',eDate='"+edate+"',startTime='"+stime+"',endTime='"+etime+"' WHERE eid ='"+eid+"'";
			Connection con = DBconnection.getconn();
			java.sql.PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs;
			st.executeUpdate(sql);
			System.out.println("Succesfully Updated !!");
			request.getRequestDispatcher("EventView.jsp").forward(request,response);
			
			
		}catch(Exception ex) {
			System.out.println("Error" +ex);
			
		}
		
	}

}
