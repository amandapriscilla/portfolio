package br.ufrn.poo.cliente.gui;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.EOFException;
import java.io.IOException;

import javax.swing.*;

import br.ufrn.poo.cliente.dominio.Arquivo;
import br.ufrn.poo.cliente.dominio.Cliente;



public class TelaCliente extends JFrame{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		JFrame.setDefaultLookAndFeelDecorated(true);
		TelaCliente tela = new TelaCliente();
		tela.setLocation(550, 400);
		tela.setDefaultCloseOperation(EXIT_ON_CLOSE);
		tela.run();

	}
	
	// Tela de Cliente
	
	private Cliente cliente = Cliente.getInstance();
	private JTextField txtCampoMensagem;  
	private JTextArea txtDadosArea; 
	private JFileChooser fileChooser;
	private JButton btnSendFile;
	
	
	
	public TelaCliente() {
		super("Cliente");
		txtDadosArea = new JTextArea();
		txtCampoMensagem = new JTextField(); 	
		txtCampoMensagem.setEditable(false);
		txtCampoMensagem.addActionListener(new ActionListener() {
			// send message to server
			public void actionPerformed(ActionEvent event) {
				String mensagem = cliente.enviarDados(event.getActionCommand());
				if(mensagem.startsWith(" \nErro")){ 	
					mostrarMensagem(mensagem);
				}else txtDadosArea.append(mensagem);
				txtCampoMensagem.setText("");

			} 
		} ); 

		add(txtCampoMensagem, BorderLayout.NORTH);

		
		add(new JScrollPane(txtDadosArea), BorderLayout.CENTER);
		
		btnSendFile = new JButton();
		btnSendFile.setText("Enviar Arquivo");
		btnSendFile.setToolTipText("Procure e envie um arquivo local para a máquina cliente");

		btnSendFile.addActionListener(new ActionListener() {
			// o metodo abaixo envia uma mensagem para o cliente
			public void actionPerformed(ActionEvent event) {
				fileChooser = new JFileChooser();
				fileChooser.setDialogTitle("CLIENTE -> Escolha o arquivo  a ser enviado:");
				int returnVal = fileChooser.showOpenDialog(TelaCliente.this);
			    if(returnVal == JFileChooser.APPROVE_OPTION) {
			    	Arquivo arquivo = new Arquivo(fileChooser.getSelectedFile());
			    	// ENVIA MENSAGEM AVISANDO ENVIO DE ARQUIVO
			    	String mensagem = cliente.enviarDados("Enviando o arquivo: "+arquivo.getFilename());
					if(mensagem.startsWith(" \nErro")){ 	
						mostrarMensagem(mensagem);
					}else txtDadosArea.append(mensagem);
			    	String statusEnvio = cliente.enviarArquivo(arquivo);
			    	
			    	mostrarMensagem(cliente.enviarDados(statusEnvio));
			    
			    	
	        } else {
	        	mostrarMensagem("Erro: Arquivo não enviado.");
	        }		
			}

		} );

		btnSendFile.setEnabled(false);
		
		this.add(btnSendFile, BorderLayout.SOUTH);
		
		setSize(300, 400);
		setVisible(true);
	} 



// METODO EXECUTAR

	private void run() {
		String ip = JOptionPane.showInputDialog("Digite o endereço IP da outra máquina destino ou deixe em branco para executar localmente: ");
		
		if(!(ip.equals("localhost")))
			if(ip == null  || ip.equals("")) ip = "localhost";

		
		cliente.passarNomeServidor(ip);
		
		// Cliente tenta conectar-se ao servidor
		try 
		{
			while (true) {
				try {
					mostrarMensagem("Tentando conectar...\n");
					String mensagem = cliente.conectarServidor();
					mostrarMensagem(mensagem);
					mostrarMensagem(cliente.getStreams());
					processaConexao(); // processa conexao
				} 
				catch (EOFException eofException) {
					mostrarMensagem("\nCliente encerrou a conexão");
				} 
				finally {
					mostrarMensagem("\nEncerrando conexão\n");
					this.setCampoEditavel(false);
					
					cliente.fecharConexao();
				} 
			} 
		} 
		catch (IOException ioException) {
			ioException.printStackTrace();
		} 	
		
	}
	
	
	private void processaConexao() {
		String message = "Conectado com sucesso!";
		mostrarMensagem(cliente.enviarDados(message)); // enviar mensagem de conexao realizada
		// habilitar campo para receber mensagens
		this.setCampoEditavel(true);
		do // processando mensagens recebidas do cliente
		{
			try 
			{
				message = cliente.lerNovaMensagem(); //ler nova mensagem
				mostrarMensagem("\n" + message); 
				if(message.startsWith("SERVIDOR -> Enviando o arquivo:")){
					message = cliente.receberArquivo(this);
					mostrarMensagem("\n" + message);
					
				}
			} 
			catch (ClassNotFoundException classNotFoundException) {
				mostrarMensagem("\nObjeto recebido não foi reconhecido!");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} while (!message.equalsIgnoreCase("SERVIDOR -> ENCERRADO"));
		
	}





	private void mostrarMensagem(final String mensagem) {
		SwingUtilities.invokeLater(new Runnable() {
			public void run(){
				txtDadosArea.append(mensagem); // escreve mensagem no campo
			} 
		} );
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
