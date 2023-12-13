<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title></title>
<label for="enterParking">Data wejścia na parking:</label>
<form:input path="enterParking" type="datetime-local" />
<form:errors path="enterParking"/>
<br/>
<label for="outParking">Data wyjścia z parkingu:</label>
<form:input path="outParking" type="datetime-local" />
<form:errors path="outParking"/>
<br/>