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
        <title>Novo Saque</title>
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
                <h3>Detalhes da conta <small>${conta.getAgencia()} / ${conta.getNumero()}</small></h3>
            </div>
            <ol class="breadcrumb">
                <li>Saldo atual: ${conta.getSaldo()}</li>
            </ol>
        </section>
        <section class="container-fluid col-lg-8 col-lg-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="padding-top: 7.5px;"><strong>Novo saque</strong></h3>
                </div>
                <div class="panel-body">
                    <form action="sacarDinheiroDaConta" method="POST">
                        <div class="form-group">
                            <label for="inputValorASacar">Valor a sacar</label>
                            <input type="number" class="form-control" name="valor" min="1" max="${conta.getSaldo()}" id="inputValorASacar" placeholder="o valor será debitado do saldo atual">
                        </div>
                        <button class="btn btn-primary" type="submit">Sacar</button>
                    </form>
                </div>                
            </div>
        </section>
    </body>
</html>
