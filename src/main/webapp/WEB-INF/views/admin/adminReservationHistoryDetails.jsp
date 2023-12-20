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
                        <h3 class="color-header text-uppercase">Rezerwacja nr ${reservationHistory.id}</h3>
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
                                Data utworzenia: ${reservationHistory.createdFormatted}
                            </span>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Data Przyjazdu: ${reservationHistory.enterParkingFormatted}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Data Wyjazdu: ${reservationHistory.outParkingFormatted}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Kwota: ${reservationHistory.price} zł
                            </label>
                        </div>
                        <div class="form-group row">
                            <label  class="col-sm label-size col-form-label">
                                Status: ${reservationHistory.status}
                            </label>
                        </div>

                        <div class="form-group row">
                            <span class="col-sm label-size font-weight-bold col-form-label">
                                Dane Klienta
                            </span>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Adres E-mail: ${reservationHistory.client.email}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Imię: ${reservationHistory.client.firstName}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Nazwisko: ${reservationHistory.client.lastName}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Adres zamieskania: ${reservationHistory.client.homeAddress}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Numer telefonu
                            </label>
                            <div class="col-sm-10">
                                <p class="schedules-text">${reservation.client.phoneNumber}</p>
                            </div>
                        </div>

                        <div class="form-group row">
                            <span class="col-sm label-size font-weight-bold col-form-label">
                                Dane Firmy
                            </span>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Nazwa firmy: ${reservationHistory.client.company.name}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Adres: ${reservationHistory.client.company.address}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                NIP: ${reservationHistory.client.company.nip}
                            </label>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm label-size font-weight-bold col-form-label">
                                Dane Samochodu
                            </span>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Marka: ${reservationHistory.car.brand}
                            </label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm label-size col-form-label">
                                Numer Rejestracyjny: ${reservationHistory.car.licencePlates}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
