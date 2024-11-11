<?php
require_once "../vendor/autoload.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function enviarCorreo($mensaje, $usuarioEmail, $usuarioNombre) {
    $mail = new PHPMailer(true);

    try {
        $mail->SMTPDebug = 0; //0 normal, 2 debug
        $mail->isSMTP();
        $mail->Host = "smtp.gmail.com";
        $mail->SMTPAuth = true;
        $mail->Username = "coder.pruebas.josue@gmail.com"; 
        $mail->Password = ""; //Contraseña, se setea por privado, NO SE SUBE...!!!!
        $mail->SMTPSecure = "tls";
        $mail->Port = 587;

        // Configuración del correo
        $mail->setFrom("coder.pruebas.josue@gmail.com", "Milibro.com");
        $mail->addAddress($usuarioEmail, $usuarioNombre);
        $mail->isHTML(true);
        $mail->Subject = "Notificación";

        // Plantilla de HTML para el mensaje
        $htmlTemplate = "
        <div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px;'>
            <h2 style='color: #333; text-align: center;'>¡Hola, {$usuarioNombre}!</h2>
            <p style='font-size: 16px; color: #555;'>$mensaje</p>
            <hr style='border: 0; border-top: 1px solid #eee; margin: 20px 0;'>
            <footer style='text-align: center; font-size: 12px; color: #777;'>
                <p>Gracias por tu atención.</p>
                <p style='font-size: 10px;'>Este es un mensaje automático, por favor no responder.</p>
            </footer>
        </div>";

        $mail->Body = $htmlTemplate;
        $mail->AltBody = strip_tags($mensaje);
        $mail->send();
        echo "El mensaje se ha enviado correctamente.";
    } catch (Exception $e) {
        echo "Error al enviar el correo: {$mail->ErrorInfo}";
    }
}
// enviarCorreo("<p>Este es un mensaje de prueba personalizado</p>", "usuario@example.com", "Nombre del Usuario");
?>
