<?php
	header( 'Cache-Control: no-cache' );
	header( 'Content-type: application/xml; charset="utf-8"', true );

	$con = mysql_connect('ystallonne.db.7765833.hostedresource.com', 'ystallonne', 'AmClJoRaYs2012') ;
	mysql_select_db('ystallonne', $con);
	
	if(is_numeric($_REQUEST['idRota'])){
		
		$idRota = mysql_real_escape_string($_REQUEST['idRota']);
		$idDirecao = mysql_real_escape_string($_REQUEST['idDirecao']);
		$idUsuario = mysql_real_escape_string($_REQUEST['idUsuario']);
		$latitude = mysql_real_escape_string($_REQUEST['latitude']);
		$longitude = mysql_real_escape_string($_REQUEST['longitude']);
		$status =  "Operando";
		$time = date('Y-m-d h:i:s');
		$horaSaida = date('Y-m-d h:i:s');

		mysql_query("UPDATE geolocalizacao SET latitude = '$latitude', longitude = '$longitude', time = '$time' WHERE idUsuario = $idUsuario");
//		echo "INSERT INTO geolocalizacao (idRota, idDirecao, latitude, longitude, status, time) VALUES ($idRota, $idDirecao, '$latitude', '$longitude', '$status', '$time')";
		echo ("UPDATE geolocalizacao SET latitude = '$latitude', longitude = '$longitude', time = '$time' WHERE idUsuario = $idUsuario");
	}
?>