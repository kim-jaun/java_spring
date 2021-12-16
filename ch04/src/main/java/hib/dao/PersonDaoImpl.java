package hib.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import hib.model.Person;
@Repository
public class PersonDaoImpl implements PersonDao {
	@Autowired
	private HibernateTemplate ht;
	public Person select(String id) {
		return ht.get(Person.class, id);
	}
	public void save(Person person) {
		ht.save(person);
	}
	public void update(Person person) {
		ht.update(person);		
	}
	@SuppressWarnings("unchecked")
	public List<Person> list() {
		// 주의사항 Person은 테이블이 아니라 클래스명
		return (List<Person>) ht.find("from Person");
	}
	public void delete(Person person) {
//		Person person = new Person();
//		person.setId(id);
		// 삭제할 경우에는 객체를 생성하고 key만 setting해서 객체를 삭제
		ht.delete(person);
	}
}