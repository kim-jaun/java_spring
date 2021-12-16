package person;
import java.sql.Date;

import lombok.Data;
@Data
public class Person {
	private String id;
	private String email; ;
	private String password;;
	private String name; ;
	private Date reg_date; 
}