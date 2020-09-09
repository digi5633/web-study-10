package web_study_10.dao;

import java.util.List;

import web_study_10.dto.Employee;

public interface EmployeeDao {

	List<Employee> selectEmpByAll();

	int insertEmp(Employee emp);

	int deleteEmp(Employee emp);

	int updateEmp(Employee emp);

	Employee selectEmpByNo(Employee emp);

}
