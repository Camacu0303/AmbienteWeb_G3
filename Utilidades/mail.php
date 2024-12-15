<?php
require_once "../vendor/autoload.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function enviarCorreo($mensaje, $usuarioEmail, $titulo)
{
    $mail = new PHPMailer(true);

    try {
        $mail->SMTPDebug = 0; //0 normal, 2 debug
        $mail->isSMTP();
        $mail->Host = "smtp.gmail.com";
        $mail->SMTPAuth = true;
        $mail->Username = "coder.pruebas.josue@gmail.com";
        $mail->Password = "junndiavjthhhucv"; //Contrase�a, se setea por privado, NO SE SUBE...!!!!
        $mail->SMTPSecure = "tls";
        $mail->Port = 587;
        $mail->CharSet = 'UTF-8';
        // Configuraci�n del correo
        $mail->setFrom("coder.pruebas.josue@gmail.com", "Milibro.com");
        $mail->addAddress($usuarioEmail);
        $mail->isHTML(true);
        $mail->Subject = $titulo;

        // Plantilla de HTML para el mensaje
        $htmlTemplate = "
        <div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px;'>
            <h2 style='color: #333; text-align: center;'>{$titulo}!</h2>
            {$mensaje}
            <hr style='border: 0; border-top: 1px solid #eee; margin: 20px 0;'>
            <footer style='text-align: center; font-size: 12px; color: #777;'>
                <p>Gracias por tu atención.</p>
                <p style='font-size: 10px;'>Este es un mensaje automático, por favor no responder.</p>
            </footer>
        </div>";

        $mail->Body = $htmlTemplate;
        $mail->AltBody = strip_tags($mensaje);
        $mail->send();
    } catch (Exception $e) {
       exit();
    }
    
}
// enviarCorreo("<p>Este es un mensaje de prueba personalizado</p>", "usuario@example.com", "Nombre del Usuario");
?>