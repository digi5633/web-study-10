package web_study_10.service;

import java.util.List;

import web_study_10.dao.EmployeeDao;
import web_study_10.dao.impl.EmployeeDaoImpl;
import web_study_10.dto.Employee;

public class EmployeeService {

	private EmployeeDao empDao = EmployeeDaoImpl.getInstance();

	public List<Employee> showEmployee() {
		return empDao.selectEmpByAll();
	}

	public int addEmp(Employee emp) {
		return empDao.insertEmp(emp);
	}

	public int removeEmp(Employee emp) {
		return empDao.deleteEmp(emp);
	}

	public int modifyEmp(Employee emp) {
		return empDao.updateEmp(emp);
	}

	public Employee getEmp(Employee emp) {
		return empDao.selectEmpByNo(emp);
	}

}
