package infinith.sinal.interfaces;
import infinith.sinal.modelo.Empresa;

import java.util.List;

import javax.ejb.Local;


@Local
public interface IEmpresaBeanLocal {
	public boolean inserirEmpresa(Empresa e);
	public List<Empresa> listarEmpresas();
	public boolean editarEmpresa(Empresa e);
	public boolean excluirEmpresa(Empresa e);
	public Empresa localizarEmpresa(long id); 
}
