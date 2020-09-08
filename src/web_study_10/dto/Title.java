package web_study_10.dto;

public class Title {
	private int no;
	private String name;

	public Title() {

	}

	public Title(int no, String name) {
		this.no = no;
		this.name = name;
	}

	public Title(int no) {
		super();
		this.no = no;
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
		Title other = (Title) obj;
		if (no != other.no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Title [no=" + no + ", name=" + name + "]";
	}

}
