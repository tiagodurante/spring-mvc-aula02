<%-- 
    Document   : DetallhesDaConta
    Created on : 24/05/2017, 13:21:55
    Author     : tiago
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes de conta</title>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Nova conta</h3>
                </div>
                <div class="panel-body">
                    <form action="salvarConta" method="POST">
                        <div class="form-group">
                            <label for="inputAgencia">Agência</label>
                            <input type="number" class="form-control" name="agencia" id="inputAgencia" placeholder="agência">
                        </div>
                        <div class="form-group">
                            <label for="inputNumeroDaConta">Numero da conta</label>
                            <input type="number" class="form-control" name="numero" id="inputNumeroDaConta" placeholder="numero da conta">
                        </div>
                        <button type="submit" class="btn btn-primary">Salvar</button>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>
