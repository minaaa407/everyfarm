package kr.co.everyfarm.product;

import java.util.List;

public interface ProductDao {
	
	public List<ProductBean> list();
	public List<ProductBean> listpageing(PageBeen pagebeen);
	public List<ProductBean> listserachpageing(PageBeen pagebeen);
	public List<ProductBean> listserachpageingcount(PageBeen pagebeen);
	
	public int listcount();
	public ProductBean info(int ProductBeanno);
	public ProductBean onelist(int p_No);
	public int insert(ProductBean ProductBean);
	public int update(ProductBean ProductBean);
	public int delete(int ProductBeanno);

	
	
	public ProductBean productinfo(String p_No);
}
