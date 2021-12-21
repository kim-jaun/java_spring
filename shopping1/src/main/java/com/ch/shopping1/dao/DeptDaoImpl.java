package com.ch.shopping1.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.ch.shopping1.model.Dept;
@Repository
public class DeptDaoImpl implements DeptDao {
	@Autowired
	private JdbcTemplate jt;
	public List<Dept> list() {
		List<Dept> list = jt.query(
				"select * from dept order by deptno",
				new BeanPropertyRowMapper<Dept>(Dept.class));
		return list;
	}
}