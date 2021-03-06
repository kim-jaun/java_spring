package samp11;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class Ex01 {
	public static void main(String[] args) {
		AbstractApplicationContext ac = 
			new GenericXmlApplicationContext("/samp11/beans11.xml");
		ProductService ps = ac.getBean(ProductService.class);
		Product product = ps.getProduct();
		System.out.println(product);
		ac.close();
	}
}