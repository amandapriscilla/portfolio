package infinith.sinal.servlets;

import infinith.sinal.enums.Aviso;
import infinith.sinal.interfaces.IFuncionarioBeanLocal;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L; 

	@EJB
	private IFuncionarioBeanLocal ejb;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
	if(login == null || senha == null || login.equals("") || senha.equals("")){
		this.getServletContext().setAttribute("aviso", Aviso.ALERTA_CAMPOVAZIO);
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	else{
		int tipo = validarLogin(login, senha);

		HttpSession sessao = request.getSession();

		if(!sessao.isNew())
		{
			sessao.removeAttribute("nome");
		}
		
		if(tipo == 1)
		{
			sessao.setAttribute("nome", login);
			request.getRequestDispatcher("/restrito/homeAdmin.jsp").forward(request, response);
		}
		else if(tipo == 2)
		{
			sessao.setAttribute("nome", login);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else
		{
			this.getServletContext().setAttribute("aviso", Aviso.ERRO_LOGINFAIL);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	}

	protected int validarLogin(String login, String senha)
	{
		if(ejb.logar(login, senha))
		{
			return 1;
		} else {
			return 0;
		}

		
	}
}
