package web_study_10.service;

import java.util.List;

import web_study_10.dao.DepartmentDao;
import web_study_10.dao.impl.DepartmentDaoImpl;
import web_study_10.dto.Department;

public class DepartmentService {

	private DepartmentDao deptDao = DepartmentDaoImpl.getInstance();

	public List<Department> showDepartment() {
		return deptDao.selectDeptByAll();
	}

	public int getNextNo() {
		return deptDao.getNextDeptNo();
	}

	public int addDept(Department dept) {
		return deptDao.insertDept(dept);
	}

	public Department getDept(Department dept) {
		return deptDao.selectDeptByNo(dept);
	}

	public int removeDept(Department dept) {
		return deptDao.deleteDept(dept);
	}

	public int modifyDept(Department dept) {
		return deptDao.updateDept(dept);
	}

}
