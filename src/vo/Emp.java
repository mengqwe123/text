package vo;

import java.util.Date;

public class Emp {
private int empno;
private String ename;
private String job;
private Date hiredate;
private double sal;
private double comm;


public Date getHiredate() {
	return hiredate;
}

public void setHiredate(Date hiredate) {
	this.hiredate=hiredate;
}

public int getEmpno() {
	return empno;
}

public void setEmpno(int empno) {
	this.empno = empno;
}

public String getJob() {
	return job;
}

public void setJob(String job) {
	this.job = job;
}

public double getComm() {
	return comm;
}

public void setComm(double comm) {
	this.comm = comm;
}

public double getSal() {
	return sal;
}

public void setSal(double sal) {
	this.sal = sal;
}

public String getEname() {
	return ename;
}

public void setEname(String ename) {
	this.ename = ename;
}
}
