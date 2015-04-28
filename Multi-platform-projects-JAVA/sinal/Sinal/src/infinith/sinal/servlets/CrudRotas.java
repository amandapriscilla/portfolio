package infinith.sinal.servlets;

import infinith.sinal.enums.Aviso;
import infinith.sinal.interfaces.IRotaLocal;
import infinith.sinal.modelo.Rota;
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
 * Servlet implementation class CrudRotas 
 */
@WebServlet("/CrudRotas")
public class CrudRotas extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@EJB
	private IRotaLocal ejb;

	List<Rota> rotas = new ArrayList<Rota>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudRotas()
	{
		super();
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
		HttpSession sessao = request.getSession(false);
		StringBuilder sb = new StringBuilder();
		sb.append(sessao.getId()+"\n");
		sb.append(sessao.isNew()+"\n");
		sb.append(new Date(sessao.getCreationTime())+"\n");
		System.out.println(sb.toString());
		String caminho =  request.getParameter("p");
		System.out.println("ROTAS ACAO: " +caminho);
		if(sessao.isNew())
		{
			request.getRequestDispatcher("index.jsp").forward(request, response);
			System.out.println(sessao.getId());
			return;
		}

		//INSERT
		if(caminho != null && caminho.equals("inserir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			String nome = request.getParameter("nome");
			String descricao = request.getParameter("descricao");
			boolean fail = false;
			if(nome == null || descricao == null || nome.equals("") || descricao.equals("")){
				this.getServletContext().setAttribute("aviso", Aviso.ALERTA_CAMPOVAZIO);	
				fail = true;
			}
			Rota r = new Rota(nome.toUpperCase(),descricao.toUpperCase());
			if(ejb.inserirRota(r)){
				this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
				rotas = ejb.listarRotas();
				this.getServletContext().setAttribute("lista", rotas);
				fail = false;
			}	
			else{ 
				fail = true;
				this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);	
			}
			
			if(fail){
				this.getServletContext().setAttribute("r", new Rota(nome, descricao));
				request.getRequestDispatcher("/restrito/cadastroRota.jsp").forward(request, response);
			}	
				request.getRequestDispatcher("/restrito/listaRotas.jsp").forward(request, response);

		}	
		

		//SELECT
		if(caminho != null && caminho.toString().equals("listaRotas"))
		{
			System.out.println("req: " + caminho.toString());
			rotas = ejb.listarRotas();
			this.getServletContext().setAttribute("lista", rotas);
			request.getRequestDispatcher("/restrito/listaRotas.jsp").forward(request, response);
		}

		//DELETE
		if(caminho != null &&  caminho.equals("excluir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			Rota e = ejb.localizarRota(id);
			

			// Se cadastrado com sucesso
			if(ejb.excluirRota(e)) 
				request.setAttribute("aviso", Aviso.SUCESSO_EXCLUIR);
			else request.setAttribute("aviso", Aviso.ERRO_EXCLUIR);
				
			
			rotas = ejb.listarRotas();
			this.getServletContext().setAttribute("lista", rotas);
			request.getRequestDispatcher("/restrito/listaRotas.jsp").forward(request, response);
		}

		//UPADETE
		//PARAMETRO PARA ALTERAR
		if(caminho!= null && caminho.equals("editar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			System.out.println("id da rota: " + id);
			Rota r = ejb.localizarRota(id);
			System.out.println("Rota: " + r.getNome());
			this.getServletContext().setAttribute("rota", r);

			request.getRequestDispatcher("/restrito/editarRota.jsp").forward(request, response);
		}
		else if(caminho!= null && caminho.equals("alterar"))
		{
			System.out.println("req: " + request.getParameter("p"));

			Rota r = new Rota();

			r.setIdRota(Long.parseLong(request.getParameter("id").toString()));
			r.setNome(request.getParameter("nome").toString().toUpperCase());
			r.setDescricao(request.getParameter("descricao").toString().toUpperCase());

			System.out.println("Rota: " + r.getIdRota() + r.getNome());
			// Se cadastrado com sucesso
			if(ejb.editarRota(r)){

				rotas = ejb.listarRotas();

				this.getServletContext().setAttribute("lista", rotas);
				this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
				
				request.getRequestDispatcher("/restrito/listaRotas.jsp").forward(request, response);
			} else{
				// Se deu erro ao alterar
				this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
				request.getRequestDispatcher("/restrito/editarRota.jsp").forward(request, response);

				
			}
		}
	}

}
