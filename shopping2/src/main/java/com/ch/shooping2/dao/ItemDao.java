package com.ch.shooping2.dao;
import java.util.List;
import com.ch.shooping2.model.Item;
public interface ItemDao {
	List<Item> list();
	Item select(int itemId);

}