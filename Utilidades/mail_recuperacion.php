<?php
require_once "../vendor/autoload.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function enviarCorreo($mensaje, $usuarioEmail, $usuarioNombre) {
    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host = "smtp.gmail.com";
        $mail->SMTPAuth = true;
        $mail->Username = "coder.pruebas.josue@gmail.com"; 
        $mail->Password = "junndiavjthhhucv"; 
        $mail->SMTPSecure = "tls";
        $mail->Port = 587;

        $mail->setFrom("tu_correo@gmail.com", "Milibro.com");
        $mail->addAddress($usuarioEmail, $usuarioNombre);
        $mail->isHTML(true);
        $mail->Subject = "Recuperación de Contraseña";
        $mail->Body = $mensaje;
        $mail->AltBody = strip_tags($mensaje);

        $mail->send();
        return true;
    } catch (Exception $e) {
        return false;
    }
}
