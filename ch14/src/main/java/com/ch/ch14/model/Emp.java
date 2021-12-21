package com.ch.ch14.model;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;
// mybatis에서는 정상이지만 hibernate나 JPA를 사용할 경우에는 숫자에 null값이 있으면 
// int에러이고 Integer은 정상
@Data
@Entity
@Table(name = "emp")
public class Emp {
	@Id
	@Column(name = "empno")
	private int empno;		private String ename;
	private String job;		private Integer mgr;
	private Date hiredate;	private int sal;
	private Integer comm;	private int deptno;
	// 관리자 명
	private String mgrName;
	// join
	@ManyToOne    // Emp Data여러건에 Dept 데이터 한건으로 mapping
	@JoinColumn(name = "deptno")
	private Dept dept;
}