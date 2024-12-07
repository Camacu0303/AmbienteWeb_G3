<?php
session_start();
require_once '../Utilidades/Conn.php';

$db = new Database();
$conn = $db->getConnection();

$idBlog = intval($_GET['id_blog'] ?? 0);
$idUsuarioActual = $_SESSION['id_usuario'] ?? null;

if (!$idUsuarioActual || !$idBlog) {
    echo json_encode(['error' => 'Usuario no autenticado o ID de blog inválido.']);
    exit;
}


$query = "SELECT c.id_comentario, c.contenido, c.fecha_comentario, u.usuario AS autor
FROM comentarios_blog c
JOIN usuario u ON c.id_usuario = u.id_usuario
WHERE c.id_blog = ?
ORDER BY c.fecha_comentario DESC;
";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $idBlog);
$stmt->execute();
$result = $stmt->get_result();

$comentarios = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($comentarios);
$db->close();
?>
