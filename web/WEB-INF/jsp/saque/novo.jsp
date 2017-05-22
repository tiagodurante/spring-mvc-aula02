<%-- 
    Document   : novo
    Created on : 20/05/2017, 10:36:21
    Author     : Faculdade Alfa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Saque</title>
    </head>
    <body>
        <h1>Bora realizar um saque?</h1>
        <form action="" method="POST">

            <fieldset>
                <legend>Busque sua conta</legend>
                <c:if test="${not empty contas}">

                    <c:forEach var="conta" items="${contas}">
                        <a href="informarValoresDeSaque">${conta.getnAgencia()}/${conta.getnConta()}</a>
                    </c:forEach>

                </c:if>
                <table cellspacing="10">
                    <tr>
                        <td>
                            <label for="agencia">Agencia: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="agencia">
                        </td>
                        <td>
                            <label for="conta">Numero: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="conta">
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Buscar"/>
            </fieldset>
        </form>
    </body>
</html>
