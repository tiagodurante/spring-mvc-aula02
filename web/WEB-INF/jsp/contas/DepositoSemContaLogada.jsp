<%-- 
    Document   : DepositoSemContaLogada
    Created on : 27/05/2017, 09:12:28
    Author     : Faculdade Alfa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Depósito Sem Conta</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li class="active">Depósito</li>
            <li class="active">Sem cartão</li>
        </ol>
        <br>
        <section class="col-lg-8 col-lg-offset-2">
            <form method="POST" action="salvarDepositoSemContaLogada">
                <div class="form-group">
                    <label for="selectContas">Valor a depositar</label>
                    <select class="form-control" id="selectContas" name="contaSelecionada">
                        <c:forEach var="conta" items="${contas}" varStatus="i">
                            <option value="${i.index}">${conta.getAgencia()}/${conta.getNumero()} - ${conta.getCliente().getNome()} ${conta.getCliente().getSobrenome()}</option>
                        </c:forEach> 
                    </select>
                </div>
                <div class="form-group">
                    <label for="inputValorADepositar">Valor a depositar</label>
                    <input type="text" class="form-control" id="inputValorADepositar" name="valor" placeholder="valor para deposito">
                </div>
                <button type="submit" class="btn btn-primary">Depositar</button>
            </form>
        </section>
    </body>
</html>
