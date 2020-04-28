package jdbc;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.DB_Connection;

/**
 * Servlet implementation class deleteUploadServlet
 */
@WebServlet("/deleteUploadServlet")
public class deleteUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUploadServlet() {
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

				String data_id = request.getParameter("data_id");
				String grade = request.getParameter("sub_grade_val");
				String subject = request.getParameter("sub_name_val");

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				PreparedStatement ps = null;
				
				String sql = "Delete from datatable where data_id=?";
				Class.forName("com.mysql.jdbc.Driver");

				ps = connection.prepareStatement(sql);
				ps.setString(1, data_id);

				ps.executeUpdate();
				out.println("<script type=\"text/javascript\">");
                out.println("location='teacher/myclass.jsp?sub_grade_val="+grade+"&sub_name_val="+subject+"';");
                out.println("</script>");
				
		} catch (SQLException ex) {
			out.println(ex);
		} catch (ClassNotFoundException ex) {
			out.println(ex);
		}
	}

}
