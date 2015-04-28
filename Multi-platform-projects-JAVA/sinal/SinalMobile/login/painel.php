<?php require_once('Connections/SINAL.php'); ?>
<?php require_once('Connections/SINAL.php'); ?>
<?php
// Incluindo arquivo de conexão/configuração
require_once('config/conn.php');

// Instanciando novo objeto da classe Login
$objLogin = new Login();

// Verificando se o usuário está logado, caso contrário será redirecionado para a página de login
if (!$objLogin->verificar('index.html'))
    // Finalizado o script, apenas para garantir que o usuário irá ver o conteúdo da página
    exit;

// Selecionando informações do usuário
$query = mysql_query("SELECT * FROM usuario WHERE usuario_id = {$objLogin->getID()}");
$usuario = mysql_fetch_object($query);


if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

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
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
  $insertSQL = sprintf("INSERT INTO geolocalizacao (idRota, idDirecao, idVeiculo, idUsuario, status, time, horaSaida) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                       GetSQLValueString($_POST['idRota'], "int"),
                       GetSQLValueString($_POST['direcao'], "int"),
                       GetSQLValueString($_POST['veiculo'], "int"),
					   GetSQLValueString($objLogin->getID(), "int"),
					   GetSQLValueString("Operando", "text"),
					   GetSQLValueString(date('Y-m-d h:i:s'), "date"),
					   GetSQLValueString(date('Y-m-d h:i:s'), "date"));

  mysql_select_db($database_SINAL, $SINAL);
  $Result1 = mysql_query($insertSQL, $SINAL) or die(mysql_error());

  $insertGoTo = ("moduloGeolocalizador.php?&idRota=" . ($_POST['idRota']) . "&idDirecao=" . ($_POST['idRota']));
  if (isset($_SERVER['QUERY_STRING'])) {
    $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
    $insertGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $insertGoTo));
}

if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

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
}

mysql_select_db($database_SINAL, $SINAL);
$query_Rotas = "SELECT idRota, nome FROM rota ORDER BY nome ASC";
$Rotas = mysql_query($query_Rotas, $SINAL) or die(mysql_error());
$row_Rotas = mysql_fetch_assoc($Rotas);
$totalRows_Rotas = mysql_num_rows($Rotas);

mysql_select_db($database_SINAL, $SINAL);
$query_Direcoes = "SELECT direcao.direcao FROM direcao, rota WHERE direcao.idRota = rota.idRota ORDER BY direcao.direcao";
$Direcoes = mysql_query($query_Direcoes, $SINAL) or die(mysql_error());
$row_Direcoes = mysql_fetch_assoc($Direcoes);
$totalRows_Direcoes = mysql_num_rows($Direcoes);

mysql_select_db($database_SINAL, $SINAL);
$query_Veiculos = "SELECT veiculo.idVeiculo, veiculo.placa FROM veiculo";
$Veiculos = mysql_query($query_Veiculos, $SINAL) or die(mysql_error());
$row_Veiculos = mysql_fetch_assoc($Veiculos);
$totalRows_Veiculos = mysql_num_rows($Veiculos);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Painel do usuário logado</title>
<style type="text/css">
*, html {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}
a {
	color: #0099CC;
}
body {
	margin: 10px;
}
.carregando {
	color:#666;
	display:none;
}
</style>
<script src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
		  google.load('jquery', '1.3');
</script>
<script type="text/javascript">
		$(function(){
			$('#idRota').change(function(){
				if($(this).val()) {
					$('#direcao').hide();
					$('.carregando').show();
					$.getJSON('direcao.php?idRota=',{idRota: $(this).val(), ajax: 'true'}, function(j){
						var options = '<option value="">-- Escolha uma direção --</option>';
						for (var i = 0; i < j.length; i++) {
							options += '<option value="' + j[i].idDirecao + '">' + j[i].direcao + '</option>';
							if ( j[i].idDirecao == "0"){
								document.getElementById("Iniciar").disabled = true;
							} else {
								document.getElementById("Iniciar").disabled = false;
							}
						}	
						$('#direcao').html(options).show();
						$('.carregando').hide();
					});
				} else {
					$('#direcao').html('<option value="">– Escolha uma direção –</option>');
				}
				
			});
		});
</script>
</head>
<body>
<h1>SINAL</h1>
<p>Bem vindo, <strong><?php echo $usuario->nome; ?></strong></p>
<!--
<p>&nbsp;</p>
<p>Informações da sessão: </p>
<ul>
  <li><strong>ID:</strong> <?php echo $objLogin->getID() ?></li>
  <li><strong>Login:</strong> <?php echo $objLogin->getLogin() ?></li>
</ul>
-->
<p>&nbsp;</p>
<form name="form1" method="POST" action="<?php echo $editFormAction; ?>">
  <p>
    <label for="Rota"></label>
    <label for="idRota"></label>
    Rota:</p>
  <p>
    <select name="idRota" id="idRota">
    	<option value="0">-- Escolha uma rota --</option>
      <?php
	 
do {  
?>
      <option value="<?php echo $row_Rotas['idRota']?>"><?php echo $row_Rotas['nome']?></option>
      <?php
} while ($row_Rotas = mysql_fetch_assoc($Rotas));
  $rows = mysql_num_rows($Rotas);
  if($rows > 0) {
      mysql_data_seek($Rotas, 0);
	  $row_Rotas = mysql_fetch_assoc($Rotas);
  }
?>
    </select>
  </p>
  <p>
    <label for="direcao"><br>
      Direção:<br>
    </label>
    <span class="carregando">Aguarde, carregando...</span>
    <select name="direcao" id="direcao">
      <option value="">-- Escolha uma direção --</option>
    </select>
  </p>
  <p>&nbsp;</p>
  <p>Veículo:</p>
  <p>
    <select name="veiculo" id="veiculo">
      <option value="">-- Escolha um veículo --</option>
      <?php
do {  
?>
      <option value="<?php echo $row_Veiculos['idVeiculo']?>"><?php echo $row_Veiculos['placa']?></option>
      <?php
} while ($row_Veiculos = mysql_fetch_assoc($Veiculos));
  $rows = mysql_num_rows($Veiculos);
  if($rows > 0) {
      mysql_data_seek($Veiculos, 0);
	  $row_Veiculos = mysql_fetch_assoc($Veiculos);
  }
?>
    </select>
  </p>
  <p>&nbsp; </p>
  <p>
    <input type="submit" name="Iniciar" id="Iniciar" value="Iniciar" disabled="true">
  </p>
  <input type="hidden" name="MM_insert" value="form1">
</form>
<p>&nbsp;</p>
<p><a href="sair.php">Sair</a></p>
</body>
</html>
<?php
mysql_free_result($Rotas);

mysql_free_result($Direcoes);

mysql_free_result($Veiculos);
?>
