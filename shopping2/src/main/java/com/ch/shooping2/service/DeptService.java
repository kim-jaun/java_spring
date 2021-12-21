package com.ch.shooping2.service;
import java.util.List;
import com.ch.shooping2.model.Dept;
public interface DeptService {
	List<Dept> list();
	Dept select(int deptno);

}