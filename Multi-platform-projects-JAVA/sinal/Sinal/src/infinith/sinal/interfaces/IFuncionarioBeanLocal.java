package infinith.sinal.interfaces;
import infinith.sinal.modelo.Funcionario;

import java.util.List;

import javax.ejb.Local;


@Local
public interface IFuncionarioBeanLocal {
	public boolean inserirFuncionario(Funcionario e);
	public List<Funcionario> listarFuncionarios();
	public boolean editarFuncionario(Funcionario e);
	public boolean excluirFuncionario(Funcionario e);
	public Funcionario localizarFuncionario(long id);
	public boolean isLoginExistente(String login);
	public boolean logar(String login, String senha);
}
