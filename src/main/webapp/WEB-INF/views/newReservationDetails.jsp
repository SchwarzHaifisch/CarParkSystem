<%--
  Created by IntelliJ IDEA.
  User: schwarzhaifisch
  Date: 13.12.2023
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Uzupełnij dane rezerwacji</title>
</head>
<body>
<h1>Uzupełnij dane rezerwacji</h1>
<b>Data przyjazdu na parking: </b>
<b>Data przyjazdu na parking: ${enterParking}</b>
<br/>
<b>Data wyjazdu z parkingu: ${outParking}</b>
<br/>
<b>Cena: ${price} zł</b>

<form method="post" modelAttribute="FinalReservationForm" action="/reservation/saveFinalReservation">
    <input type="hidden" id="enterParking" name="enterParking" value="${enterParking}"/>
    <br/>
    <input type="hidden" id="outParking" name="outParking" value="${outParking}"/>
    <br/>
    <input type="hidden" id="reservationId" name="reservationId" value="${reservationId}"/>
    <br/>
    <label for="firstName">Imię:</label>
    <input id="firstName" name="firstName" type="text"/>
    <br/>
    <label for="lastName">Nazwisko:</label>
    <input id="lastName" name="lastName" type="text"/>
    <br/>
    <label for="email">Adres e-mail:</label>
    <input id="email" name="email" type="email"/>
    <br/>
    <label for="homeAdress">Adres zamieszkania(ulica, numer domu/numer mieszkania, kod pocztowy, miasto):</label>
    <input id="homeAdress" name="homeAdress" type="text"/>
    <br/>
    <label for="phoneNumber">Numer telefonu:</label>
    <input id="phoneNumber" name="phoneNumber" type="number"/>
    <br/>
    <label for="carBrand">Marka pojazdu:</label>
    <select id="carBrand" name="carBrand">
        <c:forEach var="carBrand" items="${carBrands}">
            <option value="${carBrand.brandName}">${carBrand.brandName}</option>
        </c:forEach>
    </select>
    <br/>
    <label for="numberPlates">Numer rejestracyjny auta</label>
    <input id="numberPlates" name="numberPlates" type="text"/>
    <br/>
    <button type="button" onclick="toggleCompanySection()">Chcę fakturę na firmę:</button>

    <div id="companySection" class="company-section">
        <label for="companyName">Pełna nazwa firmy:</label>
        <input id="companyName" name="companyName" type="text"/>
        <br/>
        <label for="companyAdress">Pełny adres firmy:</label>
        <input id="companyAdress" name="companyAdress" type="text"/>
        <br/>
        <label for="companyNip">Numer identyfikacji podatkowej:</label>
        <input id="companyNip" name="companyNip" type="text"/>
        <br/>
    </div>

    <br/>
    <label for="paymentMethod">Sposób płatności:</label>
    <select id="paymentMethod" name="paymentMethod">
            <option value="online">Przez internet</option>
            <option value="onsite">Na miejscu</option>
    </select>
    <br/>
    <c:if test="${not empty validationErrors}">
        <div style="color: red;">
            <c:forEach var="error" items="${validationErrors}">
                ${error.defaultMessage}<br/>
            </c:forEach>
        </div>
    </c:if>

    <button type="submit">Zapisz</button>
</form>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("companySection").style.display = "none";
    });

    function toggleCompanySection() {
        const companySection = document.getElementById("companySection");
        companySection.style.display = (companySection.style.display === "none") ? "block" : "none";
    }
</script>

</body>
</html>