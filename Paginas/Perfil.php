<?php
include("../Plantillas/nav.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="profile-container">
        <h1 class="text-center mt-4">Perfil del Usuario</h1>
        
        <div class="profile-card mx-auto">
            <div class="profile-image">
                <img src="../Images/813728.png" alt="Imagen de perfil" class="rounded-circle">
            </div>
            <div class="profile-details">
                <h2>Nombre del Usuario</h2>
                <p><strong>Email:</strong> usuario@example.com</p>
                <p><strong>Miembro desde:</strong> Enero 2023</p>
            </div>
        </div>
    </div>

    <style>
        .profile-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .profile-card {
            background-color: #B79188;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
        }

        .profile-image img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .profile-details {
            margin-top: 15px;
            color: white;
        }

        .profile-details h2 {
            margin: 10px 0;
        }
    </style>
</body>
</html>