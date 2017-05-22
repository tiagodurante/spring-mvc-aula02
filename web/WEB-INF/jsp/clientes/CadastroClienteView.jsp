<%-- 
    Document   : CadastroClienteView
    Created on : 20/05/2017, 13:41:07
    Author     : Faculdade Alfa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo cadastro de clientes</title>
    </head>
    <body class="container-fluid">
        <div class="page-header">
            <h1>Cadastro de cliente<small> Novo objeto</small></h1>
        </div>
        <form method="POST" action="salvarCadastroDeCliente">
            <div class="form-group">
                <label for="inputNome">Nome</label>
                <input type="text" class="form-control" name="nome" id="inputNome" placeholder="primeiro nome">
            </div>
            <div class="form-group">
                <label for="inputSobrenome">Sobrenome</label>
                <input type="text" class="form-control" name="sobrenome" id="inputSobrenome" placeholder="ultimo nome">
            </div>
            <div class="form-group">
                <label for="inputDataDeNascimento">Data de nascimento</label>
                <input type="text" class="form-control" name="nascimento" id="inputDataDeNascimento" placeholder="data de nascimento">
            </div>
            <div class="form-group">
                <label for="inputRG">RG</label>
                <input type="text" class="form-control" name="rg" id="inputRG" placeholder="rg">
            </div>
            <div class="form-group">
                <label for="inputCPF">CPF</label>
                <input type="text" class="form-control" name="cpf" id="inputCPF" placeholder="cpf">
            </div>
            <hr>
            <h3><small>Endereço</small></h3>
            <div class="form-group">
                <label for="inputRua">Rua</label>
                <input type="text" class="form-control" name="rua" id="inputRua" placeholder="rua">
            </div>
            <div class="form-group">
                <label for="inputNumero">Numero</label>
                <input type="text" class="form-control" name="numero" id="inputNumero" placeholder="numero da casa">
            </div>
            <div class="form-group">
                <label for="inputBairro">Bairro</label>
                <input type="text" class="form-control" name="bairro" id="inputBairro" placeholder="bairro">
            </div>
            <div class="form-group">
                <label for="inputCidade">Cidade</label>
                <input type="text" class="form-control" name="cidade" id="inputCidade" placeholder="cidade">
            </div>
            <div class="form-group">
                <label for="inputCep">CEP</label>
                <input type="text" class="form-control" name="cep" id="inputCep" placeholder="cep">
            </div>
            <hr>
            <h3><small>Informações de login</small></h3>
            <div class="form-group">
                <label for="inputEmail">E-mail</label>
                <input type="email" class="form-control" name="email" id="inputEmail" placeholder="email">
            </div>
            <div class="form-group">
                <label for="inputLogin">Login</label>
                <input type="email" class="form-control" name="login" id="inputLogin" placeholder="login">
            </div>
            <div class="form-group">
                <label for="inputSenha">Senha</label>
                <input type="password" class="form-control" name="senha" id="inputSenha" placeholder="senha">
            </div>
            <button class="btn btn-primary" type="submit">Salvar</button>
        </form>
    </body>
</html>
