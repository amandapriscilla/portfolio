<?php require_once('../Connections/SINAL.php'); ?>
<?php
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mssql_real_escape_string") ? mssql_real_escape_string($theValue) : mssql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}

function encerrarViagem(){
if ((isset($_SESSION['idFuncionario'])) && ($_SESSION['idFuncionario'] != "")) {
  $deleteSQL = sprintf("DELETE FROM geolocalizacao WHERE idFuncionario=%s",
                       GetSQLValueString($_SESSION['idFuncionario'], "int"));

  mssql_select_db($database_SINAL, $SINAL);
  $Result1 = mssql_query($deleteSQL, $SINAL) or die("Falha ao conectar-se com o banco de dados.");

  $deleteGoTo = "painel.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $deleteGoTo .= (strpos($deleteGoTo, '?')) ? "&" : "?";
    $deleteGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $deleteGoTo));
}
}

// Incluindo arquivo de conexão/configuração
require_once('config/conn.php');

// Instanciando novo objeto da classe Login
$objLogin = new Login();

// Verificando se o usuário está logado, caso contrário será redirecionado para a página de login
if (!$objLogin->verificar('index.html'))
    // Finalizado o script, apenas para garantir que o usuário irá ver o conteúdo da página
    exit;

// Selecionando informações do usuário
$query = mssql_query("SELECT * FROM funcionario WHERE idFuncionario = {$objLogin->getID()}");
$usuario = mssql_fetch_object($query);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- 
    Mobile.html by Infinith Systems
-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="keywords" content="SINAL, Transportes, Pontuais, Infinith, Systems" />
<title>SINAL - Transportes Pontuais | Módulo de Geolocalização</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%
}
body {
	height: 100%;
	margin: 0px;
	padding: 0px
}
#map_canvas {
	height: 50%;
	width: 100%
}
div#Latitute_Logitude {
	border-top: 2px solid black;
}
div#ft p {
	width: 500px;
	margin: 1em auto;
}
</style>
<script src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
		  google.load('jquery', '1.3');
</script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
        var watchID;
        var geo;    	// objeto geolocalização
        var map;    	// objeto google map
        var mapMarker;  // objeto do marcador de localização do google map

        // Opções de posicionamento
        var MAXIMUM_AGE = 200; // milisegundos
        var TIMEOUT = 3000000;
        var HIGHACCURACY = true;

        // Verificação de suporte para geolocalização
		function getGeoLocation() {
            try {
                if( !! navigator.geolocation ) return navigator.geolocation;
                else return undefined;
            } catch(e) {
                return undefined;
            }
        }

        function show_map(position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;
            var latlng = new google.maps.LatLng(lat, lon);
            if(map) {
                map.panTo(latlng);
                mapMarker.setPosition(latlng);
            } else {
                var myOptions = {
                    zoom: 18,
                    center: latlng,

                    // mapTypeID: ROADMAP, SATELLITE, HYBRID ou TERRAIN.
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                map.setTilt(0); // Desabilita a visualização padrão de 45 graus

                mapMarker = new google.maps.Marker({
                    position: latlng,
                    title:"Você está aqui."
                });
                mapMarker.setMap(map);
				
				 var currentLatLon = map.getCenter();
		         updateLatLonFields(currentLatLon.lat(), currentLatLon.lng());
            }
        }

        function geo_error(error) {
            stopWatching();
            switch(error.code) {
                case error.TIMEOUT:
                    alert('Seção encerrada');
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert('Geolocalização indisponível');
                    break;
                case error.PERMISSION_DENIED:
                    alert('Permissão para verificar geolocalização negada');
                    break;
                default:
                    alert('Geolocalizador retornou um código de erro desconhecido: ' + error.code);
            }
        }
		
		function updateLatLonFields(lat, lon) {
			document.getElementById("latitude").innerHTML = lat;
			document.getElementById("longitude").innerHTML = lon;
		}

        function stopWatching() {
            if(watchID) geo.clearWatch(watchID);
            watchID = null;
        }

        function startWatching() {
            watchID = geo.watchPosition(show_map, geo_error, {enableHighAccuracy: HIGHACCURACY, maximumAge: MAXIMUM_AGE, timeout: TIMEOUT});
        }
		
		function inserirLatLon(){
			var latitude = $("#latitude").html();
			var longitude =  $("#longitude").html();
			if (latitude != "" && longitude != ""){
			$.get('inserirLatLon.php?idRota=' + <?php echo $_GET['idRota']; ?> + '&idDirecao=' + <?php echo $_GET['idDirecao']; ?> + '&idFuncionario=' + <?php echo $objLogin->getID() ?> + '&latitude=' + latitude + '&longitude=' + longitude);
			//window.setTimeout(verificarGeolocalidade(), 5000);
			}
		}
		
		//window.setTimeout(verificarGeolocalidade(), 5000);

        window.onload = function() {
            if((geo = getGeoLocation())) {
                startWatching();
            } else {
                alert('Inexistência de suporte para geolocalização.')
            }
			var intervalo = window.setInterval(inserirLatLon, 5000);
        }
    </script>
</head>
<body>
<div id="map_canvas"></div>
<div>Você está aqui:</div>
 <fieldset>
  <legend>Você está aqui</legend>
  <div id="Latitute_Logitude">
  <p><strong>Latitude:</strong> <span id="latitude"></span></p>
  <p><strong>Longitude:</strong> <span id="longitude"></span></p>
</div>
<form id="form1" name="form1" method="post" action="">
 
  <input type="submit" name="Encerrar" id="Encerrar" value="Encerrar" tabindex="1" />
  
</form>
</fieldset>
</body>
</html>