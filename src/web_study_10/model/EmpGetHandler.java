package web_study_10.model;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_study_10.dto.Employee;
import web_study_10.service.EmployeeService;

@WebServlet("/EmpGetHandler")
public class EmpGetHandler extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private EmployeeService service;

	public void init(ServletConfig config) throws ServletException {
		service = new EmployeeService();
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

			int empNo = Integer.parseInt(request.getParameter("no").trim());
			Employee emp = service.getEmp(new Employee(empNo));
			System.out.println("emp > " + emp);

			request.setAttribute("emp", emp);

			request.getRequestDispatcher("employee.jsp").forward(request, response);

		} else {
			System.out.println("POST");
		}
		
	}
	
}
