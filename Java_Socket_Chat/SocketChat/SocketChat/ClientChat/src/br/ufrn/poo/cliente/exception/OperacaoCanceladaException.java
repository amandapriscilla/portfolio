package br.ufrn.poo.cliente.exception;

public class OperacaoCanceladaException extends Exception {

	public OperacaoCanceladaException() {
		super("Opera��o cancelada!");
	}

	public OperacaoCanceladaException(String message) {
		super(message);
	}
	
	
}
