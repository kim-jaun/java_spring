package com.ch.shopping1.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.shopping1.dao.DeptDao;
import com.ch.shopping1.model.Dept;
@Service
public class DeptServiceImpl implements DeptService{
	@Autowired
	private DeptDao dd;
	public List<Dept> list() {
		return dd.list();
	}
}