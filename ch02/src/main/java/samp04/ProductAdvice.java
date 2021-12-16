package samp04;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
@Aspect     // 공통 관심사항을 처리하는 클래스
@Component  // 객체 생성
public class ProductAdvice {
	@Pointcut("execution(* getProduct(String))")
	private void helloPoint() {}
	@Before("helloPoint()") // 본 작업 하기전에 실행
	public void before() {
		System.out.println("before");
	}
	@Around("helloPoint()") // 본작업 하기 전후로
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("작업 전 around");
		Object obj = pjp.proceed();
		System.out.println("작업 후 around");
		return obj;
	}
	@After("helloPoint()") // 본작업 완료 후에
	public void after() {
		System.out.println("after");
	}
	 // 작업 실행한 후에 뎔과 갑을 받고 싶을 때
	@AfterReturning(pointcut = "helloPoint()", returning = "product")
	public void afterReturning(Product product) {
		System.out.println(" afterReturning : "+ product);
	}
	// 실행하나느중에 에러가 발생했을 때
	@AfterThrowing(pointcut = "helloPoint()",throwing = "ex")
	public void AfterThrowing(Throwable ex) {
		System.out.println("에러 : "+ex.getMessage());
	}
}