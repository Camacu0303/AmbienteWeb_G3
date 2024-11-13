<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
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

        .register-container {
            display: flex;
            width: 800px;
            height: 600px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .register-image {
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

        .register-form {
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

        .register-title {
            font-size: 20px;
            color: #8B4513;
            margin-bottom: 20px;
            text-align: center;
            width: 100%; 
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .register-button {
            width: 100%;
            padding: 10px;
            background-color: #8B4513;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .register-button:hover {
            background-color: #A0522D;
        }
    </style>
</head>

<body>
    <div class="register-container">
        <div class="register-image">
        </div>
        
        <div class="register-form">
            <a href="index.php" class="back-arrow">←</a>
            <h2 class="register-title">Registro de nuevo usuario</h2> 

            <form action="index.php" method="post">
                <label for="name">Nombre:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Correo electrónico:</label>
                <input type="email" id="email" name="email" required>

                <label for="username">Usuario:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>

                <label for="confirm_password">Repetir contraseña:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>

                <button type="submit" class="register-button">Continuar</button>
            </form>
        </div>
    </div>
</body>

</html>
