package kr.co.everyfarm.product;

import java.util.List;

public interface ProductDao {
	
	public List<ProductBean> list();
	public List<ProductBean> listpageing(PageBeen pagebeen);
	public List<ProductBean> listserachpageing(PageBeen pagebeen);
	public List<ProductBean> listserachpageingcount(PageBeen pagebeen);
	
	public int listcount();
	public ProductBean info(int productno);
	public ProductBean onelist(int p_No);
	public int insert(ProductBean product);
	public int update(ProductBean product);
	public int delete(int productno);

	
	
	
	
	
	
	
	
	
	public ProductBean productinfo(String p_No);
}
