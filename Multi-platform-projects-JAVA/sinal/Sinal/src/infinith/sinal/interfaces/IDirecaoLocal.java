package infinith.sinal.interfaces;

import java.util.List;

import javax.ejb.Local;

import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Rota;

@Local
public interface IDirecaoLocal {
	 
	public List<Direcao> listarDirecoesByRota(Rota r);

	public boolean inserirDirecao(Direcao e);
	public List<Direcao> listarDirecoes();
	public boolean editarDirecao(Direcao e);
	public boolean excluirDirecao(Direcao e);
	public Direcao getDirecaoById(String idDirecao);
	public Direcao getDirecao(Direcao d);
}
