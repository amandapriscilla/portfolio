<%@ page session="true" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<meta name="keywords" content="SINAL, Transportes, Pontuais, Infinith, Systems" />
    <link rel="stylesheet" href="css/normalize.css"/>
	<link rel="stylesheet" href="css/all.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="fontes/fontes.css" type="text/css" charset="utf-8"/>
	<link rel="icon" href="imagens/Sinal.ico" type="image/x-icon"/>

<!--<link rel="stylesheet" href="fontes/fontes.css" type="text/css" charset="utf-8"/>
<link rel="icon" href="images/Sinal.ico" type="image/x-icon"/>
<link href="sinal.css" rel="stylesheet" type="text/css"/>-->
<title>SINAL | Transportes Pontuais</title><%
if (session.getAttribute("nome") == null){
	pageContext.forward("/login.jsp");
}
%>