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
            <a class="nav-link" href="/app/recipe/list">
                <span>Odznacz wyjazd klienta</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/app/plan/list">
                <span>Rezerwacje do potwierdzenia</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">
                <span>Rezerwacje wszystkie</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">
                <span>Historia rezerwacji</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">
                <span>Rezerwacje trwające poza terminem</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
    </ul>
</menu>
