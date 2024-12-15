<?php
require_once "../Utilidades/Conn.php"; // Incluye la clase de conexión a la base de datos

// Crear una instancia de la clase Database
$database = new Database();
$conn = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Verifica que se ha recibido el nombre de la categoría
    if (isset($_POST['nombre'])) {
        $nombre_categoria = $_POST['nombre'];

        // Prepara y ejecuta la consulta
        $stmt = $conn->prepare("INSERT INTO categoria (nombre) VALUES (?)");
        $stmt->bind_param("s", $nombre_categoria);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Categoría agregada exitosamente."]);
        } else {
            echo json_encode(["success" => false, "message" => "Error al agregar la categoría."]);
        }

        $stmt->close();
    } else {
        echo json_encode(["success" => false, "message" => "No se recibió el nombre de la categoría."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método no permitido."]);
}

$database->close(); // Cerrar la conexión
?>
