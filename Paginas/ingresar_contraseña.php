<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingresar Contraseña Temporal</title>
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

        .container {
            display: flex;
            width: 800px;
            height: 500px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .image-section {
            width: 50%;
            background-color: #e7d6c4;
            background-image: url('../Images/libros.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .form-section {
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

        .input-container {
            font-size: 14px;
            color: #555;
            margin-bottom: 20px;
            text-align: center;
        }

        .input-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #8B4513;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #A0522D;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section"></div>

        <div class="form-section">
            <h2>Favor Ingresar la Contraseña Temporal</h2>
            <form action="index.php" method="post">
                <div class="input-container">
                    <label for="temp_password">Contraseña temporal:</label>
                    <input type="password" id="temp_password" name="temp_password" required>
                </div>
                <button type="submit" class="submit-button">Guardar</button>
            </form>
        </div>
    </div>
</body>
</html>
