package infinith.sinal.interfaces;

import java.util.List;

import javax.ejb.Local;

import infinith.sinal.modelo.Direcao;
import infinith.sinal.modelo.Percurso;
@Local
public interface IPercursoLocal {

	public List<Percurso> getPercursoByDirecao(Direcao d);

	public boolean inserirPercurso(Percurso p);
	public List<Percurso> listarPercursos();
	public boolean excluirPercurso(Percurso p);
	public Percurso getPercursoById(String idPercurso);
	
}
 