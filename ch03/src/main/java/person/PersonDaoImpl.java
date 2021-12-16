package person;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PersonDaoImpl implements PersonDao {
	@Autowired
	private JdbcTemplate jt;
	public Person select(String id) {
		Person person = null; // try ~ catch 밖에서도 person객체 사용하기 위해서
		try {
			person = jt.queryForObject(
				"select * from person where id=?", 
				new BeanPropertyRowMapper<Person>(Person.class), id);
		}catch (Exception e) {		}
		return person;
	}
	public int insert(Person person) {
		int result = jt.update("insert into person values(?,?,?,?,sysdate)",
			person.getId(),person.getEmail(),person.getPassword(),person.getName());
		return result;
	}
	public int update(Person person) {
		int result = jt.update(
			"update person set email=?,password=?,name=? where id=?",
			person.getEmail(),person.getPassword(),person.getName(),person.getId());
		return result;
	}
	public List<Person> list() {
		List<Person> list = jt.query("select * from person order by reg_date desc",
				new BeanPropertyRowMapper<Person>(Person.class));
		return list;
	}
	public int delete(String id) {
		int result = jt.update("delete from person where id=?",id);
		return result;
	}
}