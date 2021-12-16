package person;
public interface PersonService {
	int insert(Person person);
	void select(String id);
	int update(Person person);
	void list();
	int delete(String id);

}