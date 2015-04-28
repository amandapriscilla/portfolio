package infinith.sinal.dao;


import infinith.sinal.modelo.Georeferencia;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class GeoreferenciaDAO
{
	EntityManager em;
	
	public GeoreferenciaDAO(EntityManager em)
	{ 
		this.em = em;
	}
	
	public boolean inserirGeoreferencia(Georeferencia g)
	{
		try
		{
			em.persist(g);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Georeferencia>listarGeoreferencias()
	{
		Query q = em.createQuery("select object(e) FROM Georeferencia as e");
		return q.getResultList();
	}
	
	/**
	 * Não implementado ainda.
	 * @param e
	 * @return
	 */
	public boolean editarGeoreferencia(Georeferencia g)
	{
		try
		{
			em.merge(g);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}
	
	public boolean excluirGeoreferencia(Georeferencia g)
	{
		
		try
		{
			Georeferencia geo = em.find(Georeferencia.class, g.getIdGeoreferencia());
			em.remove(geo);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}


	public Georeferencia getGeoreferenciaById(long id) {
		return em.find(Georeferencia.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Georeferencia> getGeoreferenciaByDirecao(long id) {
		Query q = em.createQuery("select object(g) FROM georeferencia AS g  inner join percurso AS p ON g.idGeoreferencia = p.georeferenciaBFK where direcaoFK = "+id);
		return q.getResultList();
	}

	
}
