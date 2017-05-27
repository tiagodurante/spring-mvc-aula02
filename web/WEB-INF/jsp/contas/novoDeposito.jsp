<%-- 
    Document   : novoSaque
    Created on : 25/05/2017, 13:13:58
    Author     : tiago
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Novo Depósito</title>
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
                    <h3 class="panel-title pull-left" style="padding-top: 7.5px;"><strong>Novo depósito</strong></h3>
                </div>
                <div class="panel-body">
                    <form action="depositarDinheiroDaConta" method="POST">
                        <div class="form-group">
                            <label for="inputValorADepositar">Valor a depositar</label>
                            <input type="number" class="form-control" name="valor" min="1" id="inputValorADepositar" placeholder="valor a ser depositado na conta">
                        </div>
                        <button class="btn btn-primary" type="submit">Depositar</button>
                    </form>
                </div>                
            </div>
        </section>
    </body>
</html>
