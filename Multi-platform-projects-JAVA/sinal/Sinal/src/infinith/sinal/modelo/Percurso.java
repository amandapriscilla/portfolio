package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity 
@Table(name="percurso")
@SuppressWarnings("serial")
public class Percurso implements PersistObj {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idPercurso")
	private long idPercurso;
	
	@ManyToOne
	@JoinColumn(name="georeferenciaAFK")
	private Georeferencia georeferenciaA;
	
	@ManyToOne
	@JoinColumn(name="georeferenciaBFK")
	private Georeferencia georeferenciaB;
	
	@ManyToOne
	@JoinColumn(name="direcaoFK")
	private Direcao direcao;
	
	@Column(name="tempo")
	private int tempo;
	
	@Column(name="distancia") 
	private int distancia;

	
	
	public Percurso(){};
			
	public Percurso(long idPercurso, Georeferencia georeferenciaA,
			Georeferencia georeferenciaB, Direcao direcao, int tempo,
			int distancia) {
		super();
		this.idPercurso = idPercurso;
		this.georeferenciaA = georeferenciaA;
		this.georeferenciaB = georeferenciaB;
		this.direcao = direcao;
		this.tempo = tempo;
		this.distancia = distancia;
	}

	@Override
	public long getId() {
		return idPercurso;
	}
	

	public void setGeoreferenciaA(Georeferencia georeferenciaA) {
		this.georeferenciaA = georeferenciaA;
	}

	public Georeferencia getGeoreferenciaA() {
		return georeferenciaA;
	}

	public void setGeoreferenciaB(Georeferencia georeferenciaB) {
		this.georeferenciaB = georeferenciaB;
	}

	public Georeferencia getGeoreferenciaB() {
		return georeferenciaB;
	}

	public void setDirecao(Direcao direcao) {
		this.direcao = direcao;
	}

	public Direcao getDirecao() {
		return direcao;
	}

	public void setTempo(int tempo) {
		this.tempo = tempo;
	}

	public int getTempo() {
		return tempo;
	}

	public int getDistancia() {
		return distancia;
	}

	public void setDistancia(int distancia) {
		this.distancia = distancia;
	}


}
