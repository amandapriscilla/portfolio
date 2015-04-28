package infinith.sinal.beans;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import infinith.sinal.beans.PercursoBean;
import infinith.sinal.dao.GenericDAO;
import infinith.sinal.dao.PercursoDAO;
import infinith.sinal.interfaces.IPercursoLocal;
import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Percurso;

@Stateless
public class PercursoBean implements IPercursoLocal {

	@PersistenceContext(unitName="sinal")
	EntityManager em;
	
	public PercursoBean(){}
	
	@Override
	public List<Percurso> getPercursoByDirecao(Direcao d) {
		PercursoDAO dao = new PercursoDAO(em);

		return dao.getPercursoByIdDirecao(d);
	}

	@Override
	public boolean inserirPercurso(Percurso p) {
		GenericDAO dao = new GenericDAO(em);
		return dao.insert(p);
	}

	@Override
	public List<Percurso> listarPercursos() {
		GenericDAO dao = new GenericDAO(em);
		return (List<Percurso>) dao.findAll(Percurso.class);
	}

	@Override
	public boolean excluirPercurso(Percurso p) {
		GenericDAO dao = new GenericDAO(em);
		return dao.remove(p);
	}

	@Override
	public Percurso getPercursoById(String idPercurso) {
		GenericDAO dao = new GenericDAO(em);
		return (Percurso) dao.findById(Long.parseLong(idPercurso), Percurso.class);
	}
 
}
