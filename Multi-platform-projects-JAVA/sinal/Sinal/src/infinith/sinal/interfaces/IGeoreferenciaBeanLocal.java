package infinith.sinal.interfaces;
import infinith.sinal.modelo.Georeferencia;

import java.util.List;

import javax.ejb.Local;

@Local
public interface IGeoreferenciaBeanLocal
{
	public boolean inserirGeoreferencia(Georeferencia e);
	public List<Georeferencia> listarGeoreferencias();
	public boolean editarGeoreferencia(Georeferencia e);
	public boolean excluirGeoreferencia(Georeferencia e);
	public Georeferencia localizarGeoreferencia(long id);
} 
