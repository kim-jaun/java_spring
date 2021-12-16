package ch03;
import java.util.Date;
import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;
//  @Getter  // 자동 getter method 생성
//  @Setter  //  " setter    "
@Data        // "   모든       "
public class Pet {
	private int petId;
	private String petName;
	private String ownerName;
	private int price;
	private Date birthDate; 
}