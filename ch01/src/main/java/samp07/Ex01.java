package samp07;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class Ex01 {
	// classpath는 resources위치를 가르킨다
	public static void main(String[] args) {
		AbstractApplicationContext ac = 
				new GenericXmlApplicationContext("classpath:beans07.xml");	
		MessageBean mb = ac.getBean(MessageBean.class);
		mb.sayHello();
		ac.close();
	}
}