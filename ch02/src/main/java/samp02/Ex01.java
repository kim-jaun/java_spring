package samp02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
		AbstractApplicationContext ac = 
			new ClassPathXmlApplicationContext("/samp02/beans02.xml");
		MessageBean mb = ac.getBean("proxy",MessageBean.class);
		mb.sayHello();
		ac.close();
	}
}