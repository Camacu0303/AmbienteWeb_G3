<?php
require_once("../Utilidades/mail_recuperacion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $nombreUsuario = "Usuario";
    $nuevaContraseña = substr(str_shuffle("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), 0, 10);

    $mensaje = "
    <p>Hola, {$nombreUsuario}.</p>
    <p>Tu nueva contraseña temporal es: <strong>{$nuevaContraseña}</strong></p>
    <p>Por favor, inicia sesión con esta contraseña temporal lo antes posible y cámbiala a una nueva para asegurar la seguridad de tu cuenta.</p>

    <p><strong>Nota:</strong> Este es un mensaje automático, por favor no respondas a este correo.</p>
    <p>Gracias por tu atención,<br>El equipo de soporte de Milibro.com</p>
";

    if (enviarCorreo($mensaje, $email, $nombreUsuario)) {
        // Si el correo se envía correctamente, muestra una alerta y redirige
        echo "<script>
        alert('El mensaje se ha enviado correctamente. Revisa tu bandeja de entrada.'); 
        window.location.href = 'ingresar_contraseña.php';
    </script>";
    } else {
        // Si hay un error al enviar el correo, muestra una alerta y permanece en la misma página
        echo "<script>
        alert('Error al enviar el correo. Intenta de nuevo.');
    </script>";
    }
}
?>