package infinith.sinal.enums;

public enum Aviso {
	  ERRO_SALVAR("erro", "N�o foi poss�vel salvar as informa��es, por favor verifique se os dados est�o corretos e tente novamente mais tarde"),
	  ERRO_ENVIAR("erro", "N�o foi poss�vel enviar as informa��es, por favor verifique se os dados est�o corretos e tente novamente mais tarde"),
	  ERRO_EXCLUIR("erro", "N�o foi poss�vel excluir as informa��es, por favor atualize a p�gina e tente novamente mais tarde"),
	  ERRO_FORMATO("erro", "Campo preenchido em formato inv�lido, por favor verifique as informa��es digitadas"),
	  ERRO_DUPLICADO("erro", "Essa informa��o j� foi cadastrada anteriormente, por favor insira novas informa��es!"),
	  ERRO_LOGINFAIL("erro", "Login e/ou Senha inv�lidos!"),
	  ERRO_LOGINJAEXISTE("erro", "Login j� existente, por favor escolha outro login."),
	  
	  SUCESSO_SALVAR("sucesso", "Informa��es salvas com sucesso!"),
	  SUCESSO_EXCLUIR("sucesso", "Informa��es exclu�das com sucesso!"),
	  SUCESSO_ENVIAR("sucesso", "Informa��es enviadas com sucesso!"),
	  
	  ALERTA_LISTAVAZIA("alerta", "Nenhuma informa��o cadastrada"),
	  ALERTA_CAMPOVAZIO("alerta", "H� campos obrigat�rios n�o preenchidos!"),
	  ALERTA_NOMEINCOMPLETO("alerta", "Campo de nome est� imcompleto, verifique se foi preenchido corretamente"),
	  ALERTA_CONFIRMARSENHA("alerta", "Campo Confirmar Senha e Senha s�o distintos"),
	  ALERTA_EXCEDEUTAMANHO("alerta", "Valor de campo textual muito longo, o m�ximo permitido � de 255 caracteres!");
	  
	  
	  private final String tipo;
	  private final String descricao;

	  private Aviso(String tipo, String description) {
		  this.tipo = tipo;
		  this.descricao = description;
	  }

	  public String getDescricao() {
	     return descricao;
	  }
	  
	  
	  public String getTipo() {
	     return tipo;
	  }

	  @Override
	  public String toString() {
	    return descricao;
	  }


}
