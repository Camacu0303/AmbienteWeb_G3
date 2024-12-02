<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }

        .recovery-container {
            display: flex;
            width: 800px;
            height: 500px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .recovery-image {
            width: 50%;
            background-color: #e7d6c4;
            background-image: url('../Images/libros.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .recovery-image img {
            width: 100px;
            height: 100px;
        }

        .recovery-form-container {
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
            text-align: center;
        }

        .recovery-instructions {
            font-size: 14px;
            color: #555;
            margin-bottom: 20px;
            text-align: center;
            width: 100%;
        }

        .recovery-form {
            width: 100%;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .recovery-form input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .recovery-button {
            width: 100%;
            padding: 10px;
            background-color: #8B4513;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .recovery-button:hover {
            background-color: #A0522D;
        }

        .register-text {
            font-size: 12px;
            color: #555;
            text-align: center;
            margin-top: 20px;
            width: 100%;
        }

        .register-text a {
            color: #8B4513;
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="recovery-container">
        <div class="recovery-image"></div>

        <div class="recovery-form-container">
            <h2>Recupera tu cuenta</h2>
            <p class="recovery-instructions">Introduce tu correo electrónico para enviarte un email con una contraseña temporal</p>
            <form action="recuperar_contraseña.php" method="post" class="recovery-form">
                <input type="email" id="email" name="email" required placeholder="Correo electrónico">
                <button type="submit" class="recovery-button">Enviar</button>
            </form>
            <p class="register-text">¿No es un usuario activo? <a href="registro.php">Registrarse</a></p>
        </div>
    </div>
</body>

</html>