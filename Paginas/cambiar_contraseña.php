<?php
require_once '../Utilidades/Conn.php';

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if (!isset($_GET["token"]) || empty($_GET["token"])) {
        die("Token no proporcionado.");
    }

    $token = $_GET["token"];

    // Conexión a la base de datos
    $db = new Database();
    $conn = $db->getConnection();

    // Verificar si el token es válido y no ha expirado
    $sql = "SELECT * FROM token_seguridad WHERE token = ? AND expires_at > NOW()";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Error al preparar la consulta: " . $conn->error);
    }

    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        $stmt->close();
        $conn->close();
        die("Token inválido o expirado.");
    }

    // Continuar si el token es válido
    $stmt->close();
    $conn->close();
} elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificar que los datos sean válidos
    if (!isset($_POST["token"]) || empty($_POST["token"]) || !isset($_POST["new_password"]) || empty($_POST["new_password"])) {
        die("Token o nueva contraseña no proporcionados.");
    }

    $token = $_POST["token"];
    $newPassword = $_POST["new_password"];

    // Cifrar la nueva contraseña
    $hashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);

    // Conexión a la base de datos
    $db = new Database();
    $conn = $db->getConnection();

    // Actualizar la contraseña y eliminar el token
    $sql = "
        UPDATE usuario AS u
        INNER JOIN token_seguridad AS t ON u.email = t.user_email
        SET u.pass = ?, t.token = NULL
        WHERE t.token = ? AND t.expires_at > NOW()
    ";

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Error al preparar la consulta: " . $conn->error);
    }

    $stmt->bind_param("ss", $hashedPassword, $token);

    if ($stmt->execute() && $stmt->affected_rows > 0) {
        $stmt->close();
        $conn->close();
        header("Location: login.php"); // Redirigir al login si la actualización fue exitosa
        exit;
    } else {
        $stmt->close();
        $conn->close();
        die("Token inválido o expirado.");
    }
} else {
    die("Método no permitido.");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>
    <style>
        /* Estilos básicos */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .form-container {
            width: 400px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Cambiar Contraseña</h2>
        <form action="" method="post">
            <input type="hidden" name="token" value="<?php echo htmlspecialchars($_GET['token']); ?>">
            <label for="new_password">Nueva Contraseña</label>
            <input type="password" id="new_password" name="new_password" required>
            <button type="submit">Actualizar Contraseña</button>
        </form>
    </div>
</body>
</html>
