package infinith.sinal.enums;

public enum Aviso {
	  ERRO_SALVAR("erro", "Não foi possível salvar as informações, por favor verifique se os dados estão corretos e tente novamente mais tarde"),
	  ERRO_ENVIAR("erro", "Não foi possível enviar as informações, por favor verifique se os dados estão corretos e tente novamente mais tarde"),
	  ERRO_EXCLUIR("erro", "Não foi possível excluir as informações, por favor atualize a página e tente novamente mais tarde"),
	  ERRO_FORMATO("erro", "Campo preenchido em formato inválido, por favor verifique as informações digitadas"),
	  ERRO_DUPLICADO("erro", "Essa informação já foi cadastrada anteriormente, por favor insira novas informações!"),
	  ERRO_LOGINFAIL("erro", "Login e/ou Senha inválidos!"),
	  ERRO_LOGINJAEXISTE("erro", "Login já existente, por favor escolha outro login."),
	  
	  SUCESSO_SALVAR("sucesso", "Informações salvas com sucesso!"),
	  SUCESSO_EXCLUIR("sucesso", "Informações excluídas com sucesso!"),
	  SUCESSO_ENVIAR("sucesso", "Informações enviadas com sucesso!"),
	  
	  ALERTA_LISTAVAZIA("alerta", "Nenhuma informação cadastrada"),
	  ALERTA_CAMPOVAZIO("alerta", "Há campos obrigatórios não preenchidos!"),
	  ALERTA_NOMEINCOMPLETO("alerta", "Campo de nome está imcompleto, verifique se foi preenchido corretamente"),
	  ALERTA_CONFIRMARSENHA("alerta", "Campo Confirmar Senha e Senha são distintos"),
	  ALERTA_EXCEDEUTAMANHO("alerta", "Valor de campo textual muito longo, o máximo permitido é de 255 caracteres!");
	  
	  
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
