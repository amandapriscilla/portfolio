package infinith.sinal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Percurso;

public class PercursoDAO {

	EntityManager em;
	
	public PercursoDAO(EntityManager em) 
	{
		this.em = em;
	}
	
	@SuppressWarnings("unchecked")
	public List<Percurso> getPercursoByIdDirecao(Direcao d) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("select object(e) FROM Percurso as e WHERE direcaoFK = :idDirecao");
		q.setParameter("idDirecao", d.getIdDirecao());
		return q.getResultList();
	}
	
}
