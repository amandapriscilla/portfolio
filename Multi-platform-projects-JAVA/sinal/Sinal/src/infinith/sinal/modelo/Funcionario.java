package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import javax.persistence.*;

@Entity
@Table(name="funcionario") 
@SuppressWarnings("serial")
public class Funcionario implements PersistObj
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idFuncionario;
	private String nome;
	private String rg;
	private String cpf;
	private String cnh;
	private String cargo;
	private String login;
	private String senha;
	
	public Funcionario(){
		
	}
	
	public Funcionario(String nome, String rg, String cpf,
			String cnh, String cargo, String login, String senha) 
	{
		this.setNome(nome);
		this.rg = rg;
		this.cpf = cpf;
		this.cnh = cnh;
		this.cargo = cargo;
		this.login = login;
		this.senha = senha;
	}
	
	public String getCpf()
	{
		return cpf;
	}

	public long getIdFuncionario()
	{
		return idFuncionario;
	}

	public String getCargo()
	{
		return cargo;
	}

	public String getCnh()
	{
		return cnh;
	}

	public String getNome()
	{
		return nome;
	}

	public String getRg()
	{
		return rg;
	}

	public void setCpf(String cpf)
	{
		this.cpf = cpf;
	}


	public void setCargo(String cargo)
	{
		this.cargo = cargo;
	}

	public void setCnh(String cnh)
	{
		this.cnh = cnh;
	}

	public void setNome(String nome)
	{
		this.nome = nome.toUpperCase();
	}

	public void setRg(String rg)
	{
		this.rg = rg;
	}

	@Override
	public long getId() {
		return idFuncionario;
	}

	public String getLogin() {
		return login;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSenha() {
		return senha;
	}

	
}
