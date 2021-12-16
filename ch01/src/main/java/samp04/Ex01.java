package samp04;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
public class Ex01 {
	public static void main(String[] args) {
	// 어떤 것을 결정한다는 의미는 다른 말로 제어한다
	// 제어를 실행문이 아니라 설정에서 하는 하는 것을 제어의 역전 IoC(Inversion of COntrol)
	// 결합도를 느슨하게 하기 위해서 loosely coupled
		AbstractApplicationContext ac = 
			new FileSystemXmlApplicationContext("beans01.xml");
		// new FileSystemXmlApplicationContext("beans02.xml");
		// Vehicle vh = ac.getBean("vh", Vehicle.class);
		// Vehicle vh = (Vehicle)ac.getBean("vh");
		// Vehicle vh = (Vehicle)ac.getBean("a");
		Vehicle vh = ac.getBean(Vehicle.class);
		vh.ride("보검");
		ac.close();
	}
}