<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Park.me</title>
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
<%@ include file="header.jsp" %>
<section class="padding-large bg-light d-flex align-items-center justify-content-center">
    <div id="carouselExampleControls" class="carousel slide main-slider" data-ride="carousel">
        <div class="carousel-inner container">
            <div class="carousel-item active">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Cena za 1 dobę</h1>
                        <p>15 PLN</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Cena za 7 dni</h1>
                        <p>105 PLN</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Cena za 30 dni</h1>
                        <p>450 PLN</p>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>


<section class="section-more padding-small">
    <div class="container d-flex justify-content-between">
        <div class="mr-4">
            <h1 class="pb-3">Parking przy samym lotnisku</h1>
            <h4 class="pt-1">Sprawdź jak blisko lotniska jesteśmy. W cenie rezerwacji oferujemy
            transport na lotnisko oraz z lotniska po powrocie</h4>
        </div>
        <div class="ml-4 align-self-center">
            <button class="btn btn-color rounded-0 mt-4 pl-4 pr-4">
                <a href="/location">Sprawdź</a>
            </button>
        </div>
    </div>
</section>

<section class="padding-small details bg-light">
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <i class="fas fa-check icon-details"></i>
                <h1>Bezpieczny i czysty parking</h1>
                <p>Państwa samochody będą u nas bezpieczne, dzięki całodobowemu monitoringowi, regularnym obchodom oraz sam parking
                    jest wyasfaltowany.
                </p>
            </div>
            <div class="col text-center pr-4 pl-4 mr-4 ml-4">
                <i class="far fa-clock icon-details"></i>
                <h1>Minimum formalności</h1>
                <p>Złożenie rezerwacji razem ewentualną płatnością na miejscu oraz zaparkowanie samochodu to maksymalnie 5 minut.
                </p>
            </div>
            <div class="col text-center">
                <i class="fas fa-list icon-details"></i>
                <h1>Bardzo duża liczba miejsc</h1>
                <p>Dzięki poprawnemu wyborowi i zagospodarowaniu terenu, mogą Państwo parkować na całej powierzchni parkingu która wynosi ponad 5 hektarów
                </p>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>

</body>
</html>