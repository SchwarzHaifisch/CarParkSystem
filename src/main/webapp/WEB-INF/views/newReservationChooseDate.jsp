<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Nowa Rezerwacja</title>
</head>
<body>
<h1>Wybierz daty</h1>
<form method="post" action="/reservation/saveDate">
    <label for="enterParking">Data wejścia na parking:</label>
    <input id="enterParking" name="enterParking" type="datetime-local" />
    <c:if test="${not empty enterParkingError}">
        <div style="color: red;">${enterParkingError}</div>
    </c:if>
    <br/>
    <label for="outParking">Data wyjścia z parkingu:</label>
    <input id="outParking" name="outParking" type="datetime-local" />
    <c:if test="${not empty outParkingError}">
        <div style="color: red;">${outParkingError}</div>
    </c:if>
    <br/>
    <button type="submit">Zapisz</button>
</form>
</body>
</html>