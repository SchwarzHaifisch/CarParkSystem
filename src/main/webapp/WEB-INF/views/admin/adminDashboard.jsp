<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Park.me</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<%@ include file="adminHeader.jsp" %>

<body>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="adminMenu.jsp" %>

        <div class="col-9">
            <div class="dashboard-alerts">
                <div class="alert-item alert-info">
                    <i class="fas icon-circle fa-info-circle"></i>
                    <span class="font-weight-bold">Liczba przyjazdów: ${counterParkingIn}</span>
                </div>
                <div class="alert-item alert-light">
                    <i class="fas icon-circle fa-info-circle"></i>
                    <span class="font-weight-bold">Liczba wyjazdów: ${counterParkingOut}</span>
                </div>
                <div class="alert-item alert-danger">
                    <i class="fas fa-exclamation-circle"></i>
                    <span class="font-weight-bold">Liczba rezerwacji do potwierdzenia: ${counterToConfirm}</span>
                </div>
            </div>

            <div>

                <h2 class="dashboard-content-title">
                    <span>Lista przyjazdów:</span>
                </h2>

                <div class="schedules-content">
                    <table class="table border-bottom w-100">
                        <thead>
                        <tr class="d-flex">
                            <th class="col">Godzina</th>
                            <th class="col-2">Imię</th>
                            <th class="col-2">Nazwisko</th>
                            <th class="col">Marka samochodu</th>
                            <th class="col">Numer rejestracyjny</th>
                            <th class="col">Płatność</th>
                            <th class="col-2">Uwagi</th>
                            <th class="col">Akcje</th>

                        </tr>
                        </thead>
                        <tbody class="text-color-lighter">
                        <c:forEach var="reservation" items="${reservations}">
                            <tr class="d-flex">
                                <td class="col">${reservation.enterParking}</td>
                                <td class="col-2">${reservation.client.firstName}</td>
                                <td class="col-2">${reservation.client.lastName}</td>
                                <td class="col">${reservation.car.brand}</td>
                                <td class="col">${reservation.car.licencePlates}</td>
                                <c:if test="${reservation.payment == 'online'}">
                                    <td class="col">Opłacone</td>
                                </c:if>
                                <c:if test="${reservation.payment == 'onsite'}">
                                    <td class="col">Pobrać opłatę</td>
                                </c:if>
                                <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
                                    <div>${reservationNotes[status.index]}</div>
                                </td>
                                <td class="col d-flex align-items-center justify-content-center flex-wrap">
                                    <form action="/admin/markEnter" method="post">
                                        <input type="hidden" id="id" name="id" value="${reservation.id}"/>
                                        <button type="submit" class="btn btn-warning rounded-0 text-light m-1">Klient przyjechał</button>
                                    </form>

                                    <form action="/admin/edit" method="post">
                                        <input type="hidden" id="idEdit" name="idEdit" value="${reservation.id}"/>
                                        <button type="submit" class="btn btn-warning rounded-0 text-light m-1">Edytuj</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>