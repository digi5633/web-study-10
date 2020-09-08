package web_study_10.model;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_study_10.dto.Department;
import web_study_10.service.DepartmentService;

@WebServlet("/DeptGetHandler")
public class DeptGetHandler extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private DepartmentService service;

	public void init(ServletConfig config) throws ServletException {
		service = new DepartmentService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Process(request, response);
	}

	private void Process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			int deptNo = Integer.parseInt(request.getParameter("no").trim());
			Department dept = service.getDept(new Department(deptNo));
			System.out.println("dept > " + dept);

			request.setAttribute("dept", dept);

			request.getRequestDispatcher("department.jsp").forward(request, response);

		} else {
			System.out.println("POST");
		}

	}
	
}
