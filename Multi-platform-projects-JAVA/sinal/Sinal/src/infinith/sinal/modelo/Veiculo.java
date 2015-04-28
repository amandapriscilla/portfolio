package infinith.sinal.modelo;

import infinith.sinal.interfaces.PersistObj;
import javax.persistence.*;

@Entity
@Table(name="veiculo")
@SuppressWarnings("serial")
public class Veiculo implements PersistObj
{
	 
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long idVeiculo;
	private String numero;
	private String marca;
	private String tipo;
	private String modelo;
	private String placa;
	private String renavan;
	private String cor;
	private String ano;
	private String combustivel;
	
	public Veiculo(){
		
	}
	
	public Veiculo(String numero,String marca,String tipo,String modelo, String placa,
			String renavan,String cor,String ano,String combustivel){
		
		this.numero = numero;
		this.setMarca(marca);
		this.setTipo(tipo);
		this.setModelo(modelo);
		this.setPlaca(placa);
		this.renavan = renavan;
		this.setCor(cor);
		this.ano = ano;
		this.setCombustivel(combustivel);
		
	}
	
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca.toUpperCase();
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo.toUpperCase();
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo.toUpperCase();
	}
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa.toUpperCase();
	}
	public String getRenavan() {
		return renavan;
	}
	public void setRenavan(String renavan) {
		this.renavan = renavan;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor.toUpperCase();
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getCombustivel() {
		return combustivel;
	}
	public void setCombustivel(String combustivel) {
		this.combustivel = combustivel.toUpperCase();
	}

	public long getIdVeiculo() {
		return idVeiculo;
	}

	public void setIdVeiculo(long idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

	@Override
	public long getId() {
		return idVeiculo;
	}
	
}
