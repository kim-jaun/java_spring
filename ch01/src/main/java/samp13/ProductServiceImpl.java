package samp13;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
// @Component
@Service
public class ProductServiceImpl implements ProductService{
	// ProductDao객체와 연결, setter method를 사용하지 않음
	@Autowired
	@Qualifier("pd1") // 사용할 객체 지정
	private ProductDao pd;	

	public Product getProduct() {
		return pd.getProduct("볼펜");
	}
}