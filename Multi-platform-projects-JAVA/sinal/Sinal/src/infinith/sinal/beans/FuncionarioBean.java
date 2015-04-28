package infinith.sinal.beans;

import infinith.sinal.dao.FuncionarioDAO;
import infinith.sinal.enums.Cargo;
import infinith.sinal.interfaces.IFuncionarioBeanLocal;
import infinith.sinal.modelo.Funcionario;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
 

/**
 * Session Bean implementation class FuncionarioBean
 */
@Stateless
public class FuncionarioBean implements IFuncionarioBeanLocal
{
    @PersistenceContext(unitName="sinal")
	EntityManager em;
	
    // Construtor default.
    public FuncionarioBean(){}

	@Override
	public boolean inserirFuncionario(Funcionario e)
	{
		FuncionarioDAO dao = new FuncionarioDAO(em);

		if(dao.inserirFuncionario(e))
			return true;

		return false;
	}

	@Override
	public List<Funcionario> listarFuncionarios()
	{
		FuncionarioDAO dao = new FuncionarioDAO(em);

		return dao.listarFuncionarios();
	}

	
	@Override
	public boolean editarFuncionario(Funcionario e)
	{FuncionarioDAO dao = new FuncionarioDAO(em);

		if(dao.editarFuncionario(e))
			return true;

		return false;
	}

	@Override
	public boolean excluirFuncionario(Funcionario e)
	{
		FuncionarioDAO dao = new FuncionarioDAO(em);

		if(dao.excluirFuncionario(e))
			return true;

		return false;
	}

	@Override
	public Funcionario localizarFuncionario(long id)
	{
		FuncionarioDAO dao = new FuncionarioDAO(em);
		
		return dao.localizarFuncionario(id);
	}

	@Override
	public boolean logar(String login, String senha) {
		FuncionarioDAO dao = new FuncionarioDAO(em);
		
		if ((dao.realizarLogin(login, senha, Cargo.ADMINISTRADOR)).size() != 0){
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isLoginExistente(String login) {
		FuncionarioDAO dao = new FuncionarioDAO(em);
		
		if ((dao.getFuncByLogin(login)).size() != 0){
			return true;
		} else {
			return false;
		}
	}
    
}
