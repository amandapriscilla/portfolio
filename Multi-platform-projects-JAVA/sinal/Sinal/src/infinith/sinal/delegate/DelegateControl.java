package infinith.sinal.delegate;

import infinith.sinal.beans.DirecaoBean;
import infinith.sinal.beans.GeoreferenciaBean;
import infinith.sinal.beans.NoticiaBean;
import infinith.sinal.beans.PercursoBean;
import infinith.sinal.beans.RotaBean; 
import infinith.sinal.interfaces.INoticiaLocal;
import infinith.sinal.modelo.Noticia;

import java.util.List;

import infinith.sinal.modelo.Rota;

import infinith.sinal.interfaces.IDirecaoLocal;
import infinith.sinal.interfaces.IGeoreferenciaLocal;
import infinith.sinal.interfaces.IPercursoLocal;
import infinith.sinal.interfaces.IRotaLocal;
import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Georeferencia;
import infinith.sinal.modelo.Percurso;

public class DelegateControl {

	private IRotaLocal rotaLocal;

	private IDirecaoLocal direcaoLocal;

	private IGeoreferenciaLocal georeferenciaLocal;

	private IPercursoLocal percursoLocal;
	

	private INoticiaLocal noticiaLocal;
	
		public DelegateControl()
		{
			//ServiceLocator locator = ServiceLocator.getInstance();
			rotaLocal = (IRotaLocal)new RotaBean();
			direcaoLocal =(IDirecaoLocal) new DirecaoBean();
			georeferenciaLocal = (IGeoreferenciaLocal)new GeoreferenciaBean();
			percursoLocal =(IPercursoLocal) new PercursoBean();
			
			noticiaLocal =(INoticiaLocal) new NoticiaBean();
			
		}
		
		//Metodos Referentes a Noticia
		
		public boolean inserirNoticia(Noticia n)
		{
			return noticiaLocal.inserirNoticia(n);
		}
		
		public List<Noticia> listarNoticias()
		{
			return noticiaLocal.listarNoticias();
		}

		public List<Noticia> listarUltimasNoticias()
		{
			return noticiaLocal.listarNoticias();
		}
		
		public Noticia getNoticiaById(long id) {
			// TODO Auto-generated method stub
			return noticiaLocal.getNoticiaById(id);
		}

		public boolean excluirNoticia(Noticia n) {
			// TODO Auto-generated method stub
			return noticiaLocal.excluirNoticia(n);
		}

		public boolean editarNoticia(Noticia n) {
			// TODO Auto-generated method stub
			return noticiaLocal.editarNoticia(n);
		}
	
		//Metodos Referentes ao Caso de Uso Visualizar Horarios
		
		public List<Rota> listarRotas()
		{
			return rotaLocal.listarRotas();
		}

		public List<Direcao> listarDirecoesByRota(Rota r){
			return direcaoLocal.listarDirecoesByRota(r);
		}

		public List<Direcao> listarDirecoes() {
			// TODO Auto-generated method stub
			return direcaoLocal.listarDirecoes();
		}

		public Rota getRotaById(String idRota) {
			// TODO Auto-generated method stub
			return rotaLocal.getRotaById(idRota);
		}
		
		public List<Georeferencia> listarParadas() {
			// TODO Auto-generated method stub
			return georeferenciaLocal.listarGeoreferencias();
		}

		public List<Percurso> getPercursoByDirecao(Direcao d) {
			// TODO Auto-generated method stub
			return percursoLocal.getPercursoByDirecao(d);
		}

		public Direcao getDirecaoById(String idDirecao) {
			// TODO Auto-generated method stub
			return direcaoLocal.getDirecaoById(idDirecao);
		}
		
}
