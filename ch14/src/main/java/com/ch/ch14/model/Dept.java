package com.ch.ch14.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name = "dept")
public class Dept {
	@Id
	@Column(name = "deptno")  // 실제 table에 있는 key와 이름이 같으면 생략 가능	
	private int deptno;
	private String dname;
	private String loc;
}