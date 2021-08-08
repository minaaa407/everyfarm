package kr.co.everyfarm.product;

import java.util.List;

public interface ProductqnaDAO {
	public List<Productqna> list();
	public Productqna info(int productqnano);
	public int insert(Productqna productqna);
	public int update(Productqna productqna);
	public int delete(int productqnano);
}