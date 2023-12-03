<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Ville</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 30px;
        }
        .custom_class {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        .container {
            margin-top: 50px;
        }
        .table th, .table td {
            text-align: center;
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
        <a class="navbar-brand" href="#">Edit Ville</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="HotelController">Hotel Form</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="VilleController">Ville Form</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center mb-4">Ville Management</h1>

        <!-- Form to add a new city -->
        <form class="custom_class" action="VilleController" method="post" class="form-inline mb-3">
            <div class="form-group mr-2">
                <label for="villeInput" class="sr-only">Nom :</label>
                <input type="text" name="ville" class="form-control" id="villeInput" placeholder="Enter city name" value="${editVille != null ? editVille.nom : ''}" required>
            </div>
            <input type="hidden" name="action" value="${editVille != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editVille != null ? editVille.id : ''}">
            <button type="submit" class="btn btn-primary">${editVille != null ? 'Update' : 'Enregistrer'}</button>
        </form>

    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Ville and associated hotels?");
        }
    </script>
</body>
</html>
