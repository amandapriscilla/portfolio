package infinith.sinal.beans;

import infinith.sinal.dao.EmpresaDAO;
import infinith.sinal.interfaces.IEmpresaBeanLocal; 
import infinith.sinal.modelo.Empresa;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


/**
 * Session Bean implementation class EmpresaBean
 */
@Stateless
public class EmpresaBean implements IEmpresaBeanLocal
{
    @PersistenceContext(unitName="sinal")
	EntityManager em;
	
    // Construtor default.
    public EmpresaBean(){}

	@Override
	public boolean inserirEmpresa(Empresa e)
	{
		EmpresaDAO dao = new EmpresaDAO(em);

		if(dao.inserirEmpresa(e))
			return true;

		return false;
	}

	@Override
	public List<Empresa> listarEmpresas()
	{
		EmpresaDAO dao = new EmpresaDAO(em);

		return dao.listarEmpresas();
	}

	
	@Override
	public boolean editarEmpresa(Empresa e)
	{EmpresaDAO dao = new EmpresaDAO(em);

		if(dao.editarEmpresa(e))
			return true;

		return false;
	}

	@Override
	public boolean excluirEmpresa(Empresa e)
	{
		EmpresaDAO dao = new EmpresaDAO(em);

		if(dao.excluirEmpresa(e))
			return true;

		return false;
	}

	@Override
	public Empresa localizarEmpresa(long id)
	{
		EmpresaDAO dao = new EmpresaDAO(em);
		
		return dao.localizarEmpresa(id);
	}
    
}
