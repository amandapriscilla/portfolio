package br.ufrn.poo.dominio;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import br.ufrn.poo.exception.OperacaoCanceladaException;
import br.ufrn.poo.gui.TelaServidor;

public class Servidor{

	private static Servidor singleton = new Servidor();
	
	public static Servidor getInstance(){
		return singleton;
	}

	private ObjectOutputStream output; 
	private ObjectInputStream input;
	private ServerSocket server; 
	private Socket connection;
	private int contador = 1; // countador do numero de conexoes
	
	/** Cria um socket de conexão*/
	public void criarSocket() throws IOException{
		server = new ServerSocket(12345, 100); // cria ServerSocket	
	}
	
	/** Espera conexao e retorna informacao da conexao */
	public String esperaPorConexao() throws IOException {
		connection = server.accept(); // servidor aceita a conexao
		return "Conexao " + contador + " recebida de: " + connection.getInetAddress().getHostName();
	} 
	
	public String getStreams() throws IOException {
		output = new ObjectOutputStream(connection.getOutputStream());
		output.flush(); 
		input = new ObjectInputStream(connection.getInputStream());
		return "\nRecuperou E/S streams\n";
	}
	
	public String enviarDados(String message) {
		try 
		{
			output.writeObject("SERVIDOR -> " + message);
			output.flush(); // apresenta ao cliente
			return "\nSERVIDOR -> " + message;
		} 
		catch (IOException ioException) {
			return " \nErro: Mensagem não enviada!";
		} 
	} 
	/** Método Recebimento de Dados do Cliente */
	public String lerNovaMensagem() throws IOException, ClassNotFoundException{
		return (String) input.readObject();
	}
	
	/** Método de Recebimento de Arquivo do Cliente  
	 * @param tela */
	public String receberArquivo(TelaServidor tela) {
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
	/** Método de envio de arquivo para o cliente*/
	public String enviarArquivo(Arquivo arquivo) {
		try {
			arquivo.enviarArquivo(output);
			return "Envio de Arquivo Concluído! ";
			} catch (IOException e) {
				e.printStackTrace();
				return "Erro: Arquivo não enviado!";
			}
	}

	
	// Finalizar Conexão = Fechar Socket
	public void fecharConexao(){	
		try {
			output.close(); // fecha output stream
			input.close(); // fecha input stream
			connection.close(); // fecha socket
		} 
		catch (IOException ioException) {
			ioException.printStackTrace();
		} 
	
		contador++;
	}

	
}
