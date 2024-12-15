<?php
require_once "../Utilidades/Conn.php"; // Incluye la clase de conexión a la base de datos

// Crear una instancia de la clase Database
$database = new Database();
$conn = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Prepara y ejecuta la consulta
    $result = $conn->query("SELECT id_categoria, nombre FROM categoria");

    $categorias = [];
    while ($row = $result->fetch_assoc()) {
        $categorias[] = $row;
    }

    echo json_encode($categorias);
} else {
    echo json_encode(["success" => false, "message" => "Método no permitido."]);
}

$database->close(); // Cerrar la conexión
?>
