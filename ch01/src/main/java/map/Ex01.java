package map;
import java.util.Map;
import java.util.Set;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class Ex01 {
	public static void main(String[] args) {
		AbstractApplicationContext ac =
			new GenericXmlApplicationContext("/map/map.xml");
		MapBean mb = ac.getBean(MapBean.class);
		Map<String, String> addrs = mb.getAddrs();
		Set<String> keys = addrs.keySet();
		for(String key:keys) {
			System.out.println(key+" : "+addrs.get(key));
		}
		ac.close();
	}
}