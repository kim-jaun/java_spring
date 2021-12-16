package person;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class PersonServiceImpl implements PersonService {
	@Autowired
	private PersonDao pd;
	public int insert(Person person) {
		int result = 0;
		// person은 콘솔에서 입력한 사람, person2은 DB에서 같은 자료가 있는 조회한 사람
		Person person2 = pd.select(person.getId());
		if (person2 == null) result = pd.insert(person);
		else System.out.println("이미 있는 데이터 입니다");
		return result;
	}
	public void select(String id) {
		Person person = pd.select(id);
		if (person == null) System.out.println("없는 데이터 입니다");
		else print(person);
	}
	private void print(Person person) {
		System.out.println("=== 회원 정보 ===");
		System.out.println("아이디 : "+person.getId());
		System.out.println("이름 : "+person.getName());
		System.out.println("이메일 : "+person.getEmail());
		System.out.println("등록일 : "+person.getReg_date());
	}
	public int update(Person person) {
		int result = 0;
		// person은 콘솔에서 입력한 사람, person2은 DB에서 같은 자료가 있는 조회한 사람
		Person person2 = pd.select(person.getId());
		if (person2 != null) result = pd.update(person);
		else System.out.println("없는 데이터는 수정 못합니다");
		return result;
	}
	public void list() {
		List<Person> list = pd.list();
		if (list == null || list.size() == 0)
			System.out.println("데이터가 없습니다");
		else
			for(Person person:list) {
				print(person);
			}
	}
	public int delete(String id) {
		int result = 0;
		// person은 콘솔에서 입력한 사람, person2은 DB에서 같은 자료가 있는 조회한 사람
		Person person2 = pd.select(id);
		if (person2 != null) result = pd.delete(id);
		else System.out.println("없는 데이터는 삭제 못합니다");
		return result;
	}
}