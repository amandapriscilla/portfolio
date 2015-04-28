package infinith.sinal.beans;

import java.util.List;

import infinith.sinal.dao.GenericDAO;
import infinith.sinal.interfaces.ISacBeanLocal;
import infinith.sinal.modelo.Sac;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class SacBean implements ISacBeanLocal
{
	@PersistenceContext(unitName="sinal")
	EntityManager em;
	
	// Construtor default.
    public SacBean(){}
    
    public boolean inserirSac(Sac sac)
    {
    	GenericDAO dao = new GenericDAO(em);
    	
    	return dao.insert(sac);
    }
    
    public boolean editarSac(Sac sac)
    {
    	GenericDAO dao = new GenericDAO(em);
    	
    	return dao.update(sac); 
    }
    
    public boolean excluirSac(Sac sac)
    {
    	GenericDAO dao = new GenericDAO(em);
    	
    	return dao.remove(sac);
    }
    
    public List<Sac> listarSacs()
    {
    	GenericDAO dao = new GenericDAO(em);
    	
    	return (List<Sac>) dao.findAll(Sac.class);
    }
    
    public Sac localizarSac(long id)
    {
    	GenericDAO dao = new GenericDAO(em);
    	
    	return dao.findById(id, Sac.class);
    }

	@Override
	public List<Sac> listarSacsPorAssunto(String assunto)
	{
		GenericDAO dao = new GenericDAO(em);
		
		return (List<Sac>) dao.findAll(Sac.class, "assunto", assunto);
	}
}
