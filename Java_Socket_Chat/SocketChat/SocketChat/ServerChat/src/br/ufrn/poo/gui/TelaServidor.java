package br.ufrn.poo.gui;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.EOFException;
import java.io.IOException;

import javax.swing.*;
import br.ufrn.poo.dominio.Arquivo;
import br.ufrn.poo.dominio.Servidor;



public class TelaServidor extends JFrame{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		JFrame.setDefaultLookAndFeelDecorated(true);
		TelaServidor tela = new TelaServidor();
		tela.setLocation(550, 400);
		tela.setDefaultCloseOperation(EXIT_ON_CLOSE);
		tela.run();

	}
	
	// Tela de Servidor
	
	private Servidor server = new Servidor();
	private JTextField txtCampoMensagem;  
	private JTextArea txtDadosArea; 
	private JFileChooser fileChooser;
	private JButton btnSendFile;
	
	public TelaServidor() {
		super("Servidor");

		// Criando elementos de interface swing
		txtDadosArea = new JTextArea(); 
		txtCampoMensagem = new JTextField(); 
		txtCampoMensagem.setEditable(false);
		txtCampoMensagem.addActionListener(new ActionListener() {
			// o metodo abaixo envia uma mensagem para o cliente
			public void actionPerformed(ActionEvent event) {
				String mensagem = server.enviarDados(event.getActionCommand());
				if(mensagem.startsWith(" \nErro")){ 	
					mostrarMensagem(mensagem);
				}else txtDadosArea.append(mensagem);
				txtCampoMensagem.setText("");
			} 
		} ); 

		this.add(txtCampoMensagem, BorderLayout.NORTH);

		
		this.add(new JScrollPane(txtDadosArea), BorderLayout.CENTER);
		
	    btnSendFile = new JButton();
		btnSendFile.setText("Enviar Arquivo");
		btnSendFile.setToolTipText("Procure e envie um arquivo local para a máquina cliente");
		
		
		btnSendFile.addActionListener(new ActionListener() {
			// o metodo abaixo envia uma mensagem para o cliente
			public void actionPerformed(ActionEvent event) {
				fileChooser = new JFileChooser();
				fileChooser.setDialogTitle("SERVIDOR -> Escolha o arquivo a ser enviado:");
				int returnVal = fileChooser.showOpenDialog(TelaServidor.this);
			    if(returnVal == JFileChooser.APPROVE_OPTION) {
			    	Arquivo arquivo = new Arquivo(fileChooser.getSelectedFile());
			    	// ENVIA MENSAGEM AVISANDO ENVIO DE ARQUIVO
			    	String mensagem = server.enviarDados("Enviando o arquivo: "+arquivo.getFilename());
					if(mensagem.startsWith(" \nErro")){ 	
						mostrarMensagem(mensagem);
					}else txtDadosArea.append(mensagem);
					String statusEnvio = server.enviarArquivo(arquivo);
			    	
			    	mostrarMensagem(server.enviarDados(statusEnvio));
					
			    	
	        } else {
	        	mostrarMensagem("Erro: Arquivo não enviado.");
	        }		
			}

		} );
		btnSendFile.setEnabled(false);
		
		this.add(btnSendFile, BorderLayout.SOUTH);
		
		this.setSize(300, 400);
		
	} 

		

	
	private void mostrarMensagem(final String mensagem) {
		SwingUtilities.invokeLater(new Runnable() {
			public void run(){
				txtDadosArea.append(mensagem); // escreve mensagem no campo
			} 
		} );
	} 


	private void run() {
		if(JOptionPane.showConfirmDialog(null, "Confirmar conexão?", "teste", 0)== 1) System.exit(0);
		this.setVisible(true);
		mostrarMensagem("Esperando conexão...\n");
		
		// Servidor fica esperando cliente conectar
		try 
		{
			server.criarSocket();
			while (true) {
				try {
					String connMensagem = server.esperaPorConexao();
					mostrarMensagem(connMensagem);
					mostrarMensagem(server.getStreams());
					processaConexao(); // processa conexao
				} 
				catch (EOFException eofException) {
					mostrarMensagem("\nServidor encerrou a conexão");
				} 
				finally {
					mostrarMensagem("\nEncerrando conexão\n");
					this.setCampoEditavel(false); 
					server.fecharConexao();
				} 
			} 
		} 
		catch (IOException ioException) {
			ioException.printStackTrace();
		} 		
		
	}
	
	private void processaConexao(){
		String message = "Conectado com sucesso!";
		mostrarMensagem(server.enviarDados(message)); // enviar mensagem de conexao realizada
		// habilitar campo para receber mensagens
		this.setCampoEditavel(true);
		do // processando mensagens recebidas do cliente
		{
			try 
			{
				message = server.lerNovaMensagem(); //ler nova mensagem
				mostrarMensagem("\n" + message);
				if(message.startsWith("CLIENTE -> Enviando o arquivo:")){
					message = server.receberArquivo(this);
					mostrarMensagem("\n" + message);
					
				}
				
			} 
			catch (ClassNotFoundException classNotFoundException) {
				mostrarMensagem("\nObjeto recebido não foi reconhecido!");
			} catch (IOException e) {	
				e.printStackTrace();
			}

		} while (!message.equalsIgnoreCase("CLIENTE -> FIM"));
	} 

	private void setCampoEditavel(final boolean editable) {
		SwingUtilities.invokeLater(new Runnable() {
			public void run(){
				txtCampoMensagem.setEditable(editable);
				btnSendFile.setEnabled(editable);
			}
		} ); 
	} 
	
	
}
