package web_study_10.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web_study_10.dao.DepartmentDao;
import web_study_10.ds.JndiDS;
import web_study_10.dto.Department;

public class DepartmentDaoImpl implements DepartmentDao {
	
	private static final DepartmentDaoImpl instance = new DepartmentDaoImpl();
	
	public DepartmentDaoImpl() {
		
	}
	
	public static DepartmentDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<Department> selectDeptByAll() {
		String sql = "SELECT DEPT_NO, DEPT_NAME, FLOOR FROM DEPARTMENT ORDER BY DEPT_NO";
		try (Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<Department> list = new ArrayList<Department>();
				do {
					list.add(getDept(rs));
				} while (rs.next());
				return list;
			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}
	private Department getDept(ResultSet rs) throws SQLException {
		int deptNo = rs.getInt("DEPT_NO");
		String deptName = rs.getString("DEPT_NAME");
		int floor = rs.getInt("FLOOR");
		return new Department(deptNo, deptName, floor);
	}

	@Override
	public int insertDept(Department dept) {
		String sql = "INSERT INTO Department VALUES(?, ?, ?)";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, dept.getNo());
			pstmt.setString(2, dept.getName());
			pstmt.setInt(3, dept.getFloor());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}

	}
	@Override
	public int deleteDept(Department dept) {
		String sql = "DELETE FROM DEPARTMENT WHERE DEPT_NO = ?";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, dept.getNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}

	}

	@Override
	public int updateDept(Department dept) {
		String sql = "UPDATE DEPARTMENT SET DEPT_NAME = ?, FLOOR = ? WHERE DEPT_NO = ?";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, dept.getName());
			pstmt.setInt(2, dept.getFloor());
			pstmt.setInt(3, dept.getNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}

	}

	@Override
	public Department selectDeptByNo(Department dept) {
		String sql = "SELECT DEPT_NO, DEPT_NAME, FLOOR FROM DEPARTMENT WHERE DEPT_NO = ?";
		try (Connection con = JndiDS.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, dept.getNo());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getDept(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int getNextDeptNo() {
		String sql = "SELECT MAX(DEPT_NO)+1 FROM DEPARTMENT";
		try (Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

}
