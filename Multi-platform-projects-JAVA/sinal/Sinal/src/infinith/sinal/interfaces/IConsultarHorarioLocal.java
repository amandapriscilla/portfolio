package infinith.sinal.interfaces;


import javax.ejb.Local;

@Local
public interface IConsultarHorarioLocal {
	
	public int calcularTempoEspera(int idDirecao, int idParada); 
	public void getInfoGoogleMaps(double latitude, double longitude, double latitudePto, double longitudePto);
	public int getDistancia();
	public int getMinutos();
}
