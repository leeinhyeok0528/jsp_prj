package day1031;

import java.sql.Date;

public class EmpVO {
	private int empno, mrg, sal;
	private String ename, job;
	private Date hireDate;

	public EmpVO() {
	}

	public EmpVO(int empno, int mrg, int sal, String ename, String job, Date hireDate) {
		super();
		this.empno = empno;
		this.mrg = mrg;
		this.sal = sal;
		this.ename = ename;
		this.job = job;
		this.hireDate = hireDate;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getMrg() {
		return mrg;
	}

	public void setMrg(int mrg) {
		this.mrg = mrg;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	@Override
	public String toString() {
		return "EmpVO [empno=" + empno + ", mrg=" + mrg + ", sal=" + sal + ", ename=" + ename + ", job=" + job
				+ ", hireDate=" + hireDate + "]";
	}

}// class
