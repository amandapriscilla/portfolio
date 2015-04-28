package infinith.sinal.beans;

import infinith.sinal.dao.NoticiaDAO;
import infinith.sinal.interfaces.INoticiaLocal;
import infinith.sinal.modelo.Noticia;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
 
/**
 * Session Bean implementation class NoticiaBean
 */
@Stateless
public class NoticiaBean implements INoticiaLocal{

    /**
     * Default constructor. 
     */
	private final int noticiasPorPagina = 5;
	
    @PersistenceContext(unitName="sinal")
	EntityManager em;
	
    public NoticiaBean() {
    }

	@Override
	public boolean inserirNoticia(Noticia n) {
    	NoticiaDAO dao = new NoticiaDAO(em);

		if(dao.inserirNoticia(n))
			return true;

		return false;
	}

	@Override
	public List<Noticia> listarNoticias() {
		NoticiaDAO dao = new NoticiaDAO(em);

		return dao.listarNoticias();
	}

	public List<Noticia> listarUltimasNoticias() {
		NoticiaDAO dao = new NoticiaDAO(em);

		return dao.listarUltimasNoticias();
	}

	
	public boolean excluirNnoticia(Noticia n)
	{
		NoticiaDAO dao = new NoticiaDAO(em);

		if(dao.excluirNoticia(n))
			return true;

		return false;
	}

	@Override
	public Noticia getNoticiaById(long id) {
		NoticiaDAO dao = new NoticiaDAO(em);
		return dao.getNoticiaById(id).get(0);
	}

	@Override
	public boolean excluirNoticia(Noticia n) {
		NoticiaDAO dao = new NoticiaDAO(em);
		return dao.excluirNoticia(n);
	}

	@Override
	public boolean editarNoticia(Noticia n) {
		NoticiaDAO dao = new NoticiaDAO(em);
		return dao.editarNoticia(n);
	}

	@Override
	public int getTotalPaginas() {
		NoticiaDAO dao = new NoticiaDAO(em);
		int nTotalDeNoticias = dao.numeroTotalDeNoticias();
		return (nTotalDeNoticias%noticiasPorPagina == 0)?nTotalDeNoticias/noticiasPorPagina:(nTotalDeNoticias/noticiasPorPagina + 1);
	}

	@Override
	public List<Noticia> getNoticiaByPagina(int pagina) {
		NoticiaDAO dao = new NoticiaDAO(em);
		return dao.getNoticiasByPagina(pagina, noticiasPorPagina);
	}

	@Override
	public List<Noticia> findNoticiaByFiltro(String filtro, int pagina) {
		NoticiaDAO dao = new NoticiaDAO(em);
		
		return dao.findNoticiasByTitulo(filtro, pagina, noticiasPorPagina);
	}

	@Override
	public int getTotalPaginasFiltro(String filtro) {
		NoticiaDAO dao = new NoticiaDAO(em);
		int nTotalDeNoticias = dao.numeroNoticiasFiltro(filtro);
		return (nTotalDeNoticias%noticiasPorPagina == 0)?nTotalDeNoticias/noticiasPorPagina:(nTotalDeNoticias/noticiasPorPagina + 1);
	}

	
	
	
}
