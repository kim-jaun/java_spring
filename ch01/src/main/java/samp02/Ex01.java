package samp02;
// interface 결합도 낮아졌어
public class Ex01 {
	public static void main(String[] args) {
	//	MessageBean mb = new MessageBeanKr();
		MessageBean mb = new MessageBeanEn();
		mb.sayHello("로졔");
	}
}