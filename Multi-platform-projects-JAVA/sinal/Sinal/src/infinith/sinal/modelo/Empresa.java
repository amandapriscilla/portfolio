package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import javax.persistence.*;

@Entity 
@Table(name="empresa")
@SuppressWarnings("serial")
public class Empresa implements PersistObj
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idEmpresa;
	private String nomeFantasia;
	private String razaoSocial;
	private String cnpj;
	private String inscMunicipal;
	private String inscEstadual;
	
	public Empresa() {
	}
	
	public Empresa(String nomeFantasia, String razaoSocial, String cnpj,
			String inscMunicipal, String inscEstadual) 
	{
		this.setNomeFantasia(nomeFantasia);
		this.setRazaoSocial(razaoSocial);
		this.cnpj = cnpj;
		this.inscMunicipal = inscMunicipal;
		this.inscEstadual = inscEstadual;
	}
	
	public String getCnpj()
	{
		return cnpj;
	}

	public long getIdEmpresa()
	{
		return idEmpresa;
	}

	public String getInscEstadual()
	{
		return inscEstadual;
	}

	public String getInscMunicipal()
	{
		return inscMunicipal;
	}

	public String getNomeFantasia()
	{
		return nomeFantasia;
	}

	public String getRazaoSocial()
	{
		return razaoSocial;
	}

	public void setCnpj(String cnpj)
	{
		this.cnpj = cnpj;
	}

	public void setIdEmpresa(long idEmpresa)
	{
		this.idEmpresa = idEmpresa;
	}

	public void setInscEstadual(String inscEstadual)
	{
		this.inscEstadual = inscEstadual;
	}

	public void setInscMunicipal(String inscMunicipal)
	{
		this.inscMunicipal = inscMunicipal;
	}

	public void setNomeFantasia(String nomeFantasia)
	{
		this.nomeFantasia = nomeFantasia.toUpperCase();
	}

	public void setRazaoSocial(String razaoSocial)
	{
		this.razaoSocial = razaoSocial.toUpperCase();
	}

	@Override
	public long getId() {
		return idEmpresa;
	}

	
}
