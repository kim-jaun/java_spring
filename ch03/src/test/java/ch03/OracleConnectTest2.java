package ch03;
import java.sql.Connection;
import javax.inject.Inject;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/java/db.xml"})
public class OracleConnectTest2 {
	@Inject  // Autowired같은 역할
	private DataSource ds;
	@Test
	public void testConn() {
		try {
			Connection conn = ds.getConnection();
			System.out.println("연결 성공 ㅋㅋ");
			conn.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}