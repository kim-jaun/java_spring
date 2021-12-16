package ch03;
import java.sql.*;
import org.junit.Test;
public class OracleConnectTest1 {
	private static final String driver = "oracle.jdbc.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	@Test
	public void testConn() {
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url,"scott","tiger");
			System.out.println("연결 성공 ㅋㅋ");
			conn.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}