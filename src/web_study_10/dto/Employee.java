package web_study_10.dto;

public class Employee {

	private int no;
	private String name;
	private Title tno;
	private Employee manager;
	private int salary;
	private Department dno;

	public Employee() {

	}

	public Employee(int no) {
		this.no = no;
	}

	public Employee(int no, String name, Title tno, Employee manager, int salary, Department dno) {
		this.no = no;
		this.name = name;
		this.tno = tno;
		this.manager = manager;
		this.salary = salary;
		this.dno = dno;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + no;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		if (no != other.no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Employee [%s, %s, %s, %s, %s, %s]", no, name, tno, manager,
				salary, dno);
	}

}
