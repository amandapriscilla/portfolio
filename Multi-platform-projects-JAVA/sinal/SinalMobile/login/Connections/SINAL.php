<?php
# FileName="Connection_php_mssql.htm"
# Type="MSSQL"
# HTTP="true"
$hostname_SINAL = "sinal.db.9068705.hostedresource.com";
$database_SINAL = "sinal";
$username_SINAL = "sinal";
$password_SINAL = "AmClJoRaYs2011";
$SINAL = mssql_pconnect($hostname_SINAL, $username_SINAL, $password_SINAL) or trigger_error("Falha ao conectar-se com o banco de dados.",E_USER_ERROR);
?>