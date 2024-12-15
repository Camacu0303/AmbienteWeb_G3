<?php
require_once "../Utilidades/Conn.php"; // Incluye la clase de conexión a la base de datos

// Crear una instancia de la clase Database
$database = new Database();
$conn = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Verifica que se ha recibido el ID de la categoría
    if (isset($_POST['id'])) {
        $id_categoria = $_POST['id'];

        // Prepara y ejecuta la consulta
        $stmt = $conn->prepare("DELETE FROM categoria WHERE id_categoria = ?");
        $stmt->bind_param("i", $id_categoria);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Categoría eliminada exitosamente."]);
        } else {
            echo json_encode(["success" => false, "message" => "Error al eliminar la categoría."]);
        }

        $stmt->close();
    } else {
        echo json_encode(["success" => false, "message" => "No se recibió el ID de la categoría."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método no permitido."]);
}

$database->close(); // Cerrar la conexión
