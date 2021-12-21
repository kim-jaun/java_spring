package com.ch.shooping2.service;
import java.util.List;
import com.ch.shooping2.model.Item;
public interface ItemService {
	List<Item> list();
	Item select(int itemId);

}