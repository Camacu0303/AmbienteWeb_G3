<?php
require_once "../Utilidades/mail.php";
require_once '../Utilidades/Conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validar si se recibió el email
    if (!isset($_POST["email"]) || empty($_POST["email"])) {
        die("El campo email es obligatorio.");
    }

    $email = $_POST["email"]; // Obtener el correo desde el POST

    // Generar el token único
    $token = bin2hex(random_bytes(64)); // Token de 128 caracteres
    $expiresAt = date('Y-m-d H:i:s', strtotime('+5 minutes')); // Expiración en 5 minutos

    // Insertar el token en la base de datos
    $db = new Database();
    $conn = $db->getConnection();
    $sql = "INSERT INTO token_Seguridad (user_email, token, expires_at) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Error al preparar la consulta: " . $conn->error);
    }

    $stmt->bind_param("sss", $email, $token, $expiresAt);

    if (!$stmt->execute()) {
        die("Error al insertar el token: " . $stmt->error);
    }

    $stmt->close();
    $conn->close();

    // Generar la URL de restablecimiento de contraseña
    $resetUrl = "http://localhost/Proyecto/AmbienteWeb_G3/Paginas/cambiar_contraseña.php?token=" . $token;

    // Contenido del correo
    $titulo = "Restablecer contraseña - Milibro.com";
    $mensaje = "
    <p>Hola,</p>
    <p>Hemos recibido una solicitud para restablecer tu contraseña. Por favor, haz clic en el siguiente enlace para cambiar tu contraseña:</p>
    <p><a href='{$resetUrl}'>Restablecer contraseña</a></p>
    <p>Si no solicitaste un cambio de contraseña, puedes ignorar este correo.</p>
    <p>Gracias,<br>El equipo de Milibro.com</p>
    ";

    // Simulación del envío de correo en localhost
    if (enviarCorreo($mensaje, $email, $titulo)) {
        echo "Se ha enviado un enlace para restablecer tu contraseña. Por favor, revisa tu bandeja de entrada.";
    } else {
        die("Error al enviar el correo. Por favor, inténtalo de nuevo.");
    }
} else {
    die("Método no permitido.");
}
