<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Nowa Rezerwacja</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
</head>
<body>
<h1>Wybierz daty</h1>
<form method="post" action="/reservation/saveDate">
    <label for="enterParking">Data wejścia na parking:</label>
    <input id="enterParking" name="enterParking" type="text" />
    <br/>
    <label for="outParking">Data wyjścia z parkingu:</label>
    <input id="outParking" name="outParking" type="text" />
    <br/>
    <button type="submit">Zapisz</button>
</form>
<c:if test="${not empty parkingError}">
    <div style="color: red;">${parkingError}</div>
</c:if>

<script>
    $(document).ready(function () {
        $('#enterParking, #outParking').datetimepicker({
            format: 'Y-m-d H:i',
            step: 15,
            minDate: 0,
        });
    });
</script>
</body>
</html>
