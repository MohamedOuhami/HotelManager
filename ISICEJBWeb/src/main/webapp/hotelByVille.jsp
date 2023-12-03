<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Hotel Manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 30px;
        }
        .my_form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            margin-down: 30px;
        }
        table {
            margin-top: 30px;
        }
        button {
            margin-top: 20px;
        }
        nav {
            margin-bottom: 30px;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand {
            font-weight: bold;
            color: #ffffff;
        }
        .navbar-nav .nav-link {
            color: #ffffff;
        }
        .navbar-nav .nav-link:hover {
            color: #ffffff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Find Hotel by City</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="HotelController">Hotel Form</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="HotelController">Hotel By City</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="VilleController">Ville Form</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <form class="my_form" action="HotelController" method=get>
        <input type="hidden" name="action" value="byVille">
            
            <c:if test="${not empty villes}">
                <div class="form-group">
                    <label for="ville">Ville :</label>
                    <select name="ville" class="form-control">
                        <c:forEach items="${villes}" var="v">
                            <option value="${v.id}">${v.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <!-- Table to showcase hotel information -->
<h2 class="text-center mt-4">Liste des Hôtels :</h2>
<table class="table table-bordered table-striped">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse</th>
            <th>Telephone</th>
            <th>Ville</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- Add a loop to iterate over the list of hotels -->
        <c:forEach items="${Hotels}" var="hotel">
            <tr>
                <td>${hotel.id}</td>
                <td>${hotel.nom}</td>
                <td>${hotel.adresse}</td>
                <td>${hotel.telephone}</td>
                <td>${hotel.ville.nom}</td>
                <td>
                    <form action="HotelController" method="post" onsubmit="return confirmDelete();">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${hotel.id}">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                    <form action="HotelController" method="get">
                       <input type="hidden" name="action" value="edit">
                       <input type="hidden" name="id" value="${hotel.id}">
                       <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                   </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this hotel?");
    }
</script>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
