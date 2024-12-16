<?php
session_start(); // Asegúrate de que la sesión esté iniciada
require_once '../Utilidades/Conn.php';
$db = new Database();
$conn = $db->getConnection();

$offset = isset($_GET['offset']) ? intval($_GET['offset']) : 0;
$search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';
$limit = 10; 

// Obtener el ID del usuario actual
$idUsuarioActual = $_SESSION['id_usuario'] ?? null;

// Si hay búsqueda, reinicia el offset
if (!empty($search)) {
    $offset = 0; // Reiniciar offset si se realiza una búsqueda
}

// Consulta para obtener los usuarios y si el usuario actual los sigue
$query = "
    SELECT u.id_usuario, u.foto_perfil, u.nombre, u.usuario, u.idioma_preferido, u.intereses,
           (SELECT COUNT(*) FROM seguidores s WHERE s.id_usuario_seguidor = ? AND s.id_usuario_seguido = u.id_usuario) AS ya_sigue
    FROM usuario u 
    WHERE u.usuario LIKE '%$search%' 
    AND u.privilegio != 'admin'
    AND u.id_usuario != ?  -- Excluir el usuario actual
    ORDER BY u.usuario ASC 
    LIMIT ? OFFSET ?";

$stmt = $conn->prepare($query);
$stmt->bind_param("iiii", $idUsuarioActual, $idUsuarioActual, $limit, $offset);
$stmt->execute();
$result = $stmt->get_result();

$users = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

echo json_encode($users);
$stmt->close();
$conn->close();
?>
