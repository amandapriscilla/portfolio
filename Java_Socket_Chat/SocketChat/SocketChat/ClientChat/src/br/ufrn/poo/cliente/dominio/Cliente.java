package br.ufrn.poo.cliente.dominio;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.JFrame;

import br.ufrn.poo.cliente.exception.OperacaoCanceladaException;
import br.ufrn.poo.cliente.gui.TelaCliente;

public class Cliente {
	
	private static Cliente singleton = new Cliente();
	
	public static Cliente getInstance(){
		return singleton;
	}

	private ObjectOutputStream output; 
	private ObjectInputStream input;
	private String nomeServidor; //servidor desta aplicacao
	private Socket cliente; // socket de comunicacao com servidor


	
	public void passarNomeServidor(String ip) {
		nomeServidor = ip;		
	}
	
	public String conectarServidor() throws UnknownHostException, IOException {
		// cria Socket para a conexao
		cliente = new Socket(InetAddress.getByName(nomeServidor), 12345);
	    return "Conectado a: " + cliente.getInetAddress().getHostName();
	}

	public String getStreams() throws IOException {
		output = new ObjectOutputStream(cliente.getOutputStream());
		output.flush();
		input = new ObjectInputStream(cliente.getInputStream());
		return "\nRecuperou E/S streams\n";
	}

	public String lerNovaMensagem() throws IOException, ClassNotFoundException {
		return (String) input.readObject(); 
	}
	
	
	
	public String enviarDados(String message) {
		try 
		{
			output.writeObject("CLIENTE -> " + message);
			output.flush(); // apresenta ao servidror
			return "\nCLIENTE -> " + message;
		} 
		catch (IOException ioException) {
			return " \nErro: Mensagem não enviada!";
		} 
	}
	/** Método de envio de arquivo para o servidor*/
	public String enviarArquivo(Arquivo arquivo) {		
			try {
				arquivo.enviarArquivo(output);
				return "Envio de Arquivo Concluído!\n";
			} catch (IOException e) {
				e.printStackTrace();
				return "Erro: Arquivo não enviado!\n";
				
			}
	}

	
	/** Método de Recebimento de Arquivo do Servidor  
	 * @param tela
	 * */
	public String receberArquivo(JFrame tela) {
		Arquivo arquivo = new Arquivo();
		try {
			arquivo.receberArquivo(input, tela);
			return "Arquivo recebido em: "+ arquivo.getFile().getAbsolutePath()+"!\n";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro ao receber o arquivo!\n";
		} catch (OperacaoCanceladaException e){
			return e.getMessage() +"\n";
			
		}
	}
	
	
	public void fecharConexao(){	
		try {
			output.close(); // fecha output stream
			input.close(); // fecha input stream
			cliente.close(); // fecha socket do cliente
		} 
		catch (IOException ioException) {
			ioException.printStackTrace();
		} 
	}
	
}

