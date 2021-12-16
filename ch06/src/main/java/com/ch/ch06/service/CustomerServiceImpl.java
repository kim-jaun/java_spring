package com.ch.ch06.service;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Service;
import com.ch.ch06.model.Customer;
@Service
public class CustomerServiceImpl implements CustomerService{
	private Map<Integer, Customer> map = new HashMap<Integer, Customer>();
	private int nextId;
	private void register(Customer customer) {
		customer.setId(++nextId); // 1씩 증가하여 Id값 셋팅
		map.put(customer.getId(), customer);
	}
	@PostConstruct  // 객체를 생성하면 무조건 맨 처음 실행
	public void init() {
		// customer객체 4개를 생성하여 map형식으로 메모리에 저장
		register(new Customer("제니","마포","k1@k1.com"));
		register(new Customer("보검","대전","k2@k2.com"));
		register(new Customer("은우","울산","k3@k3.com"));
		register(new Customer("로사","광주","k4@k4.com"));
	}
	public Collection<Customer> list() {
		return map.values();
	}
	public Customer select(int id) {
		return map.get(id);
	}
	public void delete(int id) {
		map.remove(id);
	}
	public void update(Customer customer) {
		// map에서는 수정이 덮어쓴다
		map.put(customer.getId(), customer);		
	}
}