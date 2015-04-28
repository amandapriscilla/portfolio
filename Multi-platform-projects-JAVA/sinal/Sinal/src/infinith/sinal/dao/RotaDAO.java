package infinith.sinal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import infinith.sinal.modelo.Rota;

public class RotaDAO {

	EntityManager em;

	public RotaDAO(EntityManager em) 
	{
		this.em = em;
	}
	
	//inserir rota 
	public boolean inserirRota(Rota r)
	{
		try
		{
			em.persist(r);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	
	//Listar rota
	@SuppressWarnings("unchecked")
	public List<Rota> listarRotas()	{
		Query q = em.createQuery("select object(e) FROM Rota as e");
		return q.getResultList();
	}
	
	//Atualizar Rota
	public boolean editarRota(Rota r)
	{
		try
		{
			em.merge(r);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}
	
	//Excluir Rota
	public boolean excluirRota(Rota r)
	{
		
		try
		{
			Rota rot = em.find(Rota.class, r.getIdRota());
			em.remove(rot);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	//Localizar Rota
	public Rota localizarRota(long id)
	{
		return em.find(Rota.class, id);
	}
	
	//Localizar rota
	public Rota getRotaById(String idRota) {
		// TODO Auto-generated method stub
		Rota rota = em.find(Rota.class, Long.parseLong(idRota));
		return rota;
	}
	
	@SuppressWarnings("unchecked")
	public List<Rota> findRotasByNomeDescricao(String filtro)	{
		Query q = em.createQuery("select object(e) FROM Rota as e WHERE UPPER(e.nome) LIKE :filtro OR UPPER(e.descricao) LIKE :filtro");
		q.setParameter("filtro", "%" + filtro.toUpperCase() + "%");
		return q.getResultList();
	}
	
}
