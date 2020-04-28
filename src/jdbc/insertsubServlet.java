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
 * Servlet implementation class insertsubServlet
 */
@WebServlet("/insertsubServlet")
public class insertsubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertsubServlet() {
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

			String sub_name = request.getParameter("sub_name");
			String sub_grade = request.getParameter("sub_grade");
			String sub_teacher = request.getParameter("sub_teacher");

			DB_Connection obj_DB_Connection = new DB_Connection();
			Connection connection = obj_DB_Connection.get_connection();
			PreparedStatement ps = null;

			String sql = "insert into sub_tbl (sub_grade,sub_name,sub_teacher) values(?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");

			ps = connection.prepareStatement(sql);
			ps.setString(1, sub_grade);
			ps.setString(2, sub_name);
			ps.setString(3, sub_teacher);


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
