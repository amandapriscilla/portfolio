package infinith.sinal.servlets;

import infinith.sinal.enums.Aviso;
import infinith.sinal.interfaces.IConsultarHorarioLocal;
import infinith.sinal.interfaces.IDirecaoLocal;
import infinith.sinal.interfaces.IGeoreferenciaLocal;
import infinith.sinal.interfaces.IPercursoLocal;
import infinith.sinal.interfaces.IRotaLocal;
import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Georeferencia;
import infinith.sinal.modelo.Percurso;
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
 * Servlet implementation class CrudDirecaos 
 */
@WebServlet("/CrudDirecoes")
public class CrudDirecoes extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@EJB
	private IDirecaoLocal ejb;

	@EJB
	private IRotaLocal ejbRota;
	
	@EJB
	private IGeoreferenciaLocal ejbGeo;
	@EJB
	private IPercursoLocal ejbPercurso;
	
	@EJB
	private IConsultarHorarioLocal ejbHorario;
	
	
	List<Direcao> direcoes = new ArrayList<Direcao>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudDirecoes()
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
			request.getRequestDispatcher("index.jsp").forward(request, response);
			System.out.println(sessao.getId());
			return;
		}
		
		// Recebe a string que determina a próxima açao ou página
		String caminho = request.getParameter("p");
		
		//SELECT
		if(caminho != null && caminho.equals("listaDirecao"))
		{
			System.out.println("req: " + caminho.toString());
			direcoes = ejb.listarDirecoes();
			if(direcoes == null || direcoes.size() == 0)
				this.getServletContext().setAttribute("aviso", Aviso.ALERTA_LISTAVAZIA);
			
			this.getServletContext().setAttribute("lista", direcoes);
			request.getRequestDispatcher("/restrito/listaDirecoes.jsp").forward(request, response);
		}
		//INSERT
		if(caminho.equals("inserir"))
		{
			System.out.println("req: " + caminho);
			String descricao = request.getParameter("descricao");
			String idRota = request.getParameter("idRota");
			Rota rota = ejbRota.getRotaById(idRota);
			Direcao direcao = new Direcao(descricao.toUpperCase(), rota);
			direcao = ejb.getDirecao(direcao);
			boolean inserido = false, erro = false;
			if (direcao.getId() == 0) {
				inserido = ejb.inserirDirecao(direcao);
				System.out.println("inserido: " + inserido);
				if (inserido) {
					direcao = ejb.getDirecao(direcao);
					// Envia parametros para a proxima pagina (listarPercurso)
					this.getServletContext().setAttribute("direcao", direcao);
					List<Percurso> percursos = new ArrayList<Percurso>();
					this.getServletContext().setAttribute("listaPercursos", percursos);
					this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
					request.getRequestDispatcher("/restrito/listaPercurso.jsp").forward(request, response);

					// Caso ocorra erro na inserçao
				} else {
					this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
					erro = true;
				}
				
			} 
			
			if(!inserido){
				// Caso ja exista ou de erro no insert,  ele reenvia para a mesma pagina pois continuar para a proxima condiçao
				if(!erro) this.getServletContext().setAttribute("aviso", Aviso.ERRO_DUPLICADO);
				List<Rota> rotas = ejbRota.listarRotas();	
				this.getServletContext().setAttribute("listaRotas", rotas);
				request.getRequestDispatcher("/restrito/cadastroDirecao.jsp").forward(request, response);
			}

				
		}
		
		//CADASTRO
		if(caminho != null && caminho.equals("cadastroDirecao")){
			List<Rota> rotas = ejbRota.listarRotas();	
			this.getServletContext().setAttribute("listaRotas", rotas);
			request.getRequestDispatcher("/restrito/cadastroDirecao.jsp").forward(request, response);
		}



		//DELETE
		else if(caminho.equals("excluir"))
		{
			System.out.println("req: " + caminho);
			long id = Long.parseLong(request.getParameter("r"));
			Direcao d = ejb.getDirecaoById(id+"");
			if(ejb.excluirDirecao(d))
				this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
			else this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);

			direcoes = ejb.listarDirecoes();
			this.getServletContext().setAttribute("lista", direcoes);
			request.getRequestDispatcher("/restrito/listaDirecoes.jsp").forward(request, response);
		}

		//UPDATE
		//PARAMETRO PARA ALTERAR
		else if(caminho.equals("editar"))
		{
			//PAGINA DE EDITAR
			System.out.println("req: " + caminho);
			String id = request.getParameter("r");
			System.out.println("id da direcao: " + id);

			Direcao d = ejb.getDirecaoById(id);
			
			List<Rota> rotas = ejbRota.listarRotas();	
			this.getServletContext().setAttribute("listaRotas", rotas);
			this.getServletContext().setAttribute("direcao", d);
			request.getRequestDispatcher("/restrito/editarDirecao.jsp").forward(request, response);
		}
		else if(caminho.equals("alterar"))
		{
			System.out.println("req: " + caminho);
			
			Rota rota = ejbRota.getRotaById(request.getParameter("idRota"));			
			Direcao d = ejb.getDirecaoById(request.getParameter("id"));
		
			d.setDescricao(request.getParameter("descricao").toUpperCase());
			d.setRota(rota);
			//System.out.println("Direcao: " + d.getIdDirecao() + d.getDescricao() + d.getRota().getDescricao());

			if(ejb.editarDirecao(d)){
				this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
				direcoes = ejb.listarDirecoes();
				this.getServletContext().setAttribute("lista", direcoes);
				request.getRequestDispatcher("/restrito/listaDirecoes.jsp").forward(request, response);
		
			} else{
				this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
				List<Rota> rotas = ejbRota.listarRotas();	
				this.getServletContext().setAttribute("listaRotas", rotas);
				this.getServletContext().setAttribute("direcao", d);
				request.getRequestDispatcher("/restrito/editarDirecao.jsp").forward(request, response);
				
			}	
		}
		// AREA DE PERCURSO
		if(caminho.equals("listaPercurso"))
		{
			System.out.println("req: " + caminho);
			String id = request.getParameter("iddirecao");
			Direcao direcao = ejb.getDirecaoById(id);
			// Envia parametros para a proxima pagina (listarPercurso)
			this.getServletContext().setAttribute("direcao", direcao);
			List<Percurso> percursos = new ArrayList<Percurso>();
			this.getServletContext().setAttribute("listaPercursos", percursos);
			request.getRequestDispatcher("/restrito/listaPercurso.jsp").forward(request, response);

		}else
		if(caminho.equals("cadastroPercurso"))
		{
			String id = request.getParameter("iddirecao");
			Direcao direcao = ejb.getDirecaoById(id);
			// Envia parametros para a proxima pagina (cadastrarPercurso)
			this.getServletContext().setAttribute("direcao", direcao);
			List<Percurso> percursos = ejbPercurso.getPercursoByDirecao(direcao);
			if(percursos == null) percursos = new ArrayList<Percurso>();
			this.getServletContext().setAttribute("listaGeoreferencias", ejbGeo.listarGeoreferencias());
			this.getServletContext().setAttribute("listaPercursos", percursos);
			this.getServletContext().setAttribute("idGeoSelected", 0);
			request.getRequestDispatcher("/restrito/cadastroPercurso.jsp").forward(request, response);
		}else
			if(caminho.equals("getGeo")){
				String id = request.getParameter("georeferenciaA");
				System.out.println("Valor de Parada Inicial: "+id);
				request.setAttribute("idGeoSelected", id);
				this.getServletContext().setAttribute("listaGeoreferencias", ejbGeo.listarGeoreferencias());
				String iddirecao = request.getParameter("iddirecao");
				Direcao direcao = ejb.getDirecaoById(iddirecao);
				List<Percurso> percursos = ejbPercurso.getPercursoByDirecao(direcao);
				this.getServletContext().setAttribute("listaPercursos", percursos);
				request.getRequestDispatcher("/restrito/cadastroPercurso.jsp").forward(request, response);
			}
			else
				if(caminho.equals("salvarPercurso")){
					String idA = request.getParameter("georeferenciaA");
					String idB = request.getParameter("georeferenciaB");
					Georeferencia geoA = ejbGeo.localizarGeoreferencia(Long.parseLong(idA));
					Georeferencia geoB = ejbGeo.localizarGeoreferencia(Long.parseLong(idB));
					
					
					String iddirecao = request.getParameter("iddirecao");
					Direcao direcao = ejb.getDirecaoById(iddirecao);
					
					Percurso p = new Percurso();
					p.setDirecao(direcao);
					p.setGeoreferenciaA(geoA);
					p.setGeoreferenciaB(geoB);
					ejbHorario.getInfoGoogleMaps(geoA.getLatitude(), geoA.getLongitude(), geoB.getLatitude(), geoB.getLongitude());
					p.setTempo(ejbHorario.getMinutos());
					p.setDistancia(ejbHorario.getDistancia());
					
					
					if(ejbPercurso.inserirPercurso(p))
						this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
					else this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
						
						this.getServletContext().setAttribute("listaGeoreferencias", ejbGeo.listarGeoreferencias());
						List<Percurso> percursos = ejbPercurso.getPercursoByDirecao(direcao);
						this.getServletContext().setAttribute("listaPercursos", percursos);
						this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
						request.getRequestDispatcher("/restrito/listaPercurso.jsp").forward(request, response);
						
					
					
					
				}
		
		

	}
	
	/*if(caminho != null && caminho.equals("add")){		
	request.setAttribute("acao", "novo");
	
	List<Rota> rotas = ejbRota.listarRotas();
	this.getServletContext().setAttribute("listaRotas", rotas);
	request.getRequestDispatcher("/restrito/cadastroDirecao.jsp").forward(request, response);
}*/
}
