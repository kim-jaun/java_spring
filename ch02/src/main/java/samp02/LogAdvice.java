package samp02;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StopWatch;
// MethodInterceptor sayHello()메서드를 실행하기 전에 가로채서 먼저 실행
public class LogAdvice implements MethodInterceptor {
	public Object invoke(MethodInvocation invocation) throws Throwable {
		String methodName = invocation.getMethod().getName();
		StopWatch sw = new StopWatch();
		sw.start(methodName);
		System.out.println("작업 시작 : "+methodName);
		// 실제 본 작업 실행 : 여기서는 sayHell();
		Object obj = invocation.proceed(); 
		sw.stop();
		System.out.println("작업종료 : "+sw.getTotalTimeSeconds()+"초");
		return obj;
	}
}