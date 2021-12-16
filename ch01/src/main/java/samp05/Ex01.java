package samp05;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
// 의존하는 것을 외부에서 넣어준다 : 의존성 주입
// DI(Dependency Injection) : IoC(제어성 역전)
// AOP(관전비향 프로그래밍) 공통팀에서 주로 사용
public class Ex01 {
	public static void main(String[] args) {
		AbstractApplicationContext ac = 
			new ClassPathXmlApplicationContext("/samp05/beans05.xml");
		MessageBean mb = ac.getBean(MessageBean.class);
		mb.sayHello();
		ac.close();
	}
}