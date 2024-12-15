<?php
require_once '../Utilidades/db.php'; // Asegúrate de que la ruta sea correcta

// Realiza la consulta para obtener estadísticas de uso
$query = "SELECT i.id_intercambio, i.id_libro, i.id_usuario, i.fecha_intercambio, ei.nombre AS estado
          FROM intercambio i
          JOIN estado_intercambio ei ON i.id_estado = ei.id_estado";
$result = $conn->query($query);

$statistics = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $statistics[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($statistics);

$conn->close();
?>
