<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio Sesión</title>
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

        .login-container {
            display: flex;
            width: 800px;
            height: 500px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .login-image {
            width: 50%;
            background-color: #e7d6c4;
            background-image: url('../Images/libros.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .login-form {
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .back-arrow {
            font-size: 24px;
            color: #8B4513;
            text-decoration: none;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .forgot-password {
            font-size: 12px;
            color: #8B4513;
            text-decoration: none;
            margin-bottom: 20px;
            display: block;
            text-align: center;
            width: 100%;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #8B4513;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #A0522D;
        }

        .register-text {
            font-size: 12px;
            color: #555;
            margin-top: 20px;
            text-align: center;
            width: 100%;
        }

        .register-text a {
            color: #8B4513;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="login-image">
        </div>
        <div class="login-form">
            <a href="index.php" class="back-arrow">←</a>
            <h2>Iniciar sesión</h2>
            <form action="index.php" method="post">
                <label for="username">Usuario:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>

                <a href="recuperar_cuenta.php" class="forgot-password">¿Has olvidado tu contraseña?</a>

                <button type="submit" class="login-button">Continuar</button>
            </form>

            <p class="register-text">¿No es un usuario activo? <a href="registro.php">Regístrate</a></p>
        </div>
    </div>
</body>

</html>