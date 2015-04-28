package infinith.sinal.modelo;

import java.util.Collection;

import infinith.sinal.interfaces.PersistObj;
import javax.persistence.Column; 
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="direcao")
@SuppressWarnings("serial")
public class Direcao implements PersistObj{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idDirecao")
	private long idDirecao;
	
	@Column(name="descricao")
	private String descricao;
	
	@Column(name="mapa")
	private String mapa;
	
	@Column(name="itinerario")
	private String itinerario;

	@ManyToOne//(cascade={CascadeType.ALL})
	@JoinColumn(name="rotaFK") 
	private Rota rota;
	
	@OneToMany(mappedBy="direcao")
	Collection<Percurso> percursos;
	
	
	public Direcao() {
	}
	
	public Direcao(String descricao, Rota rota) 
	{
		this.setDescricao(descricao);
		this.setRota(rota);
		
	}

	public void setIdDirecao(long idDirecao) {
		this.idDirecao = idDirecao;
	}

	public long getIdDirecao() {
		return idDirecao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao.toUpperCase();
	}

	public String getDescricao() {
		return descricao;
	}

	
	public Rota getRota() {
		return rota;
	}

	public void setRota(Rota rota) {
		this.rota = rota;
	}

	public void setMapa(String mapa) {
		this.mapa = mapa;
	}

	public String getMapa() {
		return mapa;
	}

	public void setItinerario(String intinerario) {
		this.itinerario = intinerario;
	}

	public String getItinerario() {
		return itinerario;
	}

	@Override
	public long getId() {
		return idDirecao;
	}
	
	
}
