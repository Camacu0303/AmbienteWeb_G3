<?php
include("../Plantillas/nav.php");
include("../Utilidades/mail.php");
#enviarCorreo("<p>Este es un mensaje de prueba personalizado</p>", "coder.josue@gmail.com", "Campos");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Page Card</title>
    <link rel="stylesheet" href="styles.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="contact-card">
        <h2>Contactanos!</h2>
       
        <img src="../Resources/sloth.png" alt="Imagen de contacto" class="circular-image">

        <p>Nos gustaria escuchar sobre ti.</p>
        <p>Email: coder.pruebas.josue@gmail.com</p>
        <p>Telefono: (506)8888-8888</p>
        <a href="mailto:coder.pruebas.josue@gmail.com" class="button">Enviar mensaje</a>
    </div>
    <style>
.contact-card {
    max-width: 400px;
    margin: 20px auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #e7d6c4;
    padding: 20px;
    text-align: center;
    font-family: Arial, sans-serif;
}


.circular-image {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    margin: 10px 0;
}


.contact-card h2 {
    font-size: 24px;
    margin-bottom: 10px;
    color: #333;
}


.contact-card p {
    font-size: 16px;
    color: #555;
    margin: 10px 0;
}


.contact-card a.button {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background-color: #007BFF;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.contact-card a.button:hover {
    background-color: #0056b3;
}


@media (max-width: 500px) {
    .contact-card {
        padding: 15px;
    }

    .contact-card h2 {
        font-size: 20px;
    }

    .contact-card p {
        font-size: 14px;
    }

    .circular-image {
        width: 80px;
        height: 80px;
    }
}
    </style>
</body>
</html>
