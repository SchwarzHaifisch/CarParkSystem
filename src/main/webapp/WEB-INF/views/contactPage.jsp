<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Park.me - Kontakt</title>
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

<section class="padding-large contact bg-light">
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <p>Zapraszamy do skontaktowania się z nami.</p> <p>Poniżej znajdziesz informacje kontaktowe oraz mapę dojazdu.</p>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="contact-info">
                    <h3>Numer telefonu</h3>
                    <p>+48 123 456 789</p>
                    <h3>Adres</h3>
                    <p>ul. Przykładowa 123, 00-000 Warszawa</p>
                    <h3>Adres mailowy</h3>
                    <p>przykład@przykład.pl</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10250.937380747342!2d19.94816778009906!3d50.03507349425118!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b5699f20d7d%3A0xa2c7c21b890cdc94!2sKopiec%20Krakusa%2C%20Krak%C3%B3w!5e0!3m2!1spl!2spl!4v1703088617565!5m2!1spl!2spl" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>

</body>
</html>
