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
            <li class="pull-right"><a href="sairDaConta">Sair</a></li>
        </ol>
        <ul class="nav nav-tabs">
            <li role="presentation"><a href="painelDoCliente">Histórico de operações</a></li>
            <li role="presentation" class="active"><a href="painesDeContas">Contas</a></li>
        </ul>
        <br>
        <section class="container-fluid col-lg-8 col-lg-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="padding-top: 7.5px;">Minhas contas</h3>
                    <span class="pull-right" title="Nova conta">
                        <button class="btn btn-default" onclick="window.location.href='novaConta'">
                            <i class="glyphicon glyphicon-plus"></i>
                        </button>
                    </span>
                </div>
                <c:if test="${not empty contasEncontradas}">
                    <div class="list-group">
                        <c:forEach var="conta" items="${contasEncontradas}" varStatus="i">
                            <a href="selecionarConta?id=${i.index}" class="list-group-item">
                                ${conta.getAgencia()} / ${conta.getNumero()}
                            </a>
                        </c:forEach>                    
                    </div>               
                </c:if>
                <c:if test="${empty contasEncontradas}">
                    <div class="panel-body text-center">
                        <h3><small>Nenhuma conta foi localizada.</small></h3>  
                    </div>
                </c:if>
            </div>
        </section>
    </body>
</html>
