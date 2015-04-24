package br.ufrn.poo.dominio;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.prefs.Preferences;

import javax.swing.JFileChooser;
import javax.swing.JFrame;

import br.ufrn.poo.exception.OperacaoCanceladaException;

public class Arquivo implements Serializable {
	private String filename;
	private File file;


	public Arquivo() {
		super();
	}

	public Arquivo(File file) {
		super();	
		this.setFile(file);
		this.filename = file.getName();
	}


	/*** Método de recebimento do ObjectInputStream do socket
	 * @param in
	 * @param tela 
	 * @throws IOException 
	 * @throws OperacaoCanceladaException */
	public void receberArquivo(ObjectInputStream in, JFrame tela) throws IOException, OperacaoCanceladaException{
		//Recebendo o nome do arquivo
		filename = in.readUTF();
		System.out.println(filename);
		   
        // persisted in registry directory last used
        Preferences userPrefs = Preferences.userRoot();

        File suggestedFile = new File ( userPrefs.get( "SAVEDIR", "C:" ), filename );

        JFileChooser fc = new JFileChooser();
        fc.setSelectedFile( suggestedFile );
        fc.setDialogTitle("Salvar arquivo recebido em:");
        int result = fc.showSaveDialog(tela);
        switch ( result )
           {
           case JFileChooser.APPROVE_OPTION:
              // Recebendo o local de destino e salvando como padrão
        	  file = fc.getSelectedFile();
        	  userPrefs.put( "SAVEDIR",  fc.getCurrentDirectory().getAbsolutePath() );
        	  
              
              break;
           case JFileChooser.CANCEL_OPTION:         	   								
           case JFileChooser.ERROR_OPTION:
        	   throw new OperacaoCanceladaException("O recebimento de arquivo foi cancelado!");
       	  
           default:
           }

        FileOutputStream out = new FileOutputStream(file);  
        System.out.println(file.getAbsolutePath());
        
     // Alocando byte a byte até completar o arquivo
        int tamanho = 4096; // buffer de 4KB    
        byte[] buffer = new byte[tamanho]; 
        int lidos = -1;    
        while (true) {
        	lidos = in.read(buffer);
        	if(lidos == -1) break;
            out.write(buffer, 0, lidos);    
            System.out.println("Buffer Server: "+lidos);
        }
        out.flush();

     }
	
	
	/*** Método de envio do OutputStream do socket
	 * @throws IOException */
	public void enviarArquivo(ObjectOutputStream out) throws IOException{
		// Preparando o arquivo do objeto para ser enviado
        
        FileInputStream input = new FileInputStream(file);  
        filename = file.getName();
        
        out.writeUTF(filename);
        out.flush();
        
        int tamanho = 4096; // buffer de 4KB    
        byte[] buffer = new byte[tamanho]; 
        int lidos = -1;    
        while (true) {
        	lidos = input.read(buffer);
        	if(lidos == -1) break;
            out.write(buffer, 0, lidos);
            System.out.println("Buffer Client: "+lidos);
        }
        out.flush();   
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
		this.filename = file.getName();
	}
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}

	
}
