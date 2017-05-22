<%-- 
    Document   : PainelDoCliente
    Created on : 20/05/2017, 14:30:14
    Author     : Faculdade Alfa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Painel</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li>Olá, ${cliente.nome}</li>
            <li class="pull-right"><a href="#">Sair</a></li>
        </ol>
        <ul class="nav nav-tabs">
            <li role="presentation"><a href="painelDoCliente">Histórico de operações</a></li>
            <li role="presentation" class="active"><a>Contas</a></li>
        </ul>
        <section class="container-fluid">
            <c:if test="${not empty contasEncontradas}">
                <div class="list-group">
                    <c:forEach var="conta" items="${contasEncontradas}" varStatus="i">
                        <a href="selecionarConta?id=${i.index}" class="list-group-item">
                            ${conta.getAgencia()} / ${conta.getNumero}
                        </a>
                    </c:forEach>                    
                </div>               
            </c:if>
            <c:if test="${empty contasEncontradas}">
                <h3><small>Nenhuma conta foi localizada.</small></h3>   
            </c:if>
        </section>
    </body>
</html>
