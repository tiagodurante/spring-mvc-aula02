<%-- 
    Document   : ListaDeClientesView
    Created on : 20/05/2017, 13:17:27
    Author     : Faculdade Alfa
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Lista de clientes (para teste)</title>
    </head>
    <body class="container-fluid">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="page-header">
                <h1>Clientes cadastrados
                    <span class="pull-right">
                        <div class="btn-group" role="group" aria-label="...">
                            <button class="btn btn-primary" onclick="window.location.href = 'novoCadastroDeCliente'">Novo Cliente</button>
                            <button class="btn btn-warning" onclick="window.location.href = 'depositoSemConta'">Novo Depósito Sem Cartão</button>
                        </div>
                    </span>
                </h1>      
            </div>        
            <c:if test="${not empty clientesCadastrados}">
                <table class="table table-bordered">
                    <thead>
                    <th class="col-lg-2">#ID</th>
                    <th class="col-lg-8">Nome</th>
                    <th class="col-lg-2">Opções</th>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${clientesCadastrados}" varStatus="i">
                            <tr>
                                <td class="col-lg-2">${cliente.getId()}</td>
                                <td class="col-lg-8">${cliente.getNome()} ${cliente.getSobrenome()}</td>
                                <td class="col-lg-2"><button type="button" class="btn btn-primary btn-xs" onclick="window.location.href = 'selecionarCliente?id=${i.index}'">Selecionar</button><button type="button" class="btn btn-danger btn-xs" onclick="window.location.href = 'excluirCliente?id=${i.index}'">Excluir</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty clientesCadastrados}">
                <h3>Nenhum cliente foi cadastrado até o momento. <a href="novoCadastroDeCliente">Toque aqui</a> para cadastrar</h3> 
            </c:if>
        </div>

    </body>
</html>
