package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DB_Connection;

/**
 * Servlet implementation class deletesubServlet
 */
@WebServlet("/deletesubServlet")
public class deletesubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletesubServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {

			String id = request.getParameter("sub_id");

			DB_Connection obj_DB_Connection = new DB_Connection();
			Connection connection = obj_DB_Connection.get_connection();
			PreparedStatement ps = null;

			String sql = "DELETE FROM `sub_tbl` WHERE sub_id ='"+id+"' ";
			Class.forName("com.mysql.jdbc.Driver");

			ps = connection.prepareStatement(sql);

			ps.executeUpdate();
			
			out.println("<script type=\"text/javascript\">");
			out.println("location='admin/index.jsp'");
			out.println("</script>");

		} catch (ClassNotFoundException ex) {
			out.println(ex);

		} catch (SQLException ex) {
			out.println(ex);
		}
	}

}
