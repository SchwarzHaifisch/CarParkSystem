<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edycja rezerwacji</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<%@include file="adminHeader.jsp" %>

<body>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">

        <%@include file="adminMenu.jsp" %>

        <div class="m-4 p-3 width-medium mx-auto">
            <div class="dashboard-content border-dashed p-3 m-4">
                <div class="row border-bottom border-3 p-1 m-1">
                    <div class="col noPadding">
                        <h3 class="color-header text-uppercase">Rezerwacje do potwierdzenia</h3>
                    </div>
                    <div class="col d-flex justify-content-end mb-2 noPadding">
                        <a href="<c:url value="/admin/main"/>" class="btn btn-warning rounded-0">Powrót</a>
                    </div>
                </div>

                <div class="schedules-content">
                    <div class="schedules-content-header">
                        <div class="schedules-content">
                            <table class="table border-bottom w-100">
                                <thead>
                                <tr class="d-flex">
                                    <th class="col">Przyjazd</th>
                                    <th class="col">Wyjazd</th>
                                    <th class="col">Imię</th>
                                    <th class="col">Nazwisko</th>
                                    <th class="col">Numer Telefonu</th>
                                    <th class="col">Płatność</th>
                                    <th class="col">Akcje</th>
                                </tr>
                                </thead>
                                <tbody class="text-color-lighter">
                                <c:forEach var="reservation" items="${reservationsList}">
                                    <tr class="d-flex">
                                        <td class="col">${reservation.enterParking}</td>
                                        <td class="col">${reservation.outParking}</td>
                                        <td class="col">${reservation.client.firstName}</td>
                                        <td class="col">${reservation.client.lastName}</td>
                                        <td class="col">${reservation.client.phoneNumber}</td>
                                        <c:if test="${reservation.payment == 'online'}">
                                            <td class="col">Opłacone</td>
                                        </c:if>
                                        <c:if test="${reservation.payment == 'onsite'}">
                                            <td class="col">Pobrać opłatę ${reservation.price} zł</td>
                                        </c:if>
                                        <td class="col d-flex align-items-center justify-content-center flex-wrap">
                                            <form action="/admin/confirmed" method="post">
                                                <input type="hidden" id="idCon" name="idCon" value="${reservation.id}"/>
                                                <button type="submit" class="btn btn-success rounded-0 text-light m-1">Potwierdź</button>
                                            </form>
                                            <form action="/admin/denied" method="post">
                                                <input type="hidden" id="idDen" name="idDen" value="${reservation.id}"/>
                                                <button type="submit" class="btn btn-danger rounded-0 text-light m-1">Odrzuć</button>
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
        </div>
    </div>
</section>

</body>
</html>
