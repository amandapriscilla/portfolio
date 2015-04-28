package infinith.sinal.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoggedServlet
 */
@WebServlet("/LoggedServlet")
public abstract class LoggedServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected String login = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoggedServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public abstract void doLoggedGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	

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
		
		if(sessao != null)
		{
			login = (String)sessao.getAttribute("nome");
		}
		if(login == null)
		{
			response.sendRedirect("index.jsp");
			return;
		}
		
		doLoggedGet(request, response);
	}

}
