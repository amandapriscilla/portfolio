package infinith.sinal.beans;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import infinith.sinal.beans.ConsultarHorarioBean;
import infinith.sinal.dao.GenericDAO;
import infinith.sinal.dao.GeoreferenciaDAO;
import infinith.sinal.interfaces.IConsultarHorarioLocal;
import infinith.sinal.interfaces.IGenericDAO;
import infinith.sinal.modelo.Geolocalizacao;
import infinith.sinal.modelo.Georeferencia;



@Stateless 
public class ConsultarHorarioBean implements IConsultarHorarioLocal {
	@PersistenceContext(unitName="sinal") 
	EntityManager em;
	private int distance = -1; // Distancia entre dois pontos em metros
	private double duration = -1; // Tempo de viagem em segundos
	private int minutes = -1; // Tempo de viagem em minutos
	
	public ConsultarHorarioBean(){}
	
	
	public int getMinutos(){
		return minutes;
	}
	
	public int getDistancia(){
		return distance;
	}
	
	/**
	 * 	METODO QUE CALCULA O TEMPO DE ESPERA DE UM VEICULO	
	 */
	@Override
	public int calcularTempoEspera(int idDirecao, int idParada) {
		// TODO Auto-generated method stub
		distance = -1; // Distancia entre dois pontos em metros
		duration = -1; // Tempo de viagem em segundos
		minutes = -1; // Tempo de viagem em minutos

		
		
		
		GeoreferenciaDAO gdao = new GeoreferenciaDAO(em);
		Georeferencia p = gdao.getGeoreferenciaById(idParada);
		
		
		IGenericDAO dao = new GenericDAO(em);
		int menorDistancia = -1;
		int menorTempo = -1;
		
		// Traz lista de geolocalizacoes ativas e verifica o ponto registrado mais proximo do usuário
		try{
			List<Geolocalizacao> posicoes = (List<Geolocalizacao>) dao.findAll(Geolocalizacao.class, "direcao", idDirecao);
			//Posicao do veiculo mais proximo da parada do cliente
			Geolocalizacao proxVeicPos = null;
			for (Geolocalizacao ponto : posicoes) {
			this.getInfoGoogleMaps(Double.parseDouble(ponto.getLatitude()), Double.parseDouble(ponto.getLongitude()), p.getLatitude(), p.getLongitude());
			
			if(proxVeicPos == null){ 
				proxVeicPos = ponto;
				menorDistancia = this.getDistancia();
				menorTempo = this.getMinutos();
			}
			else
				if(this.getDistancia()<menorDistancia){
					menorDistancia = this.getDistancia();
					menorTempo = this.getMinutos();
					proxVeicPos = ponto;
					System.out.println("Distancia: "+menorDistancia+" Ponto:"+ponto.getLatitude()+" "+ponto.getLongitude());
				}
			
			}
			System.out.println(proxVeicPos.getLatitude() +" OK "+ proxVeicPos.getLongitude());

		}catch (Exception e) {
			System.out.println(e.getStackTrace());
			System.out.println(e.getMessage());
		}
							
		 System.out.println("ATENCAOOOOO: distancia = " +  menorDistancia+ " minutos: "+ menorTempo);
			

		return menorTempo;
	}

	

	




/**
 * 	METODO QUE USA GOOGLEMAPS pra retornar distancia e tempo entre dois pontos	
 */	
	public void getInfoGoogleMaps(double latitude, double longitude, double latitudePto, double longitudePto){  
		String str = "";
		String origem = latitude+ ","+longitude;
		String destino = latitudePto+ ","+longitudePto;
		URL url;
		minutes = -1; distance = -1;
		try {
			url = new URL("http://maps.googleapis.com/maps/api/directions/json?origin="+origem+"&destination="+destino+"&sensor=false");
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			while (in.ready()) {
                str = in.readLine();
                System.out.println("JSON: "+str);
                if(str.contains("distance")){
                	str = in.readLine();
                	str = in.readLine().replace("\"value\"", "");
                	str = str.replace(":", "").trim();
                	System.out.println(str);
                	distance = Integer.parseInt(str);
                }
                if(str.contains("duration")){
                	str = in.readLine();
                	str = in.readLine().replace("\"value\"", "");
                	str = str.replace(":", "").trim();
                	System.out.println(str);
                	minutes = (int)(Double.parseDouble(str)/60);
                	break;
                }
            }
            in.close();
  
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} // URL de pesquisa no Google Maps
 catch (IOException e) {
			e.printStackTrace();
		}
		if(minutes == -1 || distance == -1) this.getCalculoAproximado(latitude, longitude, latitudePto, longitudePto);
	}

	
	
	/**
	 * METODO PARA QUANDO A API DO GOOGLE ESTIVER SEM ACESSO 
	 */
	public void getCalculoAproximado(double latitude, double longitude, double latitudePto, double longitudePto){  
    	double dlon, dlat,  distancia; 
    	dlat = (latitudePto - latitude) * 60 * 1852 ;
		dlon = (longitudePto - longitude)* 60 *1852 ;
		
		distancia = Math.sqrt(dlat * dlat + dlon * dlon);
		distance = (int) distancia;
		duration = (int) distancia/12;
		minutes = (int) duration / 60;
		System.out.println(duration+" segundos");
	}

	
}
