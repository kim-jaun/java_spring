package model;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;
	private List<ProductSet> productList = new ArrayList<ProductSet>();
	public List<ProductSet> getProductList() {
		return productList;
	}
	public boolean isEmpty() {
		if (this.productList == null || this.productList.isEmpty()) {
			return true;
		}
		return false;
	}	
	public void push(ProductSet pushedProductSet) {	
		// �߰� ��ǰ�� īƮ�� �̹� �����ϴ��� Ȯ���ϴ� �÷���
		boolean productExistInCart = false;
		// �߰��� ��ǰ�� ��ǰID�� ���
		Product pushedProduct = pushedProductSet.getProduct();
		int pushedProductId = pushedProduct.getpId().intValue();
		// īƮ�� ��ǰ ����ŭ �ݺ� ����
		for (ProductSet cartProductSet : this.productList) {	
			// īƮ�� �ִ� ��ǰ�� ID�� ���
			Product cartProduct = cartProductSet.getProduct();
			int cartProductId = cartProduct.getpId().intValue();
			if (cartProductId == pushedProductId) {
				// ����ID�� ��ǰ�� īƮ�� �����ϴ� ���, ������ ����
				cartProductSet.addQuantity(pushedProductSet.getQuantity());
				// �߰� ��ǰ�� īƮ �ȿ� �̹� ������
				productExistInCart = true;
				break;
			}
		}
		if (!productExistInCart) {
			// īƮ�� ���� ��ǰ�� �����Ƿ� �߰�
			this.productList.add(pushedProductSet);
		}
	}
	public void clearAll() {
		this.productList = new ArrayList<ProductSet>();
	}
}