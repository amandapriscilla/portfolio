package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

 
@Entity
@Table(name="noticia")
@SuppressWarnings("serial")
public class Noticia implements PersistObj{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idNoticia")
	private long idNoticia;
	
	@Column(name="titulo")
	private String titulo;
	
	@Column(name="descricao")
	private String descricao;

	@Column(name="palavrasChaves")
	private String palavrasChaves;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="dataCadastro")
	private Date dataCadastro;
	
	public Noticia(){
		
	}
	
	public Noticia(String titulo, String descricao, String pChaves, Date sqlDate) {
	
		this.setTitulo(titulo);
		this.setDescricao(descricao);
		this.setPalavrasChaves(pChaves);
		this.setDataCadastro(sqlDate);
	
	}

	public Noticia(long idNoticia, String titulo, String descricao, String pChaves, Date sqlDate) {
	
		this.idNoticia = idNoticia;
		this.setTitulo(titulo);
		this.setDescricao(descricao);
		this.setPalavrasChaves(pChaves);
		this.setDataCadastro(sqlDate);
	}


	public long getIdNoticia() {
		return idNoticia;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo.toUpperCase();
	}

	public String getTitulo() {
		return titulo;
	}

	public void setPalavrasChaves(String palavrasChaves) {
		this.palavrasChaves = palavrasChaves;
	}

	public String getPalavrasChaves() {
		return palavrasChaves;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	@Override
	public long getId() {
		// TODO Auto-generated method stub
		return idNoticia;
	}
	

}
