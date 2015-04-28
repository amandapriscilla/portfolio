package infinith.sinal.dao;

import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import infinith.sinal.interfaces.IGenericDAO;
import infinith.sinal.interfaces.PersistObj;

/**
 * Classe de Persistência de dados genéricos
 * */
public class GenericDAO implements IGenericDAO {
	
	EntityManager em;

	public GenericDAO(EntityManager em)
	{
		this.em = em;
	}

	/**
	 * Método genérico para inclusão de qualquer nova instância de objeto persistente no banco
	 * */
	@Override
	public boolean insert(PersistObj obj) {
		try
		{
			em.persist(obj);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}

	/**
	 * Método genérico para exclusão de qualquer objeto persistente no banco
	 * */
	@Override
	public boolean remove(PersistObj obj) {
		try
		{
			PersistObj persistedObj = em.find(obj.getClass(), obj.getId());
			em.remove(persistedObj);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	/**
	 * Método genérico para alteração de qualquer objeto persistente no banco
	 * */
	@Override
	public boolean update(PersistObj obj) {
		try
		{
			em.merge(obj);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}

	/**
	 * Método genérico para busca de qualquer objeto do banco através do identificador
	 * 
	 * */
	@Override
	public <T extends PersistObj> T findById(long id, Class<T> classe) {
		return em.find(classe, id);
	}


	/**
	 * Método genérico para busca todos os objetos de uma tabela do banco, retornando uma coleção desses objetos
	 * 
	 * */
	@SuppressWarnings("unchecked")
	@Override
	public <T> Collection<T> findAll(Class<T> classe) {
		System.out.println("findAll(Class<T> classe = "+classe.getCanonicalName());
		Query q = em.createQuery("select object(e) FROM "+ classe.getCanonicalName()+" as e");
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> Collection<T> findAll(Class<T> classe, String[] orderBy,	String order) {
		String orderByString = "";
		for (int i = 0; i < orderBy.length; i++) {
			if(i == orderBy.length-1) orderByString += orderBy[i];
			else
				orderByString += orderBy[i]+", ";
		}
		
		Query q = em.createQuery("FROM "+ classe.getCanonicalName()+" order by e."+orderByString+" "+order);
		return q.getResultList();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> Collection<T> findAll(Class<T> classe, String collumn, String keyWord) {
		Query q = em.createQuery("FROM "+ classe.getCanonicalName()+" AS e"+" WHERE e."+ collumn+" = :keyword");
		q.setParameter("keyword", keyWord);
		return q.getResultList();
	}
	@SuppressWarnings("unchecked")
	@Override
	public <T> Collection<T> findAll(Class<T> classe, String collumn1, String keyWord1, String collumn2, String keyWord2) {
		Query q = em.createQuery("FROM "+ classe.getCanonicalName()+" AS e"+" WHERE e."+ collumn1+" = :keyword1 AND e."+ collumn2+" = :keyword2");
		q.setParameter("keyword1", keyWord1);
		q.setParameter("keyword2", keyWord2);
		return q.getResultList();
	}
	@SuppressWarnings("unchecked")
	@Override
	public <T> Collection<T> findAll(Class<T> classe, String collumn1,
			String keyWord1, String collumn2, String keyWord2, String collumn3,
			String keyWord3) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("FROM "+ classe.getCanonicalName()+" AS e"+" WHERE e."+ collumn1+" = :keyword1 AND e."+ collumn2+" = :keyword2 AND e."+ collumn3+" = :keyword3");
		q.setParameter("keyword1", keyWord1);
		q.setParameter("keyword2", keyWord2);
		q.setParameter("keyword3", keyWord3);
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> Collection<T> findAll(Class<T> classe, String collumnInt, long key) {
		Query q = em.createQuery("FROM "+ classe.getCanonicalName()+" AS e"+" WHERE e."+ collumnInt+" = "+key);
		//q.setParameter("keyword", key);
		return q.getResultList();
	}
	
}
