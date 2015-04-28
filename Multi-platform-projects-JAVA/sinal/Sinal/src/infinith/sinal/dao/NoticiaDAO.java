package infinith.sinal.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.EntityManager;


import infinith.sinal.modelo.Noticia;

public class NoticiaDAO {

	EntityManager em;

	public NoticiaDAO(EntityManager em){
		this.em = em;
	}
		
	public boolean inserirNoticia(Noticia n){
			
		try{
			em.persist(n);
			return true;
		} 
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
		
	@SuppressWarnings("unchecked")
	public List<Noticia> listarNoticias()	{
		Query q = em.createQuery("select object(e) FROM Noticia as e ORDER BY dataCadastro DESC");
		return q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Noticia> getNoticiaById(long idNoticia){
		Query q = em.createQuery("select object(e) FROM Noticia as e WHERE idNoticia="+idNoticia);
		return q.getResultList();
	}
	
	
	public boolean excluirNoticia(Noticia n)
	{
		
		try
		{
			Noticia not = em.find(Noticia.class, n.getIdNoticia());
			em.remove(not);
			return true;
		}
		catch(Exception ex)
		{
			return false;
		}
	}

	public boolean editarNoticia(Noticia n) {
		// TODO Auto-generated method stub
		try{
			em.merge(n);
			return true;
		}catch(Exception ex)
		{
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Noticia> listarUltimasNoticias() {
		Query q = em.createQuery("select object(e) FROM Noticia as e ORDER BY dataCadastro DESC");
		q.setMaxResults(3);
		return q.getResultList();
	}
	
	public int numeroTotalDeNoticias() {
		Query q = em.createQuery("select object(e) FROM Noticia as e");
		return q.getResultList().size();
	}
	
	@SuppressWarnings("unchecked")
	public List<Noticia> getNoticiasByPagina(int pagina, int noticiasPorPagina){
		Query q = em.createQuery("select object(e) FROM Noticia as e ORDER BY dataCadastro DESC");
		int fromIndex = (pagina-1)*noticiasPorPagina;
		int toIndex = (pagina*noticiasPorPagina < numeroTotalDeNoticias())?pagina*noticiasPorPagina:numeroTotalDeNoticias();
		return q.getResultList().subList(fromIndex, toIndex);
	}

	@SuppressWarnings("unchecked")
	public List<Noticia> findNoticiasByTitulo(String filtro,int pagina, int noticiasPorPagina) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("select object(e) FROM Noticia as e WHERE UPPER(e.titulo) LIKE :filtro");
		q.setParameter("filtro", "%" + filtro.toUpperCase() + "%");
		int fromIndex = (pagina-1)*noticiasPorPagina;
		int toIndex = (pagina*noticiasPorPagina < numeroNoticiasFiltro(filtro))?pagina*noticiasPorPagina:numeroNoticiasFiltro(filtro);
		return q.getResultList().subList(fromIndex, toIndex);
	}

	public int numeroNoticiasFiltro(String filtro) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("select object(e) FROM Noticia as e WHERE UPPER(e.titulo) LIKE :filtro");
		q.setParameter("filtro", "%" + filtro.toUpperCase() + "%");
		return q.getResultList().size();
	}
	
}

	

