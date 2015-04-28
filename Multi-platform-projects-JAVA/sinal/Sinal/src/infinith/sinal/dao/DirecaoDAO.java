package infinith.sinal.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Rota;

 
public class DirecaoDAO {

	EntityManager em;

	public DirecaoDAO(EntityManager em)
	{
		this.em = em;
	}

	//inserir  direção
	public boolean inserirDirecao(Direcao d)
	{

		try {
		//	em.getTransaction().begin();
			em.persist(d);
		//	em.getTransaction().commit();
			return true;
		}
		catch(Exception ex)
		{
        //    em.getTransaction().rollback();
			ex.printStackTrace();
			return false;
		}
	}

	//Listar direcao
	@SuppressWarnings("unchecked")
	public List<Direcao> listarDirecoes()	{
		Query q = em.createQuery("select object(e) FROM Direcao as e");
		return q.getResultList();
	}

	//Listar direcao ordenando 
	@SuppressWarnings("unchecked")
	public List<Direcao> listarDirecoesOrderByRotas()	{
		Query qRotas = em.createQuery("select object(e) FROM Rota as e order by nome");
		List<Rota> rotas = qRotas.getResultList();
		Query q = null;
		List<Direcao> lista = new ArrayList<Direcao>();
		for (Rota r : rotas) {
			q = em.createQuery("select object(e) FROM Direcao as e WHERE rotaFK = :idRota order by descricao");
			q.setParameter("idRota", r.getId());
			if(q.getResultList().size()>0)
				lista.addAll(q.getResultList());
		}
		
		return lista;
	}

	
	//Atualizar direção
	public boolean editarDirecao(Direcao d)
	{
		try
		{
			em.merge(d);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	//Excluir direção
	public boolean excluirDirecao(Direcao d)
	{

		try
		{
			Direcao rot = em.find(Direcao.class, d.getIdDirecao());
			em.remove(rot);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	//Localizar Rota
	public Direcao localizarDirecao(long id)
	{
		return em.find(Direcao.class, id);
	}


	// Buscar direcoes a partir de uma rota.
	@SuppressWarnings("unchecked")
	public List<Direcao> getDirecoesByRota(Rota r){

		Query q = em.createQuery("select object(d) FROM Direcao d"+" WHERE rotaFK = :idRota");
		q.setParameter("idRota", r.getId());
		return q.getResultList();

	}
	@SuppressWarnings("unchecked")
	public List<Direcao> getDirecoes() {
/*		Query q = em.createQuery("select object(e) FROM Direcao as e");
		return q.getResultList();
	*/

		Query qRotas = em.createQuery("select object(e) FROM Rota as e order by nome");
		List<Rota> rotas = qRotas.getResultList();
		Query q = null;
		List<Direcao> lista = new ArrayList<Direcao>();
		for (Rota r : rotas) {
			q = em.createQuery("select object(e) FROM Direcao as e WHERE rotaFK = :idRota order by descricao");
			q.setParameter("idRota", r.getId());
			if(q.getResultList().size()>0) lista.addAll(q.getResultList());
		}
		
		return lista;

	}
	
	public Direcao getDirecao(Direcao d) {
		for (Direcao dir  : this.getDirecoesByRota(d.getRota())){
			if(dir.getDescricao().equals(d.getDescricao())){
				d = dir;
				break;
			}
		}
		
		return d;
	
	}
	
	public Direcao getDirecaoById(String idDirecao) {
		Direcao direcao = em.find(Direcao.class, Long.parseLong(idDirecao));
		return direcao;
	}

}
