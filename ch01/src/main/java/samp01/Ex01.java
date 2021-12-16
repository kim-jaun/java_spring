package samp01;
// Ex01 ----->  MessageBeanKr
//    사용(use)  MessageBeanEn
// 사용이란 => 의존한다(dependency)
// 결합도가 높다(좋은 시스템은 결합도 낮아야 한다)
public class Ex01 {
	public static void main(String[] args) {
		// MessageBeanKr mbk = new MessageBeanKr();
		MessageBeanEn mbe = new MessageBeanEn();
		mbe.sayHello("길동");
		// mbk.sayHello("길동");
	}
}