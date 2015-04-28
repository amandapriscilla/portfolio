package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="sac")
@SuppressWarnings("serial")
public class Sac implements PersistObj
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idSac;
	private String nome;
	private String assunto;
	private String email;
	private String mensagem;
	
	// novos atributos (incluir na documentação).
	private int lido;
	private int respondido;
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar data;
	
	
	public Sac(){}
	

	@SuppressWarnings("static-access")
	public Sac(String nome, String assunto, String email, String mensagem) {
		super();
		this.setNome(nome);
		this.setAssunto(assunto);
		this.email = email;
		this.mensagem = mensagem;
		
		// setando os novos atributos.
		this.lido = 0;
		this.respondido = 0;
		
		Locale local = new Locale("pt","BR"); 
		SimpleDateFormat formData = new SimpleDateFormat("dd/MM/yyyy' - 'HH':'mm'h'",local);
		
		Calendar calendar = formData.getCalendar();
		this.data = calendar.getInstance();
	}



	@Override
	public long getId()
	{
		return idSac;
	}

	public long getIdSac() {
		return idSac;
	}

	public void setIdSac(long idSac) {
		this.idSac = idSac;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome.toUpperCase();
	}

	public String getAssunto() {
		return assunto.toUpperCase();
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}


	// getters e setters dos novos atributos.
	
	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public int getLido() {
		return lido;
	}

	public void setLido(int lido) {
		this.lido = lido;
	}

	public int getRespondido() {
		return respondido;
	}

	public void setRespondido(int respondido) {
		this.respondido = respondido;
	}
}
