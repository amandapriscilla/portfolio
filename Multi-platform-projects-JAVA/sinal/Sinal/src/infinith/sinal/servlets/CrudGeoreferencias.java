package infinith.sinal.servlets;

import infinith.sinal.interfaces.IGeoreferenciaLocal;
import infinith.sinal.modelo.Georeferencia;

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
 * Servlet implementation class CrudGeoreferencias
 */
@WebServlet("/CrudGeoreferencias")
public class CrudGeoreferencias extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@EJB
	private IGeoreferenciaLocal georef;

	List<Georeferencia> georeferencias = new ArrayList<Georeferencia>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudGeoreferencias()
	{
		super();
	}

	public boolean checado()
	{


		return false;
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

		// a requisição vem da página menu.jsp do administrador.
		if(request.getParameter("p").equals("inserir"))
		{
			boolean imp = false;
			
			System.out.println("req: " + request.getParameter("p"));
			int cod = Integer.parseInt(request.getParameter("codigo"));
			String des = request.getParameter("descricao");
			double lat = Double.parseDouble(request.getParameter("latitude"));
			double lon = Double.parseDouble(request.getParameter("longitude"));
			// este parametro ou é nulo ou é "on", quando vindo do form html.
			String checado = request.getParameter("importancia");
			
			// verifica se a checkbox de importância foi marcada no form de cadastro de georeferência.
			if(checado != null)
				imp = true;

			System.out.println("inserido: " + georef.inserirGeoreferencia(new Georeferencia(cod, des, lat, lon, imp)));

			georeferencias = georef.listarGeoreferencias();
			this.getServletContext().setAttribute("lista", georeferencias);
			request.getRequestDispatcher("/restrito/listaGeoreferencias.jsp").forward(request, response);
		}
		else if(request.getAttribute("p") != null && request.getAttribute("p").toString().equals("lisgeo"))
		{
			System.out.println("req: " + request.getAttribute("p").toString());
			georeferencias = georef.listarGeoreferencias();
			this.getServletContext().setAttribute("lista", georeferencias);
			request.getRequestDispatcher("/restrito/listaGeoreferencias.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("excluir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			Georeferencia e = georef.localizarGeoreferencia(id);
			georef.excluirGeoreferencia(e);

			georeferencias = georef.listarGeoreferencias();
			this.getServletContext().setAttribute("lista", georeferencias);
			request.getRequestDispatcher("/restrito/listaGeoreferencias.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("editar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			System.out.println("id da parada: " + id);
			Georeferencia g = georef.localizarGeoreferencia(id);
			System.out.println("Georef.: " + g.getDescricao());
			this.getServletContext().setAttribute("parada", g);

			request.getRequestDispatcher("/restrito/editarGeoreferencia.jsp").forward(request, response);
		}
		else if(request.getParameter("p").equals("aplicar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			System.out.println("parametro importante: " + request.getParameter("importante"));

			Georeferencia e = new Georeferencia();

			e.setCodigo(Integer.parseInt(request.getParameter("codigo")));
			e.setDescricao(request.getParameter("descricao"));
			e.setIdGeoreferencia(Long.parseLong(request.getParameter("id").toString()));
			e.setLatitude(Double.parseDouble(request.getParameter("latitude")));
			e.setLongitude(Double.parseDouble(request.getParameter("longitude")));
			String checado = request.getParameter("importante");
			if(checado != null)
				e.setImportancia(true);

			System.out.println("Georeferência: " + e.getIdGeoreferencia() + e.getDescricao());

			georef.editarGeoreferencia(e);

			georeferencias = georef.listarGeoreferencias();

			this.getServletContext().setAttribute("lista", georeferencias);

			request.getRequestDispatcher("/restrito/listaGeoreferencias.jsp").forward(request, response);
		}
	}

}

