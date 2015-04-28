package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;

import javax.persistence.*;

@Entity
@Table(name="georeferencia")
public class Georeferencia implements PersistObj
{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idGeoreferencia;
	private int codigo;
	private String descricao;
	private double latitude;
	private double longitude;
	private boolean importancia;
	
	public Georeferencia(){}

	public Georeferencia(int codigo, String descricao, double latitude,
			double longitude, boolean importancia)
	{
		super();
		this.codigo = codigo;
		this.setDescricao(descricao);
		this.latitude = latitude;
		this.longitude = longitude;
		this.importancia = importancia;
	}
	
	public long getIdGeoreferencia()
	{
		return idGeoreferencia;
	}
	
	public void setIdGeoreferencia(long idGeoreferencia)
	{
		this.idGeoreferencia = idGeoreferencia;
	}
	
	public int getCodigo()
	{
		return codigo;
	}
	
	public void setCodigo(int codigo)
	{
		this.codigo = codigo;
	}
	
	public String getDescricao()
	{
		return descricao;
	}
	
	public void setDescricao(String descricao)
	{
		this.descricao = descricao.toUpperCase();
	}
	
	public double getLatitude()
	{
		return latitude;
	}
	
	public void setLatitude(double latitude)
	{
		this.latitude = latitude;
	}
	
	public double getLongitude()
	{
		return longitude;
	}
	
	public void setLongitude(double longitude)
	{
		this.longitude = longitude;
	}
	
	public boolean isImportancia()
	{
		return importancia;
	}
	
	public void setImportancia(boolean importancia)
	{
		this.importancia = importancia;
	}

	@Override
	public long getId() {
		return idGeoreferencia;
	}
	
	
}
