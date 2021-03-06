package person;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;

import java.util.Scanner;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class Ex01 {
	private static PersonService ps;
	private static Scanner sc;
	public static void main(String[] args) {
		AbstractApplicationContext ac = new GenericXmlApplicationContext("db.xml");
		ps = ac.getBean(PersonService.class);
		sc = new Scanner(System.in);
		String command = "";
		while(true) {
			help();
			command = sc.nextLine();
			if (command.equals("0")) break;
			else if (command.equals("1")) insert();
			else if (command.equals("2")) update();
			else if (command.equals("3")) delete();
			else if (command.equals("4")) select();
			else if (command.equals("5")) list();
		}
		ac.close(); sc.close();
		System.out.println("프로그램 종료");
	}
	private static void delete() {
		System.out.println("삭제할 아이디를 입력하세요");
		String id = sc.nextLine();
		int result = ps.delete(id);
		if (result > 0) System.out.println("삭제 성공 ^^");
	}
	private static void list() {
		ps.list();
	}
	private static void update() {
		System.out.println("수정할 아이디를 입력하세요");
		String id = sc.nextLine();
		System.out.println("수정할 암호를 입력하세요");
		String password = sc.nextLine();
		System.out.println("암호확인을 입력하세요");
		String passConfirm = sc.nextLine();
		System.out.println("수정할 이름을 입력하세요");
		String name = sc.nextLine();
		System.out.println("수정할 이메일을 입력하세요");
		String email = sc.nextLine();
		if (!password.equals(passConfirm)) {
			System.out.println("암호와 암호 확인이다릅니다");
			return;
		}
		Person person = new Person();
		person.setId(id);
		person.setPassword(password);
		person.setName(name);
		person.setEmail(email);
		int result = ps.update(person);
		if (result > 0) System.out.println("수정 성공 ^^");
	}
	private static void select() {
		System.out.println("조회할 아이디를 입력하세요");
		String id = sc.nextLine();
		ps.select(id);
	}
	private static void insert() {
		System.out.println("아이디를 입력하세요");
		String id = sc.nextLine();
		System.out.println("암호를 입력하세요");
		String password = sc.nextLine();
		System.out.println("암호확인을 입력하세요");
		String passConfirm = sc.nextLine();
		System.out.println("이름을 입력하세요");
		String name = sc.nextLine();
		System.out.println("이메일을 입력하세요");
		String email = sc.nextLine();
		if (!password.equals(passConfirm)) {
			System.out.println("암호와 암호 확인이다릅니다");
			return;
		}
		Person person = new Person();
		person.setId(id);
		person.setPassword(password);
		person.setName(name);
		person.setEmail(email);
		int result = ps.insert(person);
		if (result > 0) System.out.println("입력 성공 ^^");
	}
	private static void help() {
		System.out.println("명령어를 선택하세요");
		System.out.println("0. 종료");
		System.out.println("1. 입력");
		System.out.println("2. 수정");
		System.out.println("3. 삭제");
		System.out.println("4. 조회");
		System.out.println("5. 목록");
	}
}