package br.ufrn.poo.exception;

public class OperacaoCanceladaException extends Exception {
	public OperacaoCanceladaException() {
		super("Operação cancelada!");
	}

	public OperacaoCanceladaException(String message) {
		super(message);
	}
	
	
}
