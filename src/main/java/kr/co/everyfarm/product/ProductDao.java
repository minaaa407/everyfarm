package kr.co.everyfarm.product;

import java.util.List;

public interface ProductDao {
	
	public List<Product> list();
	public List<Product> listpageing(PageBeen pagebeen);
	public List<Product> listserachpageing(PageBeen pagebeen);
	public List<Product> listserachpageingcount(PageBeen pagebeen);
	
	public int listcount();
	public Product info(int productno);
	public Product onelist(int p_No);
	public int insert(Product product);
	public int update(Product product);
	public int delete(int productno);

	
	
	public Product productinfo(String p_No);
}
