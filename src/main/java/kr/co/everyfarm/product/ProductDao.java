package kr.co.everyfarm.product;

import java.util.List;

public interface ProductDao {
	
	public List<Product> list();
	public Product info(int productno);
	public Product onelist(int p_No);
	public int insert(Product product);
	public int update(Product product);
	public int delete(int productno);

}
