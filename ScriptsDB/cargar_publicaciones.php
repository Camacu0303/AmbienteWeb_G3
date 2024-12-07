<?php
session_start();
require_once '../Utilidades/Conn.php';

$db = new Database();
$conn = $db->getConnection();

$idUsuarioActual = $_SESSION['id_usuario'] ?? null;
$limit = intval($_GET['limit'] ?? 10);
$offset = intval($_GET['offset'] ?? 0);

if (!$idUsuarioActual) {
    echo json_encode(['error' => 'Usuario no autenticado.']);
    exit;
}


$query = "
    SELECT b.id_blog, b.titulo, b.contenido, u.usuario AS autor, b.fecha_publicacion,
           (SELECT COUNT(*) FROM comentarios_blog c WHERE c.id_blog = b.id_blog) AS cantidad_comentarios
    FROM blog b
    INNER JOIN usuario u ON b.id_usuario = u.id_usuario
    WHERE b.id_usuario IN (
        SELECT id_usuario_seguido
        FROM seguidores
        WHERE id_usuario_seguidor = ?
    )
    ORDER BY b.fecha_publicacion DESC
    LIMIT ? OFFSET ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("iii", $idUsuarioActual, $limit, $offset);
$stmt->execute();
$result = $stmt->get_result();

$publicaciones = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($publicaciones);
$db->close();
?>
