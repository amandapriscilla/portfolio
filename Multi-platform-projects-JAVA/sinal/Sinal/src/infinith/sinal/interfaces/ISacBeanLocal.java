package infinith.sinal.interfaces;
import infinith.sinal.modelo.Sac;

import java.util.List;

import javax.ejb.Local;

@Local
public interface ISacBeanLocal
{
	public boolean inserirSac(Sac sac);
    
    public boolean editarSac(Sac sac);
    
    public boolean excluirSac(Sac sac);
    
    public List<Sac> listarSacs();
    
    public List<Sac> listarSacsPorAssunto(String assunto);
    
    public Sac localizarSac(long id);
}
