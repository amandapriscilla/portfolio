package infinith.sinal.interfaces;

import java.util.List;

import javax.ejb.Local;

import infinith.sinal.modelo.Rota;

@Local
public interface IRotaLocal {
	
	public boolean inserirRota(Rota r);
	public List<Rota> listarRotas();
	public boolean editarRota(Rota r);
	public boolean excluirRota(Rota r);
	public Rota localizarRota(long id);
	
	public Rota getRotaById(String idRota); 
	public List<Rota> findRotaByFiltro(String filtro); 
}
