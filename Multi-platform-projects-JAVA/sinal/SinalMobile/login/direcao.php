<?php
	header( 'Cache-Control: no-cache' );
	header( 'Content-type: application/xml; charset="utf-8"', true );

	$con = mssql_connect('sinal.db.9068705.hostedresource.com', 'sinal', 'AmClJoRaYs2011') ;
	mssql_select_db('sinal', $con);
	
	
	
function mssql_real_escape_string($s) {
	if(get_magic_quotes_gpc()) {
		$s = stripslashes($s);
	}
	$s = str_replace("'","''",$s);
	return $s;
}
		
	if(is_numeric($_REQUEST['idRota'])){
		$idRota = mssql_real_escape_string($_REQUEST['idRota']);
	
		$direcoes = array();
	
		$sql = "SELECT direcao.idDirecao, direcao.direcao FROM direcao, rota WHERE direcao.idRota = rota.idRota AND direcao.idRota = $idRota";
		$res = mssql_query( $sql );
		if(mssql_num_rows($res) > 0){
			while ($row = mssql_fetch_assoc($res) ) {
				$direcoes[] = array(
					'idDirecao'	=> $row['idDirecao'],
					'direcao' => $row['direcao'],
				);
			}
			echo(json_encode($direcoes));
		} else{
			padrao();
		}
	} else {
		padrao();
	}
	
	function padrao(){
		$direcoes[] = array('idDirecao'	=> "0",'direcao' => "---");
		echo(json_encode($direcoes));
	}
?>