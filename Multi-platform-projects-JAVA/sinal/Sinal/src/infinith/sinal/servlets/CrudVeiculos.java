package infinith.sinal.servlets;

import infinith.sinal.interfaces.IVeiculoBeanLocal;
import infinith.sinal.modelo.Veiculo;

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
 * Servlet implementation class CrudVeiculos 
 */
@WebServlet("/CrudVeiculos")
public class CrudVeiculos extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	// Testando anotação de bean
	@EJB
	private IVeiculoBeanLocal ejb;

	//FuncionarioDelegate crudFuncionarios = new FuncionarioDelegate();
	List<Veiculo> Veiculos = new ArrayList<Veiculo>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudVeiculos()
	{
		super();
		// TODO Auto-generated constructor stub
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

		//PARAMETRO PARA INSERIR
		if(request.getParameter("p").equals("inserir")){
			System.out.println("req: " + request.getParameter("p"));			
			
			String numero = request.getParameter("numero");
			String marca = request.getParameter("marca");
			String tipo = request.getParameter("tipo");
			String modelo = request.getParameter("modelo");
			String placa = request.getParameter("placa");
			String renavan = request.getParameter("renavan");
			String cor = request.getParameter("cor");
			String ano = request.getParameter("ano");
			String combustivel = request.getParameter("combustivel");

			System.out.println("<---- OBJETO VEICULO ---->"+" NUMERO "+numero+" | MARCA "+marca
					+" | TIPO "+tipo
					+" | MODELO "+modelo
					+" | PLACA "+placa
					+" | RENAVAN "+renavan
					+" | COR "+cor
					+" | ANO "+ano
					+" | COMBUSTIVEL "+combustivel);
			
		
			
			System.out.println("inserido: " + ejb.inserirVeiculo(new Veiculo(numero,marca,tipo,modelo,placa,renavan,cor,ano,combustivel)));

					
			Veiculos = ejb.listarVeiculos();
			this.getServletContext().setAttribute("lista", Veiculos);
			request.getRequestDispatcher("/restrito/listaVeiculos.jsp").forward(request, response);
		}
		
		//PARAMETRO PARA ALTERAR
		if(request.getParameter("p").equals("alterar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			
			long id = Long.parseLong(request.getParameter("id"));	
			String numero = request.getParameter("numero");
			String marca = request.getParameter("marca");
			String tipo = request.getParameter("tipo");
			String modelo = request.getParameter("modelo");
			String placa = request.getParameter("placa");
			String renavan = request.getParameter("renavan");
			String cor = request.getParameter("cor");
			String ano = request.getParameter("ano");
			String combustivel = request.getParameter("combustivel");
			
			Veiculo v = ejb.localizarVeiculo(id);
			v.setNumero(numero);
			v.setMarca(marca);
			v.setTipo(tipo);
			v.setModelo(modelo);
			v.setPlaca(placa);
			v.setRenavan(renavan);
			v.setCor(cor);
			v.setAno(ano);
			v.setCombustivel(combustivel);
			
			System.out.println("alterado: " + ejb.editarVeiculo(v));
			
			request.removeAttribute("selectedveic");
			Veiculos = ejb.listarVeiculos();
			this.getServletContext().setAttribute("lista", Veiculos);
			request.getRequestDispatcher("/restrito/listaVeiculos.jsp").forward(request, response);
		}
		
		//PARAMETRO PARA LISTAR
		if(request.getAttribute("p") != null && request.getAttribute("p").toString().equals("lisveic"))
		{
			System.out.println("req: " + request.getAttribute("p").toString());
			Veiculos = ejb.listarVeiculos();
			this.getServletContext().setAttribute("lista", Veiculos);
			request.getRequestDispatcher("/restrito/listaVeiculos.jsp").forward(request, response);
		}
		
		//PARAMETRO PARA EXCLUIR
		if(request.getParameter("p").equals("excluir"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			Veiculo e = ejb.localizarVeiculo(id);
			ejb.excluirVeiculo(e);
			
			Veiculos = ejb.listarVeiculos();
			this.getServletContext().setAttribute("lista", Veiculos);
			request.getRequestDispatcher("/restrito/listaVeiculos.jsp").forward(request, response);
		}
		
		//PARAMETRO PARA EDITAR
		if(request.getParameter("p").equals("editar"))
		{
			System.out.println("req: " + request.getParameter("p"));
			long id = Long.parseLong(request.getParameter("r"));
			
			Veiculo e = ejb.localizarVeiculo(id);
			System.out.println("CRUDVEICULO:"+e.getNumero()+e.getIdVeiculo()+e.getPlaca());
			
			request.setAttribute("selectedveic", e);
			request.getRequestDispatcher("/restrito/editarVeiculo.jsp").forward(request, response);
		}

	}

}
