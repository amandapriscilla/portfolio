package infinith.sinal.interfaces;

import infinith.sinal.modelo.Noticia;

import java.util.List;

import javax.ejb.Local;


@Local
public interface INoticiaLocal {

	public boolean inserirNoticia(Noticia n);
	public List<Noticia> listarNoticias();
	public Noticia getNoticiaById(long id);
	public boolean excluirNoticia(Noticia n);
	public boolean editarNoticia(Noticia n);
	public List<Noticia> listarUltimasNoticias();
	public int getTotalPaginas();
	public List<Noticia> getNoticiaByPagina(int pagina);
	public List<Noticia> findNoticiaByFiltro(String filtro, int pagina);
	public int getTotalPaginasFiltro(String filtro);
}
 