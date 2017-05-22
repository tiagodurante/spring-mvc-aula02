<%-- 
    Document   : mensagemCadastro
    Created on : 20/05/2017, 09:06:42
    Author     : Faculdade Alfa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro realizado!</title>
    </head>
    <body>
        <h1>Bem vindo, ${pessoa.nome} ${pessoa.sobrenome}!</h1>
        <p>#${pessoa.id}</p>
        <table cellspacing="10">
            <tr>
                <td>
                    <a href="buscarConta" >Novo saque</a>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" name="saque" value="Novo depósito">
                </td>
            </tr>
        </table>
    </body>
</html>
