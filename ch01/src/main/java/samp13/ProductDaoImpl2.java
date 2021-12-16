package samp13;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
// @붙어 있는 것을 annotation
// @Component는 ProductDaoImpl을 component(객체)로 만들어 줘라
// @Component
@Repository("pd2")
public class ProductDaoImpl2 implements ProductDao {
	public Product getProduct(String name) {
		return new Product(name, 5000);
	}
}