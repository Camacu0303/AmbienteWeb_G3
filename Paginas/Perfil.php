<?php
$requiredRole = 'usuario';
require_once "../Utilidades/session_checkout.php";
include("../Plantillas/nav.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
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
                <h2><?php echo isset($_SESSION['nombre']) ? htmlspecialchars($_SESSION['nombre']) : 'Usuario Anónimo'; ?></h2>
                <p><strong>Email:</strong> <?php echo isset($_SESSION['email']) ? htmlspecialchars($_SESSION['email']) : 'No disponible'; ?></p>
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