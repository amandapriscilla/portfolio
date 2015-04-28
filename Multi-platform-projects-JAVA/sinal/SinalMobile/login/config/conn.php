<?php
// Informações para conexão
$host = 'sinal.db.9068705.hostedresource.com';
$usuario = 'sinal';
$senha = 'AmClJoRaYs2011';
$banco = 'sinal';
// Realizando conexão e selecionando o banco de dados
$conn = mssql_connect($host, $usuario, $senha) or die("Falha ao conectar-se com o banco de dados");
$db = mssql_select_db($banco, $conn) or die("Falha ao conectar-se com o banco de dados");

// Função para carregar a classe automaticamente, quando instanciado o objeto
function __autoload($class)
{
    require_once(dirname(__FILE__) . "/../class/{$class}.class.php");
}
?>