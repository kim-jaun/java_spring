package dao;

import model.Sale;

public interface SaleDao {
	
	public void createSale(String mId);
	public Integer findMaxSaleId();
}
