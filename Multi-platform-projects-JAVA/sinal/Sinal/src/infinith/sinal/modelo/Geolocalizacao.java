package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="geolocalizacao")
public class Geolocalizacao implements PersistObj
{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idGeolocalizacao;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="time")
	private Date time;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="horaSaida")
	private Date horaSaida;
	private String latitude;
	private String longitude;

	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="direcao")
	private Direcao direcao;
	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="usuario")
	private Funcionario usuario;

	
	public Geolocalizacao(){}
	
	public Geolocalizacao(long idGeolocalizacao, Timestamp time,
			Timestamp horaSaida, String latitude, String longitude,
			Georeferencia ultimaGeoreferencia, Direcao direcao,
			Funcionario usuario) {
		super();
		this.idGeolocalizacao = idGeolocalizacao;
		this.time = time;
		this.horaSaida = horaSaida;
		this.latitude = latitude;
		this.longitude = longitude;
		this.direcao = direcao;
		this.usuario = usuario;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Date getHoraSaida() {
		return horaSaida;
	}

	public void setHoraSaida(Timestamp horaSaida) {
		this.horaSaida = horaSaida;
	}

	public Funcionario getUsuario() {
		return usuario;
	}

	public void setUsuario(Funcionario usuario) {
		this.usuario = usuario;
	}

	public long getIdGeolocalizacao() {
		return idGeolocalizacao;
	}
	
	public String getLatitude()
	{
		return latitude;
	}
	
	public void setLatitude(String latitude)
	{
		this.latitude = latitude+"";
	}
	
	public String getLongitude()
	{
		return longitude;
	}
	
	public void setLongitude(String longitude)
	{
		this.longitude = longitude;
	}

	public Direcao getDirecao() {
		return direcao;
	}

	public void setDirecao(Direcao direcao) {
		this.direcao = direcao;
	}

	@Override
	public long getId() {
		return idGeolocalizacao;
	}
	
	
}
