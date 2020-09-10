package web_study_10.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IndexHandler")
public class IndexHandler extends HttpServlet {

	private static final long serialVersionUID = 1L;

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

			request.getRequestDispatcher("index.jsp").forward(request, response);

		} else {

		}

	}

}
