<%-- 
    Document   : DetalhesDaConta
    Created on : 24/05/2017, 13:58:58
    Author     : tiago
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <li class="pull-right"><a href="sairDaConta">Sair</a></li>
        </ol>
        <ul class="nav nav-tabs">
            <li role="presentation"><a href="painelDoCliente">Histórico de operações</a></li>
            <li role="presentation" class="active"><a href="painesDeContas">Contas</a></li>
        </ul>
        <br>
        <section class="container-fluid col-lg-8 col-lg-offset-2">
            <div class="page-header">
                <h3>Detalhes da conta <small>${conta.getAgencia()} / ${conta.getNumero()}</small>
                    <span class="pull-right"><div class="btn-group" role="group" aria-label="...">
                            <button type="button" onclick="window.location.href='novoDepositoNaConta'" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Depósito</button>
                            <button type="button" onclick="window.location.href='novoSaqueNaConta'" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Saque</button>
                        </div></span></h3>
            </div>
            <ol class="breadcrumb">
                <li>Saldo atual: ${conta.getSaldo()}</li>
            </ol>
        </section>
        <section class="container-fluid col-lg-8 col-lg-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="padding-top: 7.5px;">Operações</h3>
                </div>
                <c:if test="${not empty operacoesEncontradas}">
                    <table class="table table-striped">
                        <thead>
                        <th class="col-lg-3">
                            ID
                        </th>
                        <th class="col-lg-3">
                            Tipo
                        </th>
                        <th class="col-lg-2">
                            Saldo anterior
                        </th>
                        <th class="col-lg-2">
                            Valor
                        </th>
                        <th class="col-lg-2">
                            Saldo
                        </th>
                        </thead>
                        <tbody>
                            <c:forEach var="operacao" items="${operacoesEncontradas}" varStatus="i">
                                <tr>
                                    <td class="col-lg-3">${operacao.getId()}</td>
                                    <td class="col-lg-3">${operacao.getTipo()}</td>
                                    <td class="col-lg-2">${operacao.getSaldoAnterior()}</td>
                                    <td class="col-lg-2">${operacao.getValor()}</td>
                                    <td class="col-lg-2">${operacao.getSaldoAtual()}</td>
                                </tr>
                        </c:forEach>  
                        </tbody>
                    </table>           
                </c:if>
                <c:if test="${empty operacoesEncontradas}">
                    <div class="panel-body text-center">
                        <h3><small>Nenhuma operação foi realizada.</small></h3>  
                    </div>
                </c:if>
            </div>
        </section>
    </body>
</html>