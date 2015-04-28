package infinith.sinal.beans;

import infinith.sinal.dao.GeoreferenciaDAO;
import infinith.sinal.interfaces.IGeoreferenciaLocal;
import infinith.sinal.modelo.Georeferencia;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext; 

@Stateless
public class GeoreferenciaBean implements IGeoreferenciaLocal
{
	@PersistenceContext(unitName="sinal")
	EntityManager em;
	
	// Construtor default.
    public GeoreferenciaBean(){}

	@Override
	public boolean inserirGeoreferencia(Georeferencia g)
	{
		GeoreferenciaDAO dao = new GeoreferenciaDAO(em);
		
		if(dao.inserirGeoreferencia(g))
			return true;

		return false;
	}

	@Override
	public List<Georeferencia> listarGeoreferencias()
	{
		GeoreferenciaDAO dao = new GeoreferenciaDAO(em);
		
		return dao.listarGeoreferencias();
	}

	@Override
	public boolean editarGeoreferencia(Georeferencia g)
	{
		GeoreferenciaDAO dao = new GeoreferenciaDAO(em);
		
		if(dao.editarGeoreferencia(g))
			return true;
		return false;
	}

	@Override
	public boolean excluirGeoreferencia(Georeferencia g)
	{
		GeoreferenciaDAO dao = new GeoreferenciaDAO(em);
		
		if(dao.excluirGeoreferencia(g))
			return true;
		return false;
	}

	@Override
	public Georeferencia localizarGeoreferencia(long id)
	{
		GeoreferenciaDAO dao = new GeoreferenciaDAO(em);
		
		return dao.getGeoreferenciaById(id);
	}

}
