package samp03;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
// Ex01과 MessageBeanKr/MessageBeanEn과 결합돋 떨어 뜨렸다
public class Ex01 {
	public static void main(String[] args) {
		AbstractApplicationContext ac = 
			new FileSystemXmlApplicationContext("beans01.xml");
		MessageBean mb = ac.getBean("mb", MessageBean.class);
		mb.sayHello(" 제니");
		ac.close();
	}
}
// c + s + o 알아서 import시키고 없는 것은 제거