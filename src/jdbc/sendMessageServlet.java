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
 * Servlet implementation class sendMessageServlet
 */
@WebServlet("/sendMessageServlet")
public class sendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sendMessageServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String message = request.getParameter("message");
			String type = request.getParameter("type");

			DB_Connection obj_DB_Connection = new DB_Connection();
			Connection connection = obj_DB_Connection.get_connection();
			PreparedStatement ps = null;

			String sql = "insert into messages (msg_name,msg_type,msg_email,msg_message) values(?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");

			ps = connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, type);
			ps.setString(3, email);
			ps.setString(4, message);

			ps.executeUpdate();
			
			out.println("<script type=\"text/javascript\">");
			out.println("location='"+type+"/contact.jsp'");
			out.println("</script>");

		} catch (ClassNotFoundException ex) {
			out.println(ex);

		} catch (SQLException ex) {
			out.println(ex);
		}
	}

}
