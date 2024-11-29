<?php
require_once '../Utilidades/Conn.php'; // Asegúrate de incluir tu archivo de conexión
$db = new Database();
$conn = $db->getConnection();

// Consulta para obtener todos los usuarios
$query = "SELECT id_usuario, nombre, email, usuario, privilegio FROM usuario";
$result = $conn->query($query);

// Preparar los datos para el formato JSON
$data = [];
while ($user = $result->fetch_assoc()) {
    $data[] = $user;
}

// Establecer el encabezado para la respuesta JSON
header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
