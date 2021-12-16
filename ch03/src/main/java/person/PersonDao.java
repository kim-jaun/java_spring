package person;

import java.util.List;

public interface PersonDao {
	Person select(String id);
	int insert(Person person);
	int update(Person person);
	List<Person> list();
	int delete(String id);

}