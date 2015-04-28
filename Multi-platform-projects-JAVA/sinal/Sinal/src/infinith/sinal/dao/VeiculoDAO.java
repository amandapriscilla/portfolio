package infinith.sinal.dao;

import infinith.sinal.modelo.Veiculo;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class VeiculoDAO {

	EntityManager em;

	public VeiculoDAO(EntityManager em)
	{
		this.em = em;
	}
	 
	public boolean inserirVeiculo(Veiculo v)
	{
		try
		{
			em.persist(v);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Veiculo>listarVeiculos()
	{
		Query q = em.createQuery("select object(v) FROM Veiculo as v");
		return q.getResultList();
	}
	
	/**
	 * Não implementado ainda.
	 * @param e
	 * @return
	 */
	public boolean editarVeiculo(Veiculo e)
	{
		
		try
		{
			Veiculo v = em.find(Veiculo.class, e.getIdVeiculo());
			v.setNumero(e.getNumero());
			v.setMarca(e.getMarca());
			v.setTipo(e.getTipo());
			v.setModelo(e.getModelo());
			v.setPlaca(e.getPlaca());
			v.setRenavan(e.getRenavan());
			v.setCor(e.getCor());
			v.setAno(e.getAno());
			v.setCombustivel(e.getCombustivel());
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}
	
	public boolean excluirVeiculo(Veiculo e)
	{
		
		try
		{
			Veiculo emp = em.find(Veiculo.class, e.getIdVeiculo());
			em.remove(emp);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	public Veiculo localizarVeiculo(long id)
	{
		
		Veiculo v = em.find(Veiculo.class, id);
		return v;
	}
}
