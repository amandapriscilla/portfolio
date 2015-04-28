package infinith.sinal.interfaces;


import java.util.Collection;


public interface IGenericDAO {
	public boolean insert(PersistObj obj);
	public boolean remove(PersistObj obj);
	public boolean update(PersistObj obj);
	public <T extends PersistObj> T findById(long id, Class<T> classe);
	public <T> Collection<T> findAll(Class<T> classe);
	public <T> Collection<T> findAll(Class<T> classe, String orderBy[], String order);
	public <T> Collection<T> findAll(Class<T> classe, String collumn, String KeyWord);
	public <T> Collection<T> findAll(Class<T> classe, String collumn1, String keyWord1, 
			String collumn2, String keyWord2);
	public <T> Collection<T> findAll(Class<T> classe,  String collumn1, String keyWord1, 
			String collumn2, String keyWord2,  String collumn3, String keyWord3);	
	public <T> Collection<T> findAll(Class<T> classe, String collumnInt, long key);
	
}
