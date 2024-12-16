<?php
require_once "../Utilidades/Conn.php";
session_start();
$requiredRole = 'usuario';
require_once "../Utilidades/session_checkout.php";
$db = new Database();
$conn = $db->getConnection();

if (isset($_GET['id_libro'])) {
    $id_libro = intval($_GET['id_libro']); 

    // Consulta SQL para obtener el nombre del archivo
    $sql = "SELECT archivo FROM libro WHERE id_libro = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_libro);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $libro = $result->fetch_assoc();
        $archivo = $libro['archivo']; 
        $rutaArchivo = __DIR__ . "/../uploads/" . $archivo; 

        // Validar si el archivo existe en el servidor
        if (file_exists($rutaArchivo)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($rutaArchivo) . '"');
            header('Content-Length: ' . filesize($rutaArchivo));
            readfile($rutaArchivo); 
            exit;
        } else {
            echo "Error: El archivo no existe en el servidor.";
        }
    } else {
        echo "Error: No se encontró un archivo asociado a este ID.";
    }
    $stmt->close();
    $conn->close();
} else {
    echo "Error: No se especificó un ID de libro.";
}
?>
