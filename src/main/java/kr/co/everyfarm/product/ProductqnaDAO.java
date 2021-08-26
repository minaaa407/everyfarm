package kr.co.everyfarm.product;

import java.util.List;

public interface ProductqnaDAO {
	public List<ProductqnaBean> list();
	public ProductqnaBean info(int productqnano);
	public int insert(ProductqnaBean productqna);
	public int update(ProductqnaBean productqna);
	public int delete(int productqnano);
}