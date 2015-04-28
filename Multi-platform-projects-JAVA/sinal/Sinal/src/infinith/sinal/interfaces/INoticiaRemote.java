package infinith.sinal.interfaces;

import infinith.sinal.modelo.Noticia;

import java.util.List;

import javax.ejb.Remote;


@Remote
public interface INoticiaRemote {

	public boolean inserirNoticia(Noticia n);
	public List<Noticia> listarNoticias();
	public Noticia getNoticiaById(long id);
	public boolean excluirNoticia(Noticia n);
	public boolean editarNoticia(Noticia n);
	
}
 