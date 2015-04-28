package infinith.sinal.dao;

import infinith.sinal.enums.Cargo;
import infinith.sinal.interfaces.IGenericDAO;
import infinith.sinal.modelo.Funcionario;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;


public class FuncionarioDAO
{
	EntityManager em;

	public FuncionarioDAO(EntityManager em)
	{
		this.em = em;
	}
	
	public boolean inserirFuncionario(Funcionario e) 
	{
		try
		{
			em.persist(e);
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Funcionario>listarFuncionarios()
	{
		Query q = em.createQuery("select object(e) FROM Funcionario as e");
		return q.getResultList();
	}
	
	/**
	 * Não implementado ainda.
	 * @param e
	 * @return
	 */
	public boolean editarFuncionario(Funcionario e)
	{
		
		try
		{
			Funcionario f = em.find(Funcionario.class, e.getIdFuncionario());
			f.setNome(e.getNome());
			f.setRg(e.getRg());
			f.setCpf(e.getCpf());
			f.setCnh(e.getCnh());
			f.setCargo(e.getCargo());
			f.setSenha(e.getSenha());
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}
	
	public boolean excluirFuncionario(Funcionario e)
	{
		
		try
		{
			Funcionario emp = em.find(Funcionario.class, e.getIdFuncionario());
			em.remove(emp);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	public Funcionario localizarFuncionario(long id)
	{
		
		Funcionario f = em.find(Funcionario.class, id);
		return f;
	}
	//metodo usando dao generico 
	public List<Funcionario> realizarLogin(String login, String senha, Cargo administrador) {
		// TODO Auto-generated method stub
		IGenericDAO dao = new GenericDAO(em);
		return (List<Funcionario>) dao.findAll(Funcionario.class, "login", login, "senha", senha, "cargo", administrador.toString());
		
	}
	public List<Funcionario> getFuncByLogin(String login) {
		// TODO Auto-generated method stub
		IGenericDAO dao = new GenericDAO(em);
		return (List<Funcionario>) dao.findAll(Funcionario.class, "login", login);
		
	}
}
