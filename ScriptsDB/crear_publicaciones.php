<?php
session_start();
require_once '../Utilidades/Conn.php';

header('Content-Type: application/json');

// Verificamos que se haya enviado una solicitud POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtenemos los datos enviados en el cuerpo de la solicitud
    $data = json_decode(file_get_contents('php://input'), true);

    $id_usuario = $_SESSION['id_usuario'] ?? null; 
    if (!$id_usuario) {
        echo json_encode(['error' => 'Usuario no autenticado.']);
        exit;
    }

    $titulo = $data['titulo'] ?? null;
    $contenido = $data['contenido'] ?? null;

    if (!$titulo || !$contenido) {
        echo json_encode(['error' => 'Faltan datos necesarios.']);
        exit;
    }

    $database = new Database();
    $conn = $database->getConnection();

    // Preparamos la consulta SQL para insertar los datos
    $query = "INSERT INTO blog (titulo, contenido, id_usuario, fecha_publicacion) VALUES (?, ?, ?, NOW())";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssi", $titulo, $contenido, $id_usuario);

    if ($stmt->execute()) {
        echo json_encode([
            'success' => true,
            'message' => 'Publicado'
        ]);
    } else {
        echo json_encode(['error' => 'Error al agregar publicacion.']);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['error' => 'Método no permitido.']);
}
?>
