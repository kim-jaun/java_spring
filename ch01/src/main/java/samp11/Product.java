package samp11;
public class Product {
	private String name;
	private int price;
	
	public Product(String name,  int price) {
		this.name = name; this.price=price;
	}
	
//	toString재정의 하지 않으면 패키지명.클래스명@해시코드
	public String toString() {
		return "제품[이름:"+name+", 가격:"+price+"]";
	}
}