package infinith.sinal.beans;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import infinith.sinal.dao.RotaDAO;
import infinith.sinal.interfaces.IRotaLocal;
import infinith.sinal.modelo.Rota;

@Stateless 
public class RotaBean implements IRotaLocal {

	@PersistenceContext(unitName="sinal")
	EntityManager em;
	
	 public RotaBean(){}
	
	@Override
	public List<Rota> listarRotas() {
		RotaDAO dao = new RotaDAO(em);
		
		return dao.listarRotas();		
	}

	@Override
	public Rota getRotaById(String idRota) {
		RotaDAO dao = new RotaDAO(em);
		
		return dao.getRotaById(idRota);
	} 

	@Override
	public boolean inserirRota(Rota r) {
		RotaDAO dao = new RotaDAO(em);

		if(dao.inserirRota(r)){
			return true;
		}else{
			return false;	
		}

	}

	@Override
	public boolean editarRota(Rota r) {
		RotaDAO dao = new RotaDAO(em);

		if(dao.editarRota(r))
			return true;

		return false;
	}

	@Override
	public boolean excluirRota(Rota r) {
		// TODO Auto-generated method stub
		RotaDAO dao = new RotaDAO(em);

		if(dao.excluirRota(r))
			return true;

		return false;
	}

	@Override
	public Rota localizarRota(long id) {
		// TODO Auto-generated method stub
		RotaDAO dao = new RotaDAO(em);
		
		return dao.localizarRota(id);
	}

	@Override
	public List<Rota> findRotaByFiltro(String filtro) {
		// TODO Auto-generated method stub
		RotaDAO dao = new RotaDAO(em);
		
		return dao.findRotasByNomeDescricao(filtro);
	}

}
