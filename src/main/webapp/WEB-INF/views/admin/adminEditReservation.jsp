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
<c:if test="${not empty successMessage}">
    <div class="alert alert-success">
            ${successMessage}
    </div>
</c:if>
<section class="dashboard-section">
    <div class="row dashboard-nowrap">

        <%@include file="adminMenu.jsp" %>

        <div class="m-4 p-3 width-medium mx-auto">
            <div class="dashboard-content border-dashed p-3 m-4">
                <div class="row border-bottom border-3 p-1 m-1">
                    <div class="col noPadding">
                        <h3 class="color-header text-uppercase">Rezerwacja nr ${reservation.getId()}</h3>
                    </div>
                    <div class="col d-flex justify-content-end mb-2 noPadding">
                        <a href="<c:url value="/admin/main"/>" class="btn btn-warning rounded-0">Powrót</a>
                    </div>
                </div>

                <div class="schedules-content">
                    <div class="schedules-content-header">
                        <div class="form-group row">
                            <span class="col-sm-2 label-size font-weight-bold col-form-label">
                                Dane Rezerwacji
                            </span>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-2 label-size col-form-label">
                                Data utworzenia
                            </span>
                            <div class="col-sm-10">
                                <p class="schedules-text">${reservation.getCreated()}</p>
                            </div>
                            <form action="<c:url value="/admin/editConfirm"/>" method="POST">
                                <input type="hidden" name="planId" value="${reservation.getId()}">
                                <input type="hidden" name="action" value="update">
                                <div class="row border-bottom border-3 p-1 m-1">
                                    <div class="col d-flex justify-content-end mb-2 noPadding">
                                        <button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">
                                            Zapisz
                                        </button>
                                    </div>
                                </div>

                                <div class="schedules-content">

                                    <div class="form-group row">
                                        <label for="entryDate" class="col-sm label-size col-form-label">
                                            Data Przyjazdu
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="entryDate" name="entryDate"
                                                   value="${reservation.enterParking}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="outDate" class="col-sm label-size col-form-label">
                                            Data Wyjazdu
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="outDate" name="outDate"
                                                   value="${reservation.outParking}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newPrice" class="col-sm label-size col-form-label">
                                            Kwota
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newPrice" name="newPrice"
                                                   value="${reservation.price}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newStatus" class="col-sm label-size col-form-label">
                                            Status (nominalna wartość statusu: ${reservation.status})
                                        </label>
                                        <div class="col-sm-10">
                                            <select id="newStatus" name="newStatus" class="form-control">
                                                <option value="Niepotwierdzona" ${reservation.status == 'Niepotwierdzona' ? 'selected' : ''}>
                                                    Niepotwierdzona
                                                </option>
                                                <option value="Potwierdzona" ${reservation.status == 'Potwierdzona' ? 'selected' : ''}>
                                                    Potwierdzona
                                                </option>
                                                <option value="W trakcie realizacji" ${reservation.status == 'W trakcie realizacji' ? 'selected' : ''}>
                                                    W trakcie realizacji
                                                </option>
                                                <option value="Zakończona" ${reservation.status == 'Zakończona' ? 'selected' : ''}>
                                                    Zakończona
                                                </option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <span class="col-sm label-size font-weight-bold col-form-label">
                                            Dane Klienta
                                        </span>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newEmail" class="col-sm label-size col-form-label">
                                            Adres E-mail
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newEmail" name="newEmail"
                                                   value="${reservation.client.email}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newFirstName" class="col-sm label-size col-form-label">
                                            Imię
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newFirstName" name="newFirstName"
                                                   value="${reservation.client.firstName}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newLastName" class="col-sm label-size col-form-label">
                                            Nazwisko
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newLastName" name="newLastName"
                                                   value="${reservation.client.lastName}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newHomeAddress" class="col-sm label-size col-form-label">
                                            Adres zamieskania
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newHomeAddress" name="newHomeAddress"
                                                   value="${reservation.client.homeAddress}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newPhoneNumber" class="col-sm label-size col-form-label">
                                            Numer telefonu
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newPhoneNumber" name="newPhoneNumber"
                                                   value="${reservation.client.phoneNumber}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <span class="col-sm label-size font-weight-bold col-form-label">
                                            Dane do faktury
                                        </span>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newCompanyName" class="col-sm label-size col-form-label">
                                            Nazwa firmy
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newCompanyName" name="newCompanyName"
                                                   value="${reservation.client.company.name}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newCompanyAddress" class="col-sm label-size col-form-label">
                                            Adres
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newCompanyAddress" name="newCompanyAddress"
                                                   value="${reservation.client.company.address}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newCompanyNip" class="col-sm label-size col-form-label">
                                            NIP
                                        </label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="newCompanyNip" name="newCompanyNip"
                                                   value="${reservation.client.company.nip}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
