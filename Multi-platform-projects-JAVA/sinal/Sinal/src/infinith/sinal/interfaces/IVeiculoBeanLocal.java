package infinith.sinal.interfaces;
import infinith.sinal.modelo.Veiculo;

import java.util.List;

import javax.ejb.Local;


@Local
public interface IVeiculoBeanLocal {
	public boolean inserirVeiculo(Veiculo e);
	public List<Veiculo> listarVeiculos();
	public boolean editarVeiculo(Veiculo e);
	public boolean excluirVeiculo(Veiculo e);
	public Veiculo localizarVeiculo(long id); 
}
