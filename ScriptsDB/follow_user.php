<?php
session_start();
require_once '../Utilidades/Conn.php';

$db = new Database();
$conn = $db->getConnection();

$idUsuarioSeguidor = $_SESSION['id_usuario'] ?? null;
$data = json_decode(file_get_contents('php://input'), true);
$idUsuarioSeguido = $data['id_usuario_seguido'] ?? null;

if (!$idUsuarioSeguidor || !$idUsuarioSeguido) {
    echo json_encode(['success' => false, 'error' => 'Datos no válidos.']);
    exit;
}

// Iniciar una transacción
$conn->begin_transaction();

try {
    // Insertar en la tabla de seguidores
    $query1 = "INSERT INTO seguidores (id_usuario_seguidor, id_usuario_seguido, fecha_seguimiento) VALUES (?, ?, NOW())";
    $stmt1 = $conn->prepare($query1);
    $stmt1->bind_param("ii", $idUsuarioSeguidor, $idUsuarioSeguido);
    
    if (!$stmt1->execute()) {
        throw new Exception('No se pudo seguir al usuario.');
    }

    // Insertar la relación inversa
    $query2 = "INSERT INTO seguidores (id_usuario_seguidor, id_usuario_seguido, fecha_seguimiento) VALUES (?, ?, NOW())";
    $stmt2 = $conn->prepare($query2);
    $stmt2->bind_param("ii", $idUsuarioSeguido, $idUsuarioSeguidor);
    
    if (!$stmt2->execute()) {
        throw new Exception('No se pudo seguir al usuario en la dirección inversa.');
    }

    // Confirmar la transacción
    $conn->commit();
    echo json_encode(['success' => true]);

} catch (Exception $e) {
    // Deshacer la transacción en caso de error
    $conn->rollback();
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
} finally {
    $stmt1->close();
    $stmt2->close();
    $conn->close();
}
?>
