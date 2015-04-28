package infinith.sinal.servlets;

import infinith.sinal.enums.Aviso;
import infinith.sinal.interfaces.ISacBeanLocal;
import infinith.sinal.modelo.Sac;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CrudSac
 */
@WebServlet("/CrudSac")
public class CrudSac extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@EJB
	private ISacBeanLocal sacEjb;
	
	private List<Sac> sacs = new ArrayList<Sac>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrudSac() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Recupera a requisição do menu do administrador referente a listagem de SACs.
		String pedido = request.getParameter("p");
		
		if(pedido.equals("listarSacs"))
		{
//			sacs = sacEjb.listarSacs();
//			this.getServletContext().setAttribute("lista", sacs);
			request.getRequestDispatcher("/restrito/listaSacs.jsp").forward(request, response);
		}
		else if(pedido.equals("excluir"))
		{
			long id = Long.parseLong(request.getParameter("r"));
			
			Sac s = sacEjb.localizarSac(id);
			
			sacEjb.excluirSac(s);
			
			sacs = sacEjb.listarSacs();
			this.getServletContext().setAttribute("lista", sacs);
			request.getRequestDispatcher("/restrito/listaSacs.jsp").forward(request, response);
		}
		
		else if(pedido.equals("assunto"))
		{
			System.out.println("Pedido: " + pedido);
			String assEsc = request.getParameter("assuntoEscolhido");
			System.out.println("Assunto escolhido: " + assEsc);
			sacs = sacEjb.listarSacsPorAssunto(assEsc);
			this.getServletContext().setAttribute("lista", sacs);
			request.getRequestDispatcher("/restrito/listaSacs.jsp").forward(request, response);
		}
		
		else if(pedido.equals("abrirMsg"))
		{
			System.out.println("Pedido: " + pedido);
			long idMsg = Long.parseLong(request.getParameter("r"));
			Sac s = sacEjb.localizarSac(idMsg);
			if(s.getLido()==0)
			{
				s.setLido(1);
				sacEjb.editarSac(s);
			}
			System.out.println("Mensagem: " + s.getId() + " | " + s.getEmail());
			this.getServletContext().setAttribute("msg", s);
			request.getRequestDispatcher("/restrito/verMsg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Recupera a requisição que vem da página de contato (contato.jsp).
		String pedido = request.getParameter("p");
		
		// Ação realizada quando uma nova mensagem é submetida.
		if(pedido.equals("inserir"))
		{
			System.out.println("Requisicao: " + pedido);
			
			// Recuperando os parametros da nova mensagem, vindas da página de contato.
			String nome = request.getParameter("nome");
			String assunto = request.getParameter("assunto");
			String email = request.getParameter("email");
			String mensagem = request.getParameter("mensagem");
			
			//Tratamento de erro de usuário
			boolean fail = false;
			if(nome == null || mensagem == null || assunto.equals("0") || nome.equals("") || mensagem.equals("")){
					fail = true;
					this.getServletContext().setAttribute("aviso", Aviso.ALERTA_CAMPOVAZIO);
			}  else if(mensagem.length()>250){
				fail = true;
				this.getServletContext().setAttribute("aviso", Aviso.ALERTA_EXCEDEUTAMANHO);
			} 
			
			if(!fail){
				Sac sac = new Sac(nome, assunto, email, mensagem);
				// Tratamento de erro inesperado!
				if(sacEjb.inserirSac(sac)){ 
					this.getServletContext().setAttribute("aviso", Aviso.SUCESSO_SALVAR);
					
				}
				else {
					this.getServletContext().setAttribute("aviso", Aviso.ERRO_SALVAR);
					request.setAttribute("nome", nome);
					request.setAttribute("mensagem", mensagem);
					request.setAttribute("assunto", assunto);
					request.setAttribute("email", email);
					
				}
			}
			
			
			request.getRequestDispatcher("/publico/contato.jsp").forward(request, response);
			
		}
	}

}
