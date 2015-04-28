package infinith.sinal.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import infinith.sinal.interfaces.IConsultarHorarioLocal;
import infinith.sinal.interfaces.IDirecaoLocal;
import infinith.sinal.interfaces.IGeoreferenciaLocal;
import infinith.sinal.interfaces.INoticiaLocal;
import infinith.sinal.interfaces.IPercursoLocal;
import infinith.sinal.interfaces.IRotaLocal;
import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Georeferencia;
import infinith.sinal.modelo.Noticia;
import infinith.sinal.modelo.Percurso;
import infinith.sinal.modelo.Rota;

/**
 * Servlet implementation class FrontController 
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@EJB
	private IRotaLocal rotaLocal;
	@EJB
	private IDirecaoLocal direcaoLocal;
	@EJB
	private IGeoreferenciaLocal georeferenciaLocal;
	@EJB
	private IPercursoLocal percursoLocal;
	@EJB
	private IConsultarHorarioLocal consultarHorarioLocal;	
	@EJB 
	private INoticiaLocal noticiaLocal;
	
	List<Rota> rotas = new ArrayList<Rota>();
	List<Direcao> direcoes = new ArrayList<Direcao>();
	List<Georeferencia> georeferencias = new ArrayList<Georeferencia>();
	List<Percurso> percursos = new ArrayList<Percurso>();
	List<Noticia> noticias = new ArrayList<Noticia>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
		String s = request.getParameter("p");
		
		String pagina = request.getParameter("pagina");
		
		rotas = rotaLocal.listarRotas();
		direcoes = direcaoLocal.listarDirecoes();
		georeferencias = georeferenciaLocal.listarGeoreferencias();

		
		this.getServletContext().setAttribute("idRotaSelected", "0");
		this.getServletContext().setAttribute("idDirecaoSelected", "0");
		this.getServletContext().setAttribute("idGeoreferenciaSelected", "0");
		this.getServletContext().setAttribute("listaRotas", rotas);
		this.getServletContext().setAttribute("listaDirecoes", direcoes);
		this.getServletContext().setAttribute("listaGeoreferencias", georeferencias);		
		
		if (pagina != null){
		// PAGINA DE NOTICIAS
		
		if (pagina.equalsIgnoreCase("noticias")){
			
			String acao = request.getParameter("acao");
			
				
			if (acao.equalsIgnoreCase("listar")){
				//noticias = noticiaLocal.listarNoticias();
				String pSelected = request.getParameter("paginaSelected");
				String intPaginasSelected = request.getParameter("intPaginasSelected");
				if (pSelected == null){
					pSelected = "1";
				}
				if (intPaginasSelected == null){
					intPaginasSelected = "1";
				}
				noticias = noticiaLocal.getNoticiaByPagina(Integer.parseInt(pSelected));
				int totalDePaginas = noticiaLocal.getTotalPaginas();
				this.getServletContext().setAttribute("totalPaginas", Integer.toString(totalDePaginas));
				this.getServletContext().setAttribute("intPaginasSelected", intPaginasSelected);
				this.getServletContext().setAttribute("pSelected", pSelected);
				this.getServletContext().setAttribute("acao", "listar");
				this.getServletContext().setAttribute("noticias", noticias);
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/noticias.jsp").forward(request, response);
			}
			
			if (acao.equalsIgnoreCase("filtrar")){
				String filtro = request.getParameter("filtro");
				String pSelected = request.getParameter("paginaSelected");
				String intPaginasSelected = request.getParameter("intPaginasSelected");
				if (pSelected == null){
					pSelected = "1";
				}
				if (intPaginasSelected == null){
					intPaginasSelected = "1";
				}
				noticias = noticiaLocal.findNoticiaByFiltro(filtro,Integer.parseInt(pSelected));
				int totalDePaginas = noticiaLocal.getTotalPaginasFiltro(filtro);
				this.getServletContext().setAttribute("filtro", filtro);
				this.getServletContext().setAttribute("noticias", noticias);
				this.getServletContext().setAttribute("totalPaginas", Integer.toString(totalDePaginas));
				this.getServletContext().setAttribute("intPaginasSelected", intPaginasSelected);
				this.getServletContext().setAttribute("pSelected", pSelected);
				this.getServletContext().setAttribute("acao", "filtrar");
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/noticias.jsp").forward(request, response);
			}
			
			if (acao.equalsIgnoreCase("exibir")){
				String idNoticia = request.getParameter("idNoticia");
				Noticia noticia = noticiaLocal.getNoticiaById(Long.parseLong(idNoticia));
				this.getServletContext().setAttribute("acao", "exibir");
				this.getServletContext().setAttribute("noticia", noticia);
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/noticias.jsp").forward(request, response);
			} 
			
		} 
		
		// PAGINA DE ROTAS
		if (pagina.equalsIgnoreCase("rotas")){
			String acao = request.getParameter("acao");
			if (acao.equalsIgnoreCase("listar")){
				rotas = rotaLocal.listarRotas();
				this.getServletContext().setAttribute("rotas", rotas);
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/rotas.jsp").forward(request, response);
			}
			if (acao.equalsIgnoreCase("filtrar")){
				String filtro = request.getParameter("filtro");
				rotas = rotaLocal.findRotaByFiltro(filtro);
				this.getServletContext().setAttribute("filtro", filtro);
				this.getServletContext().setAttribute("rotas", rotas);
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/rotas.jsp").forward(request, response);
			}
		}
		// PAGINA DE ITINERARIOS
		if (pagina.equalsIgnoreCase("itinerarios")){
			
			String acao = request.getParameter("acao");
			if (acao.equalsIgnoreCase("listar")){
				rotas = rotaLocal.listarRotas();
				this.getServletContext().setAttribute("rotas", rotas);
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/itinerarios.jsp").forward(request, response);
			}
			if (acao.equalsIgnoreCase("exibir")){
				rotas = rotaLocal.listarRotas();
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/itinerarios/itinerario.pdf").forward(request, response);
			}
		}
		// PAGINA DE MAPAS
		if (pagina.equalsIgnoreCase("mapas")){
			String acao = request.getParameter("acao");
			if (acao.equalsIgnoreCase("listar")){
				rotas = rotaLocal.listarRotas();
				this.getServletContext().setAttribute("rotas", rotas);
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/publico/mapas.jsp").forward(request, response);
			}
			if (acao.equalsIgnoreCase("exibir")){
				rotas = rotaLocal.listarRotas();
				this.getServletContext().setAttribute("pagina", pagina);
				request.getRequestDispatcher("/mapas/mapa.pdf").forward(request, response);
			}
		}
		// PAGINA DE CONTATO
		if (pagina.equalsIgnoreCase("contato")){
			this.getServletContext().setAttribute("pagina", pagina);
			request.getRequestDispatcher("/publico/contato.jsp").forward(request, response);
		}
		
		// PAGINA DE SOBRE
		if (pagina.equalsIgnoreCase("sobre")){
			this.getServletContext().setAttribute("pagina", pagina);
			request.getRequestDispatcher("/publico/sobre.jsp").forward(request, response);
		}
		
		// PAGINA INICIAL
		if (pagina.equalsIgnoreCase("home")){
			
			noticias = noticiaLocal.listarUltimasNoticias();
			if(noticias != null) this.getServletContext().setAttribute("ultimasNoticias", noticias);
			else this.getServletContext().setAttribute("ultimasNoticias", new ArrayList<Noticia>());
			this.getServletContext().setAttribute("pagina", pagina);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		
	} else {
					
			if (s != null && s.equalsIgnoreCase("log")){
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} 
		}
	
		//this.doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// CHAMADA AO METODO POST - CONSULTAR HORARIOS
		
		System.out.println("FrontController");
		
		String idRota = request.getParameter("rota");
		System.out.println("valor de rota: "+idRota);
		
		
		String idDirecao = request.getParameter("direcao");
		System.out.println("valor da direcao: "+idDirecao);
		
		String idGeoreferencia = request.getParameter("georeferencia");
		System.out.println("valor da georeferencia: "+idGeoreferencia);
		
		noticias = noticiaLocal.listarUltimasNoticias();
		this.getServletContext().setAttribute("listaNoticias", noticias);
		
		String pagina = request.getParameter("pagina");
		System.out.println("pagina atual: "+pagina);
		String url =  null;
		if(pagina.equalsIgnoreCase("home")) url = pagina+".jsp";
		else url = "/publico/"+pagina+".jsp";
		
		// INICIO - SE NAO TIVER SELECIONADO NENHUMA INFORMACAO
		if (idGeoreferencia==null&&idDirecao==null&&idRota==null){			
			rotas = rotaLocal.listarRotas();
			direcoes = direcaoLocal.listarDirecoes();
			georeferencias = georeferenciaLocal.listarGeoreferencias();

			System.out.println("Rotas"+rotas);
			System.out.println("Direcoes"+ direcoes);
			System.out.println("Georeferencias"+georeferencias);
			
			this.getServletContext().setAttribute("listaRotas", rotas);
			this.getServletContext().setAttribute("listaDirecoes", direcoes);
			this.getServletContext().setAttribute("listaGeoreferencias", georeferencias);			
			request.removeAttribute("minutes");
			
		} else 
		
			// PASSO 2 - SE TODOS OS DADOS FOREM SELECIONADOS - RETORNAR MINUTOS DE ESPERA
		if (idGeoreferencia != null && !idGeoreferencia.equalsIgnoreCase("0")){
					
			//realizar consulta de horarios
			System.out.println("idRota, idGeoreferencia e idDirecao diferente null");
			
											
			
			Direcao d = direcaoLocal.getDirecaoById(idDirecao);
			percursos = percursoLocal.getPercursoByDirecao(d);			
			int min = consultarHorarioLocal.calcularTempoEspera(Integer.parseInt(idDirecao), Integer.parseInt(idGeoreferencia));
			
			this.getServletContext().setAttribute("direcaoSelected", d);
			this.getServletContext().setAttribute("minutos", min);
			this.getServletContext().setAttribute("idRotaSelected", idRota);
			this.getServletContext().setAttribute("idDirecaoSelected",idDirecao);
			this.getServletContext().setAttribute("idGeoreferenciaSelected", idGeoreferencia);
			this.getServletContext().setAttribute("listaRotas", rotas);
			this.getServletContext().setAttribute("listaDirecoes", direcoes);
			this.getServletContext().setAttribute("listaPercursos", percursos);
			this.getServletContext().setAttribute("minutes", min+"");
					
		
		} else {
			// PASSO 3 - TIVERMOS ROTA E DIRECAO - Retornar Georeferencias
			if (idDirecao != null && !idDirecao.equalsIgnoreCase("0")){
				
				System.out.println("idDirecao not null");
				
				Direcao d = direcaoLocal.getDirecaoById(idDirecao);
				
				System.out.println("id idDirecao: "+idDirecao);
				
				System.out.println("Id direcao: "+d.getIdDirecao());
				
				percursos = percursoLocal.getPercursoByDirecao(d);			
				
				this.getServletContext().setAttribute("direcaoSelected", d);
				this.getServletContext().setAttribute("idRotaSelected", idRota);
				this.getServletContext().setAttribute("idDirecaoSelected",idDirecao);
				this.getServletContext().setAttribute("listaRotas", rotas);
				this.getServletContext().setAttribute("listaDirecoes", direcoes);
				this.getServletContext().setAttribute("listaPercursos", percursos);
				this.getServletContext().removeAttribute("minutos");
			} else {
				
				// PASSO 4 - TIVERMOS APENAS A ROTA - Retornar Direçoes
				if (idRota != null && !idRota.equalsIgnoreCase("0")){
					
					System.out.println("idRota diferente null");
					
					rotas = rotaLocal.listarRotas();
					
					Rota r = rotaLocal.getRotaById(idRota);
					System.out.println("ROTA ESCOLHIDA:"+r.getDescricao());
					direcoes = direcaoLocal.listarDirecoesByRota(r);
					
					
					this.getServletContext().setAttribute("rotaSelected", r);
					this.getServletContext().setAttribute("idRotaSelected", idRota);
					this.getServletContext().setAttribute("idDirecaoSelected", "0");
					this.getServletContext().setAttribute("listaRotas", rotas);
					this.getServletContext().setAttribute("listaDirecoes", direcoes);
					this.getServletContext().removeAttribute("minutos");
				} else {
					// FINALIZAR - SE NAO TIVER SELECIONADO NENHUMA INFORMACAO REVISÃO
					rotas = rotaLocal.listarRotas();
					
		
					System.out.println("Rotas"+rotas);
					
					this.getServletContext().setAttribute("idRotaSelected", "0");
					this.getServletContext().setAttribute("idDirecaoSelected", "0");
					this.getServletContext().setAttribute("listaRotas", rotas);
					this.getServletContext().setAttribute("listaDirecoes", direcoes);
					this.getServletContext().setAttribute("listaGeoreferencias", georeferencias);	
					this.getServletContext().removeAttribute("minutos");
				}
			}
		}
		

		request.getRequestDispatcher(url).forward(request, response);
		
	}
	
}
