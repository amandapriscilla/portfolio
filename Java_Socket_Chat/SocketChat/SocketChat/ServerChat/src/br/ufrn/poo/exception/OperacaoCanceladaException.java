package br.ufrn.poo.exception;

public class OperacaoCanceladaException extends Exception {
	public OperacaoCanceladaException() {
		super("Opera��o cancelada!");
	}

	public OperacaoCanceladaException(String message) {
		super(message);
	}
	
	
}
