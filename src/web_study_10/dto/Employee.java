package web_study_10.dto;

import java.util.Date;

public class Employee {

	private int no;
	private String name;
	private Title tno;
	private Employee manager;
	private int salary;
	private Department dno;
	private String email;
	private String pass;
	private Date regDate;
	private String tel;
	private String picUrl;

	public Employee() {

	}

	public Employee(int no) {
		this.no = no;
	}

	public Employee(int no, String name, Title tno, Employee manager, int salary, Department dno, String email,
			Date regDate, String tel) {
		super();
		this.no = no;
		this.name = name;
		this.tno = tno;
		this.manager = manager;
		this.salary = salary;
		this.dno = dno;
		this.email = email;
		this.regDate = regDate;
		this.tel = tel;
	}

	public Employee(int no, String name, Title tno, Employee manager, int salary, Department dno, String email,
			String pass, Date regDate, String tel) {
		super();
		this.no = no;
		this.name = name;
		this.tno = tno;
		this.manager = manager;
		this.salary = salary;
		this.dno = dno;
		this.email = email;
		this.pass = pass;
		this.regDate = regDate;
		this.tel = tel;
	}

	public Employee(int no, String name, Title tno, Employee manager, int salary, Department dno, String email,
			String pass, Date regDate, String tel, String picurl) {
		super();
		this.no = no;
		this.name = name;
		this.tno = tno;
		this.manager = manager;
		this.salary = salary;
		this.dno = dno;
		this.email = email;
		this.pass = pass;
		this.regDate = regDate;
		this.tel = tel;
		this.picUrl = picurl;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Title getTno() {
		return tno;
	}

	public void setTno(Title tno) {
		this.tno = tno;
	}

	public Employee getManager() {
		return manager;
	}

	public void setManager(Employee manager) {
		this.manager = manager;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public Department getDno() {
		return dno;
	}

	public void setDno(Department dno) {
		this.dno = dno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPicurl() {
		return picUrl;
	}

	public void setPicurl(String picurl) {
		this.picUrl = picurl;
	}

	@Override
	public String toString() {
		return "Employee [no=" + no + ", name=" + name + ", tno=" + tno + ", manager=" + manager + ", salary=" + salary
				+ ", dno=" + dno + ", email=" + email + ", regDate=" + regDate + ", tel=" + tel + "]";
	}

}
