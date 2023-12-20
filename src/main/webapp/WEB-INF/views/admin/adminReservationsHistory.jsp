<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Historia rezerwacji</title>
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
                        <h3 class="color-header text-uppercase">Historia rezerwacji</h3>
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
                                    <th class="col">Id</th>
                                    <th class="col">Numer Rejestracyjny</th>
                                    <th class="col">Nazwisko Klienta</th>
                                    <th class="col">Nazwa firmy</th>
                                    <th class="col">Numer Rezerwacji</th>
                                    <th class="col">Akcje</th>

                                </tr>
                                </thead>
                                <tbody class="text-color-lighter">
                                <c:forEach var="reservationHistory" items="${reservationList}">
                                    <tr class="d-flex">
                                        <td class="col">${reservationHistory.id}</td>
                                        <td class="col">${reservationHistory.car.licencePlates}</td>
                                        <td class="col-2">${reservationHistory.client.lastName}</td>
                                        <td class="col">${reservationHistory.company.name}</td>
                                        <td class="col">${reservationHistory.reservation.id}</td>
                                        <td class="col d-flex align-items-center justify-content-center flex-wrap">
                                            <form action="/admin/showDetails" method="get">
                                                <input type="hidden" id="idDet" name="idDet" value="${reservationHistory.id}"/>
                                                <button type="submit" class="btn btn-warning rounded-0 text-light m-1">Szczegóły</button>
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
