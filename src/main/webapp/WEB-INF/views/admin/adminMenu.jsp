<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    menu {
        min-height: 100vh;
        overflow-y: auto;
    }
</style>

<menu>
    <ul class="nav flex-column long-bg">
        <li class="nav-item">
            <a class="nav-link" href="/admin/main">
                <span>Lista zadań</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/outParking">
                <span>Odznacz wyjazd klienta</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/confirmReservations">
                <span>Rezerwacje do potwierdzenia</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/allReservations">
                <span>Rezerwacje wszystkie</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/history">
                <span>Historia rezerwacji</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
    </ul>
</menu>
