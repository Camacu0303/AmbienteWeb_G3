<?php
session_start();
require_once '../Utilidades/Conn.php';

$db = new Database();
$conn = $db->getConnection();

$idUsuarioReceptor = $_SESSION['id_usuario'] ?? null;
$data = json_decode(file_get_contents("php:

$idBlog = $data['id_blog'] ?? null;
$contenido = $data['contenido'] ?? null;

if (!$idUsuarioReceptor) {
    echo json_encode(['error' => 'Usuario no autenticado.']);
    exit;
}

if (!$idBlog || !$contenido) {
    echo json_encode(['error' => 'Faltan datos necesarios.']);
    exit;
}


$query = "INSERT INTO comentarios_blog (id_blog, id_usuario, contenido, fecha_comentario) VALUES (?, ?, ?, NOW())";
$stmt = $conn->prepare($query);
$stmt->bind_param("iis", $idBlog, $idUsuarioReceptor, $contenido);
if ($stmt->execute()) {
    echo json_encode(['success' => 'Comentario agregado con éxito.']);
} else {
    echo json_encode(['error' => 'Error al agregar el comentario.']);
}

$stmt->close();
$db->close();
?>
