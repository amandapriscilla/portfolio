package infinith.sinal.beans;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import infinith.sinal.beans.DirecaoBean;
import infinith.sinal.dao.DirecaoDAO;
import infinith.sinal.interfaces.IDirecaoLocal;
import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Rota;

@Stateless 
public class DirecaoBean implements IDirecaoLocal { 
	@PersistenceContext(unitName="sinal")
	EntityManager em;
	
	public DirecaoBean(){}

	@Override
	public List<Direcao> listarDirecoesByRota(Rota r) {
		DirecaoDAO dao = new DirecaoDAO(em);
		return dao.getDirecoesByRota(r);
	}

	@Override
	public boolean inserirDirecao(Direcao d) {
		DirecaoDAO dao = new DirecaoDAO(em);
		return dao.inserirDirecao(d);
	}

	@Override
	public List<Direcao> listarDirecoes() {
		DirecaoDAO dao = new DirecaoDAO(em);
		return dao.listarDirecoes();		
	}

	@Override
	public boolean editarDirecao(Direcao d) {
		DirecaoDAO dao = new DirecaoDAO(em);
		return dao.editarDirecao(d);
	}

	@Override
	public boolean excluirDirecao(Direcao d) {
		DirecaoDAO dao = new DirecaoDAO(em);
		return dao.excluirDirecao(d);
	}

	@Override
	public Direcao getDirecaoById(String idDirecao) {
		DirecaoDAO dao = new DirecaoDAO(em);
		return dao.getDirecaoById(idDirecao);
	}

	@Override
	public Direcao getDirecao(Direcao d) {
		DirecaoDAO dao = new DirecaoDAO(em);		
		return dao.getDirecao(d);
	}


}
