package com.ch.shooping2.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.shooping2.dao.DeptDao;
import com.ch.shooping2.model.Dept;
@Service
public class DeptServiceImpl implements DeptService {
	@Autowired
	private DeptDao dd;
	public List<Dept> list() {
		return dd.list();
	}
	public Dept select(int deptno) {
		return dd.select(deptno);
	}
}