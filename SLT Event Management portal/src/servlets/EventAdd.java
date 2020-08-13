package servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbCon.DBconnection;

/**
 * Servlet implementation class EventAdd
 */
@WebServlet("/EventAdd")
public class EventAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventAdd() {
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
		
		try {

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
			

			Connection con = DBconnection.getconn();
			String sql = "INSERT INTO sltemp_event(eName,eType,eDesc,eVenue,capacity,eDate,startTime,endTime) VALUES ('" + ename + "','"
					+ etype + "','" + edesc + "','" + venue + "','" + capacity + "','" + edate + "','" + stime + "','" + etime + "')";
			
			
			
			java.sql.PreparedStatement st = con.prepareStatement(sql);
			st.executeUpdate(sql);
			System.out.println("Successfully Inserted intevitee!");
			request.getRequestDispatcher("InviteeView.jsp").forward(request, response);
			
		} catch (Exception ex) {
			System.out.println();
		}
	}

}
