package infinith.sinal.servlets;

import infinith.sinal.enums.Aviso;
import infinith.sinal.interfaces.IFuncionarioBeanLocal;
import infinith.sinal.modelo.Funcionario;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class CrudFuncionarios 
 */
@WebServlet("/CrudFuncionarios")
public class CrudFuncionarios extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	// Testando anotação de bean
	@EJB
	private IFuncionarioBeanLocal ejb;

	//FuncionarioDelegate crudFuncionarios = new FuncionarioDelegate();
	List<Funcionario> Funcionarios = new ArrayList<Funcionario>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudFuncionarios()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String errMsg = "";
		boolean err = false;
		
		HttpSession sessao = request.getSession(false);
		StringBuilder sb = new StringBuilder();
		sb.append(sessao.getId()+"\n");
		sb.append(sessao.isNew()+"\n");
		sb.append(new Date(sessao.getCreationTime())+"\n");
		System.out.println(sb.toString());
		if(sessao.isNew())
		{
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			System.out.println(sessao.getId());
			return;
		}

		if(request.getParameter("p").equals("inserir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			String nome = request.getParameter("nome");
			String rg = request.getParameter("rg");
			String cpf = request.getParameter("cpf");
			String cnh = request.getParameter("cnh");
			String cargo = request.getParameter("cargo");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String cSenha = request.getParameter("confirmacaoSenha");
			
			Funcionario f = new Funcionario(nome, rg, cpf, cnh, cargo, login, senha);
			//verificacoes de login e senha
			if (!validarLogin(login)){
				errMsg += "Escolher outro login, o especificado já existe. ";
				err = true;
				request.setAttribute("aviso", Aviso.ERRO_LOGINJAEXISTE);
			}
			
			if (!validarSenha(senha, cSenha)){
				errMsg += "Senha digitada e confirmação de senha não confere. ";
				request.setAttribute("aviso", Aviso.ALERTA_CONFIRMARSENHA);
				err = true;
			}
			//verifica se houve erro
			if (err){
				request.setAttribute("selectedfunc", f);
				request.setAttribute("msgErro", errMsg);
				request.getRequestDispatcher("/restrito/cadastroFuncionarios.jsp").forward(request, response);
			
			} else {
			
				if(ejb.inserirFuncionario(new Funcionario(nome, rg, cpf, cnh, cargo, login, senha)))
					request.setAttribute("aviso", Aviso.SUCESSO_SALVAR);
				
				Funcionarios = ejb.listarFuncionarios();
				this.getServletContext().setAttribute("lista", Funcionarios);
				request.getRequestDispatcher("/restrito/listaFuncionarios.jsp").forward(request, response);
			} 
		}
		
		else if(request.getParameter("p").equals("alterar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("id"));
			String nome = request.getParameter("nome");
			String rg = request.getParameter("rg");
			String cpf = request.getParameter("cpf");
			String cnh = request.getParameter("cnh");
			String cargo = request.getParameter("cargo");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String cSenha = request.getParameter("confirmacaoSenha");
			
			Funcionario f = ejb.localizarFuncionario(id);
			
			//verificacoes de login e senha
			if (!f.getLogin().equals(login)){
				if (!validarLogin(login)){
					errMsg += "Escolher outro login, o especificado já existe. ";
					err = true;
				}
			}
			if (!validarSenha(senha, cSenha)){
				errMsg += "Senha digitada e confirmação de senha não confere. ";
				err = true;
			}
			//verifica se houve erro
			if (err){
				request.setAttribute("selectedfunc", f);
				request.setAttribute("msgErro", errMsg);
				request.getRequestDispatcher("/restrito/editarFuncionario.jsp").forward(request, response);
			
			} else {
			
				f.setNome(nome);
				f.setRg(rg);
				f.setCpf(cpf);
				f.setCnh(cnh);
				f.setCargo(cargo);
				f.setSenha(senha);
				
				System.out.println("alterado: " + ejb.editarFuncionario(f));
				
				request.removeAttribute("selectedfunc");
				Funcionarios = ejb.listarFuncionarios();
				this.getServletContext().setAttribute("lista", Funcionarios);
				request.getRequestDispatcher("/restrito/listaFuncionarios.jsp").forward(request, response);
			} 
		}
		
		else if(request.getAttribute("p") != null && request.getAttribute("p").toString().equals("lisfunc"))
		{
			System.out.println("req: " + request.getAttribute("p").toString());
			Funcionarios = ejb.listarFuncionarios();
			this.getServletContext().setAttribute("lista", Funcionarios);
			request.getRequestDispatcher("/restrito/listaFuncionarios.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("excluir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			Funcionario e = ejb.localizarFuncionario(id);
			ejb.excluirFuncionario(e);
			
			Funcionarios = ejb.listarFuncionarios();
			this.getServletContext().setAttribute("lista", Funcionarios);
			request.getRequestDispatcher("/restrito/listaFuncionarios.jsp").forward(request, response);
		}
		
		else if(request.getParameter("p").equals("editar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			
			Funcionario e = ejb.localizarFuncionario(id);
			System.out.println("CRUDFUNC:"+e.getNome()+e.getIdFuncionario()+e.getCargo());
			
			request.setAttribute("selectedfunc", e);
			request.getRequestDispatcher("/restrito/editarFuncionario.jsp").forward(request, response);
		}
		//System.out.println("Lista: " + Funcionarios);


		


	}

	private boolean validarLogin(String login) {
		// TODO Auto-generated method stub
		
		if (ejb.isLoginExistente(login)){
			return false;
		} else {	
			return true;
	
		}
	}

	private boolean validarSenha(String senha, String cSenha) {
		// TODO Auto-generated method stub
		if (senha.equals(cSenha)){
			return true;
		} else {
			return false;
		}
	}

}
