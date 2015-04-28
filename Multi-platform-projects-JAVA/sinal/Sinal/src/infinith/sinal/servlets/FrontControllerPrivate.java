package infinith.sinal.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import infinith.sinal.enums.Aviso;
import infinith.sinal.interfaces.INoticiaLocal;
import infinith.sinal.modelo.Noticia;

/**
 * Servlet implementation class FrontControllerPrivate
 */
@WebServlet("/FrontControllerPrivate")
public class FrontControllerPrivate extends HttpServlet { 
	private static final long serialVersionUID = 1L;
    
	@EJB
	private INoticiaLocal noticiaLocal;
	
	
	
	String DATE_FORMAT_NOW = "yyyy-MM-dd HH:mm:ss";

	List<Noticia> noticias = new ArrayList<Noticia>();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontControllerPrivate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String caminho = request.getParameter("p");

 if(caminho.endsWith("not") || caminho.endsWith("Not")){
		
		if(caminho.equalsIgnoreCase("cadNot")){
			this.getServletContext().removeAttribute("noticia");
			request.getRequestDispatcher("/restrito/cadastroNoticias.jsp").forward(request, response);
		}
		
		
		if(caminho.equalsIgnoreCase("lisNot")){
			noticias = noticiaLocal.listarNoticias();
			
			System.out.println(noticias);
			
			this.getServletContext().setAttribute("listaNoticias", noticias);
			request.getRequestDispatcher("/restrito/listaNoticias.jsp").forward(request, response);

		} else if(caminho.equalsIgnoreCase("detalheNot")){
			noticias = noticiaLocal.listarNoticias();
			String id = request.getParameter("id");
			Noticia not = noticiaLocal.getNoticiaById(Long.parseLong(id));
			
			System.out.println(noticias);
			this.getServletContext().setAttribute("detalheNoticia", not);
			this.getServletContext().setAttribute("listaNoticias", noticias);
			request.getRequestDispatcher("/restrito/listaNoticias.jsp").forward(request, response);
			
		}
		
		if(caminho.equalsIgnoreCase("delNot")){
			System.out.println("delNot");
			this.getServletContext().setAttribute("detalheNoticia", null);
			long id = Long.parseLong(request.getParameter("id"));
			
			Noticia n = noticiaLocal.getNoticiaById(id);
			
			boolean b = noticiaLocal.excluirNoticia(n);
			
			String msn = "";
			if (b){
				msn = "Excluido com sucesso";
			} else {
				msn = "falha ao excluir registro";
			}
			System.out.println(msn);
			
			request.getRequestDispatcher("/restrito/listaNoticias.jsp").forward(request, response);
		}
		
		if (caminho.equalsIgnoreCase("ediNot")){

			long id = Long.parseLong(request.getParameter("id"));
			
			Noticia n = noticiaLocal.getNoticiaById(id);
			
			this.getServletContext().setAttribute("noticia", n);
			request.getRequestDispatcher("/restrito/cadastroNoticias.jsp").forward(request, response);
		}
   }
 	
	
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
String caminho = request.getParameter("p");
		
		if (caminho.equalsIgnoreCase("cadNotFinal")){
			
			String titulo = request.getParameter("titulo");
			String descricao = request.getParameter("descricao");
			String pChaves = request.getParameter("palavrasChaves");
			
			 java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
			
			if(titulo== null || descricao == null || pChaves == null || titulo.equals("") || descricao.equals("") || pChaves.equals("")){
				this.getServletContext().setAttribute("aviso", Aviso.ALERTA_CAMPOVAZIO);
				request.getRequestDispatcher("/restrito/cadastroNoticias.jsp").forward(request, response);
			}
			else{
			Noticia n = new Noticia(titulo,descricao,pChaves, sqlDate);
			
			
			if(noticiaLocal.inserirNoticia(n))
				{
				this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
				} else {
					this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
				}
			noticias = noticiaLocal.listarNoticias();
			this.getServletContext().setAttribute("listaNoticias", noticias);
			request.getRequestDispatcher("/restrito/listaNoticias.jsp").forward(request, response);
			}
		}
		
		if (caminho.equalsIgnoreCase("ediNotFinal")){
			
			long idNoticia = Long.parseLong(request.getParameter("idNoticia"));
			String titulo = request.getParameter("titulo");
			String descricao = request.getParameter("descricao");
			String pChaves = request.getParameter("palavrasChaves");
			String date = request.getParameter("dataCadastro");
			
			System.out.println(date);
			Date d = null;
			try {   
				DateFormat formatter = new SimpleDateFormat(DATE_FORMAT_NOW);   
	            d = (Date)formatter.parse(date);  
	        } catch (ParseException e) { 
	        	e.printStackTrace();
	        }   
			
			Noticia n = new Noticia(idNoticia,titulo,descricao,pChaves,d);
			if(!noticiaLocal.editarNoticia(n))
			{
				this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
				this.getServletContext().setAttribute("noticia", n);
				
			} else{			
			
			this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
			this.getServletContext().removeAttribute("noticia");		
			noticias = noticiaLocal.listarNoticias();
			this.getServletContext().setAttribute("listaNoticias", noticias);
			request.getRequestDispatcher("/restrito/listaNoticias.jsp").forward(request, response);
			}
		}
		
	}

}
