package infinith.sinal.servlets;

import infinith.sinal.interfaces.IEmpresaBeanLocal;
import infinith.sinal.modelo.Empresa;

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
 * Servlet implementation class CrudEmpresas 
 */
@WebServlet("/CrudEmpresas")
public class CrudEmpresas extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	// Testando anotação de bean
	@EJB
	private IEmpresaBeanLocal ejb;

	//EmpresaDelegate crudEmpresas = new EmpresaDelegate();
	List<Empresa> empresas = new ArrayList<Empresa>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudEmpresas()
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
			String fantasia = request.getParameter("fantasia");
			String razao = request.getParameter("razao");
			String cnpj = request.getParameter("cnpj");
			String inscMun = request.getParameter("inscMun");
			String inscEst = request.getParameter("inscEst");

			System.out.println("inserido: " + ejb.inserirEmpresa(new Empresa(fantasia, razao, cnpj, inscMun, inscEst)));

			empresas = ejb.listarEmpresas();
			this.getServletContext().setAttribute("lista", empresas);
			request.getRequestDispatcher("/restrito/listaEmpresas.jsp").forward(request, response);
		}
		else if(request.getAttribute("p") != null && request.getAttribute("p").toString().equals("lisemp"))
		{
			System.out.println("req: " + request.getAttribute("p").toString());
			empresas = ejb.listarEmpresas();
			this.getServletContext().setAttribute("lista", empresas);
			request.getRequestDispatcher("/restrito/listaEmpresas.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("excluir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			Empresa e = ejb.localizarEmpresa(id);
			ejb.excluirEmpresa(e);

			empresas = ejb.listarEmpresas();
			this.getServletContext().setAttribute("lista", empresas);
			request.getRequestDispatcher("/restrito/listaEmpresas.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("editar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			System.out.println("id da empresa: " + id);
			Empresa e = ejb.localizarEmpresa(id);
			System.out.println("Empresa: " + e.getNomeFantasia());
			this.getServletContext().setAttribute("empresa", e);
			
			request.getRequestDispatcher("/restrito/editarEmpresa.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("aplicar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			
			Empresa e = new Empresa();
			
			e.setCnpj(request.getParameter("cnpj").toString());
			e.setIdEmpresa(Long.parseLong(request.getParameter("id").toString()));
			e.setInscEstadual(request.getParameter("inscest").toString());
			e.setInscMunicipal(request.getParameter("inscmun").toString());
			e.setNomeFantasia(request.getParameter("fantasia").toString());
			e.setRazaoSocial(request.getParameter("razao").toString());
			
			System.out.println("Empresa: " + e.getIdEmpresa() + e.getNomeFantasia());
			
			ejb.editarEmpresa(e);
			
			empresas = ejb.listarEmpresas();
			
			this.getServletContext().setAttribute("lista", empresas);
			
			request.getRequestDispatcher("/restrito/listaEmpresas.jsp").forward(request, response);
		}
	}
	
}
