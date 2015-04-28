package infinith.sinal.modelo;

import java.util.List;

import infinith.sinal.interfaces.PersistObj;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
 
@Entity
@Table(name="rota")
@SuppressWarnings("serial")
public class Rota implements PersistObj{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idRota")
	private long idRota;
	
	@Column(name="nome")
	private String nome;
	
	@Column(name="descricao")
	private String descricao;
	
	@OneToMany(mappedBy="rota")
	private List<Direcao> direcoes;

	public List<Direcao> getDirecoes() {
		return direcoes;
	}

	public void setDirecoes(List<Direcao> direcoes) {
		this.direcoes = direcoes;
	}
	
	public Rota() {
	}
	
	public Rota(String nome, String descricao) 
	{
		this.setNome(nome);
		this.setDescricao(descricao);
	}

	public void setIdRota(long idRota) {
		this.idRota = idRota;
	}

	public long getIdRota() {
		return idRota;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	@Override
	public long getId() {
		return idRota;
	}
	
		

}
