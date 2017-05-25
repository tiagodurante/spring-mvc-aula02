<%-- 
    Document   : DetalhesDaConta
    Created on : 24/05/2017, 13:58:58
    Author     : tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Detalhes da conta</title>
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
        <br>
        <section class="container-fluid col-lg-8 col-lg-offset-2">
            <div class="page-header">
                <h3>Detalhes da conta <small>${conta.getAgencia()} / ${conta.getNumero()}</small>
                    <span class="pull-right"><div class="btn-group" role="group" aria-label="...">
                            <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Depósito</button>
                            <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Saque</button>
                        </div></span></h3>
            </div>
            <ol class="breadcrumb">
                <li>Saldo atual: ${conta.getSaldo()}</li>
            </ol>
        </section>
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
