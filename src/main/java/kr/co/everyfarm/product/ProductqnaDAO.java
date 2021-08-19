package kr.co.everyfarm.product;

import java.util.List;

public interface ProductqnaDAO {
	public List<ProductqnaBean> list();
	public ProductqnaBean info(int productqnano);
	public int insert(ProductqnaBean productqna);
	public int update(ProductqnaBean productqna);
	public int delete(int productqnano);
	
	
	
	//박정빈 추가
	
	public List<ProductqnaBean> listserachpageing(PageBeen pagebeen);
	public int listserachcount();
	
}