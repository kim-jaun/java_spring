package samp07;
public class MessageBeanImpl implements MessageBean {
	private String name;
	private String greeting;	
	// setter method Injection 세터 메서드를 통합 주입
	public void setName(String name) {
		this.name = name;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	public void sayHello() {
		System.out.println(name+", "+greeting+" !!");		
	}
}