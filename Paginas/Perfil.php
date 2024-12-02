<?php
$requiredRole = 'usuario';
require_once "../Utilidades/session_checkout.php";
include("../Plantillas/nav.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tab View</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-k6RqeWeci5ZR/Lv4MR0sA0FfDOM1qya3hE2D8A1RZ/g5K81+0Qw9Nx2RQjb9gZzCD5yZK10A/GoN+pLmr21Z+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            background-color: #f4f4f4;
            display: table;
            
            text-align: center;
            
        }

        .tab-container {
            width: 90%;
            height: 60%;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: auto;
            
            display: inline-block;
            
            text-align: left;
            
        }

        .tab-list {
            background-color: #f8f9fa;
            border-right: 1px solid #ddd;
            display: flex;
            flex-direction: row;
        }

        .tab-list button {
            padding: 15px;
            border: none;
            border-bottom: 1px solid #ddd;
            background-color: #f8f9fa;
            text-align: left;
            font-size: 16px;
            cursor: pointer;
            outline: none;
            transition: background-color 0.3s;
        }

        .tab-list button:hover {
            background-color: #e9ecef;
        }

        .tab-list button.active {
            background-color: #007bff;
            color: white;
        }

        .tab-content {
            margin: 15px;
        }

        .tab-panel {
            display: none;
        }

        .tab-panel.active {
            display: block;
        }
    </style>
</head>

<body>
    <div class="tab-container">
        <div class="tab-list">
            <button class="tab-button active" data-target="tab1">Cuenta</button>
            <button class="tab-button" data-target="tab2">Subir documento</button>
            <button class="tab-button" data-target="tab3">Historial de trueques</button>
            <button class="tab-button" data-target="tab4">Mis libros y documentos</button>
        </div>
        <div class="tab-content">
            <div id="tab1" class="tab-panel active">
                <h2>Cuenta</h2>
                <p>Contenido relacionado con la gestión de la cuenta.</p>
            </div>
            <div id="tab2" class="tab-panel">
                <h2>Subir documento</h2>
                <form>
                    <label for="fileUpload">Seleccionar archivo:</label>
                    <input type="file" id="fileUpload" name="fileUpload" accept=".pdf,.doc,.docx,.txt">
                    <button type="submit">Subir</button>
                </form>
            </div>
            <div id="tab3" class="tab-panel">
                <h2>Historial de trueques</h2>
                <p>Contenido relacionado con el historial de trueques.</p>
            </div>
            <div id="tab4" class="tab-panel">
                <h2>Mis libros y documentos</h2>
                <p>Contenido relacionado con tus libros y documentos.</p>
            </div>
        </div>
    </div>

    <script>
        const buttons = document.querySelectorAll('.tab-button');
        const panels = document.querySelectorAll('.tab-panel');

        buttons.forEach(button => {
            button.addEventListener('click', () => {
                // Remove active class from all buttons and panels
                buttons.forEach(btn => btn.classList.remove('active'));
                panels.forEach(panel => panel.classList.remove('active'));

                // Add active class to clicked button and corresponding panel
                button.classList.add('active');
                const target = document.getElementById(button.dataset.target);
                target.classList.add('active');
            });
        });
    </script>
</body>

</html>
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