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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.DB_Connection;

/**
 * Servlet implementation class uploadFileServlet
 */
@WebServlet("/uploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
		maxFileSize = 1024 * 1024 * 1000, // 1GB
		maxRequestSize = 1024 * 1024 * 1000) // 1GB
public class uploadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public uploadFileServlet() {
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

			String folderName = "resources";
			String uploadPath = request.getServletContext().getRealPath("") + folderName;
			out.print("uploadPath :");
			out.println(uploadPath);

			File dir = new File(uploadPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			Part filePart = request.getPart("file");
			String fileName = filePart.getSubmittedFileName();
			String filetype = filePart.getContentType();
			String path = folderName + File.separator + fileName;
			out.print("fileName :");
			out.println(fileName);
			out.print("filetype :");
			out.println(filetype);
			out.print("path :");
			out.println(path);

			String grade = request.getParameter("grade");
			String subject = request.getParameter("subject");
			String teacher_name = request.getParameter("teacher_name");
			String teacher_email = request.getParameter("teacher_email");
			String title = request.getParameter("title");
			String description = request.getParameter("description");

			try {
				InputStream is = filePart.getInputStream();
				Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
				out.println("copied");
  			}
			catch(Exception ex){
				out.println(ex);
			}
			

			try {

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				PreparedStatement ps = null;
				
				String sql = "insert into datatable (grade,subject,teacher_name,teacher_email,data_title,data_description,data_name,data_path,data_type) values(?,?,?,?,?,?,?,?,?)";
				Class.forName("com.mysql.jdbc.Driver");

				ps = connection.prepareStatement(sql);
				ps.setString(1, grade);
				ps.setString(2, subject);
				ps.setString(3, teacher_name);
				ps.setString(4, teacher_email);
				ps.setString(5, title);
				ps.setString(6, description);
				ps.setString(7, fileName);
				ps.setString(8, path);
				ps.setString(9, filetype);
				
				ps.executeUpdate();
				out.println("<script type=\"text/javascript\">");
                out.println("location='teacher/myclass.jsp?sub_grade_val="+grade+"&sub_name_val="+subject+"';");
                out.println("</script>");
				
			} catch (ClassNotFoundException ex) {
				out.println(ex);
			}

		} catch (SQLException ex) {
			out.println(ex);
		}
	}

}
