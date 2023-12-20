<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Nowa Rezerwacja</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/>    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link href='/css/style.css' rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body>
<%@include file="header.jsp"%>
<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center mb-4">Uzupełnij dane rezerwacji</h1>
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
                <div class="form-group">
                    <label for="firstName">Imię:</label>
                    <input id="firstName" name="firstName" type="text" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="lastName">Nazwisko:</label>
                    <input id="lastName" name="lastName" type="text" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="email">Adres e-mail:</label>
                    <input id="email" name="email" type="email" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="homeAdress">Adres zamieszkania (ulica, numer domu/numer mieszkania, kod pocztowy, miasto):</label>
                    <input id="homeAdress" name="homeAdress" type="text" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Numer telefonu:</label>
                    <input id="phoneNumber" name="phoneNumber" type="number" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="carBrand">Marka pojazdu:</label>
                    <select id="carBrand" name="carBrand" class="form-control">
                        <c:forEach var="carBrand" items="${carBrands}">
                            <option value="${carBrand.brandName}">${carBrand.brandName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="numberPlates">Numer rejestracyjny auta</label>
                    <input id="numberPlates" name="numberPlates" type="text" class="form-control"/>
                </div>
                <button type="button" onclick="toggleCompanySection()" class="btn btn-primary">Chcę fakturę na firmę</button>

                <div id="companySection" class="company-section" style="display: none;">
                    <div class="form-group">
                        <label for="companyName">Pełna nazwa firmy:</label>
                        <input id="companyName" name="companyName" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="companyAdress">Pełny adres firmy:</label>
                        <input id="companyAdress" name="companyAdress" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="companyNip">Numer identyfikacji podatkowej:</label>
                        <input id="companyNip" name="companyNip" type="text" class="form-control"/>
                    </div>
                </div>

                <br/>
                <div class="form-group">
                    <label for="paymentMethod">Sposób płatności:</label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control">
                        <option value="online">Przez internet</option>
                        <option value="onsite">Na miejscu</option>
                    </select>
                </div>

                <c:if test="${not empty validationErrors}">
                    <div style="color: red;">
                        <c:forEach var="error" items="${validationErrors}">
                            ${error.defaultMessage}<br/>
                        </c:forEach>
                    </div>
                </c:if>

                <button type="submit" class="btn btn-success">Zapisz</button>
            </form>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script>
    $(document).ready(function () {
        $('#enterParking, #outParking').datetimepicker({
            format: 'Y-m-d H:i',
            step: 15,
            minDate: 0,
        });
    });

    function toggleCompanySection() {
        const companySection = document.getElementById("companySection");
        companySection.style.display = (companySection.style.display === "none") ? "block" : "none";
    }
</script>

<%@include file="footer.jsp"%>

</body>
</html>
