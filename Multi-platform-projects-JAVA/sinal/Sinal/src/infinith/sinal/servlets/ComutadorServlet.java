package infinith.sinal.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComutadorServlet
 */
@WebServlet("/ComutadorServlet")
public class ComutadorServlet extends LoggedServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet() 
	 */
	public ComutadorServlet()
	{

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
		doLoggedGet(request, response);
	}

	@Override
	public void doLoggedGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String caminho = request.getParameter("p");

		//Página de Login
		if(caminho.equalsIgnoreCase("r"))
			request.getRequestDispatcher("FrontController?p=log").forward(request, response);

		//Menu
		else if(caminho.equalsIgnoreCase("m"))
			request.getRequestDispatcher("/restrito/homeAdmin.jsp").forward(request, response);

		
		//UCD - Manter Empresa
		else if(caminho.equalsIgnoreCase("cademp"))
			request.getRequestDispatcher("/restrito/cadastroEmpresas.jsp").forward(request, response);
		else if(caminho.equalsIgnoreCase("lisemp"))
		{
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudEmpresas").forward(request, response);
		}

		//UCD - Cadastro Funcionario
		else if(caminho.equalsIgnoreCase("cadfunc"))
			request.getRequestDispatcher("/restrito/cadastroFuncionarios.jsp").forward(request, response);
		else if(caminho.equalsIgnoreCase("lisfunc"))
		{
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudFuncionarios").forward(request, response);
		}

		//UCD - Manter Veiculos
		else if(caminho.equalsIgnoreCase("cadveic"))
			request.getRequestDispatcher("/restrito/cadastroVeiculos.jsp").forward(request, response);
		else if(caminho.equalsIgnoreCase("lisveic"))
		{
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudVeiculos").forward(request, response);
		}

		//UCD - Manter Rota
		else if(caminho.equalsIgnoreCase("cadastroRota"))
			request.getRequestDispatcher("/restrito/cadastroRota.jsp").forward(request, response);
		else if(caminho.equalsIgnoreCase("listaRotas"))
		{
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudRotas").forward(request, response);
		}

		//UCD - Manter Direções
		else if(caminho.equalsIgnoreCase("cadastroDirecao")){
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudDirecoes").forward(request, response);
		}
		else if(caminho.equalsIgnoreCase("listaDirecao"))
		{
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudDirecoes").forward(request, response);
		}
		
		//UCD - Manter Percurso das Direções
		else if(caminho.equalsIgnoreCase("cadastroPercurso")){
			request.setAttribute("p", caminho);
			//String id = request.getParameter("iddirecao");
			//request.setAttribute("iddirecao", id);
			request.getRequestDispatcher("CrudDirecoes").forward(request, response);
		} else if(caminho.equalsIgnoreCase("listaPercurso")){
			request.setAttribute("p", caminho);
			String id = request.getParameter("id");
			request.setAttribute("iddirecao", id);
			request.getRequestDispatcher("CrudDirecoes").forward(request, response);
		}
			
			
		//UCD - Manter Georeferencias
		else if(caminho.equalsIgnoreCase("cadgeo"))
			request.getRequestDispatcher("/restrito/cadGeo.jsp").forward(request, response);
		else if(caminho.equalsIgnoreCase("lisgeo"))
		{
			System.out.println("Opção: Paradas.");
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudGeoreferencias").forward(request, response);
		}
		
		// CdU - Manter SAC (não possui redirecionamento p/ inserir, pois as mensagens são
		// inseridas pelo público).
		else if(caminho.equalsIgnoreCase("listarSacs"))
		{
			System.out.println("Opção: " + caminho.toString());
			
			request.setAttribute("p", caminho);
			request.getRequestDispatcher("CrudSac").forward(request, response);
		}
   }



}
