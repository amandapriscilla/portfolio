package infinith.sinal.dao;

import infinith.sinal.modelo.Empresa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;


public class EmpresaDAO
{
	EntityManager em;

	public EmpresaDAO(EntityManager em)
	{
		this.em = em; 
	}
	
	public boolean inserirEmpresa(Empresa e)
	{
		try
		{
			em.persist(e);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Empresa>listarEmpresas()
	{
		Query q = em.createQuery("select object(e) FROM Empresa as e");
		return q.getResultList();
	}
	
	/**
	 * Não implementado ainda.
	 * @param e
	 * @return
	 */
	public boolean editarEmpresa(Empresa e)
	{
		try
		{
			em.merge(e);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}
	
	public boolean excluirEmpresa(Empresa e)
	{
		
		try
		{
			Empresa emp = em.find(Empresa.class, e.getIdEmpresa());
			em.remove(emp);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	public Empresa localizarEmpresa(long id)
	{
		return em.find(Empresa.class, id);
	}
}
