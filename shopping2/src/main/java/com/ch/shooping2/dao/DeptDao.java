package com.ch.shooping2.dao;
import java.util.List;
import com.ch.shooping2.model.Dept;
public interface DeptDao {
	List<Dept> list();
	Dept select(int deptno);

}