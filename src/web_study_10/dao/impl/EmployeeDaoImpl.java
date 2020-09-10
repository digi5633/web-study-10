package web_study_10.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import web_study_10.dao.EmployeeDao;
import web_study_10.ds.JndiDS;
import web_study_10.dto.Department;
import web_study_10.dto.Employee;
import web_study_10.dto.Title;

public class EmployeeDaoImpl implements EmployeeDao {

	private static final EmployeeDaoImpl instance = new EmployeeDaoImpl();

	public EmployeeDaoImpl() {

	}

	public static EmployeeDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<Employee> selectEmpByAll() {
		String sql = "SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, REGDATE, \r\n"
				+ "       EMAIL, TEL, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME \r\n" + "  FROM VW_EMPLOYEE_JOIN ORDER BY TNO";
		try (Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<Employee> list = new ArrayList<Employee>();
				do {
					list.add(getEmp(rs));
				} while (rs.next());
				return list;
			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Employee getEmp(ResultSet rs) throws SQLException {
		int empNo = rs.getInt("EMP_NO");
		String empName = rs.getString("EMP_NAME");
		
		Title tno = new Title(rs.getInt("TNO"));
		try {
			tno.setName(rs.getString("TITLE_NAME"));
		} catch (SQLException e) {
		}
		
		Employee manager = new Employee(rs.getInt("MANAGER"));
		try {
			manager.setName(rs.getString("MANAGER_NAME"));
		} catch (SQLException e) {
		}
		
		int salary = rs.getInt("SALARY");
		
		Department dno = new Department(rs.getInt("DNO"));
		try {
			dno.setName(rs.getString("DEPT_NAME"));
		} catch (SQLException e) {
		}

		String email = rs.getString("EMAIL");
		Date regDate = rs.getTimestamp("REGDATE");
		String tel = rs.getString("TEL");
		return new Employee(empNo, empName, tno, manager, salary, dno, email, regDate, tel);
	}

	@Override
	public int insertEmp(Employee emp) {
		String sql = "INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD, REGDATE, TEL)\r\n"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, emp.getNo());
			pstmt.setString(2, emp.getName());
			pstmt.setInt(3, emp.getTno().getNo());
			pstmt.setInt(4, emp.getManager().getNo());
			pstmt.setInt(5, emp.getSalary());
			pstmt.setInt(6, emp.getDno().getNo());
			pstmt.setString(7, emp.getEmail());
			pstmt.setString(8, emp.getPass());
			pstmt.setTimestamp(9, new Timestamp(emp.getRegDate().getTime()));
			pstmt.setString(10, emp.getTel());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}

	}

	@Override
	public int deleteEmp(Employee emp) {
		String sql = "DELETE FROM EMPLOYEE WHERE EMP_NO = ?";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, emp.getNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}

	}

	@Override
	public int updateEmp(Employee emp) {
		String sql = "UPDATE EMPLOYEE SET EMP_NAME = ?, TNO = ?, MANAGER = ?, SALARY = ?, DNO = ?, EMAIL = ?, REGDATE = ?, TEL = ? WHERE EMP_NO = ?";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, emp.getName());
			pstmt.setInt(2, emp.getTno().getNo());
			pstmt.setInt(3, emp.getManager().getNo());
			pstmt.setInt(4, emp.getSalary());
			pstmt.setInt(5, emp.getDno().getNo());
			pstmt.setString(6, emp.getEmail());
			pstmt.setTimestamp(7, new Timestamp(emp.getRegDate().getTime()));
			pstmt.setString(8, emp.getTel());
			pstmt.setInt(9, emp.getNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}

	}

	@Override
	public Employee selectEmpByNo(Employee emp) {
		String sql = "SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, REGDATE, EMAIL, TEL, TITLE_NAME, DEPT_NAME, MANAGER_NAME FROM VW_EMPLOYEE_JOIN WHERE EMP_NO = ?";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, emp.getNo());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getEmp(rs);
				}
				
			}
			
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

}
