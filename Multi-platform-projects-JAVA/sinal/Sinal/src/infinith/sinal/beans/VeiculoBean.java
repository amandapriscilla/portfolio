package infinith.sinal.beans;

import infinith.sinal.dao.VeiculoDAO;
import infinith.sinal.interfaces.IVeiculoBeanLocal;
import infinith.sinal.modelo.Veiculo;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

 
/**
 * Session Bean implementation class VeiculoBean
 */
@Stateless
public class VeiculoBean implements IVeiculoBeanLocal
{
    @PersistenceContext(unitName="sinal")
	EntityManager em;
	
    // Construtor default.
    public VeiculoBean(){}

	@Override
	public boolean inserirVeiculo(Veiculo e)
	{
		VeiculoDAO dao = new VeiculoDAO(em);

		if(dao.inserirVeiculo(e)){
			return true;
		}else{
			return false;	
		}
	}

	@Override
	public List<Veiculo> listarVeiculos()
	{
		VeiculoDAO dao = new VeiculoDAO(em);

		return dao.listarVeiculos();
	}

	
	@Override
	public boolean editarVeiculo(Veiculo e)
	{
		VeiculoDAO dao = new VeiculoDAO(em);

		if(dao.editarVeiculo(e))
			return true;

		return false;
	}

	@Override
	public boolean excluirVeiculo(Veiculo e)
	{
		VeiculoDAO dao = new VeiculoDAO(em);

		if(dao.excluirVeiculo(e))
			return true;

		return false;
	}

	@Override
	public Veiculo localizarVeiculo(long id)
	{
		VeiculoDAO dao = new VeiculoDAO(em);
		
		return dao.localizarVeiculo(id);
	}
    
}
