package com.ch.shooping2.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.shooping2.dao.ItemDao;
import com.ch.shooping2.model.Item;
@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	private ItemDao id;
	public List<Item> list() {
		return id.list();
	}
	public Item select(int itemId) {
		return id.select(itemId);
	}
}