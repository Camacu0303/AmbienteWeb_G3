<?php
require_once "../Utilidades/Conn.php";
session_start();

if (!isset($_POST['id'])) {
    echo json_encode(["mensaje" => "ID no especificado."]);
    exit;
}

$id_libro = intval($_POST['id']);

// Conexión a la base de datos
$db = new Database();
$conn = $db->getConnection();

// Obtener la ruta del archivo asociado al libro
$sqlArchivo = "SELECT archivo FROM libro WHERE id_libro = ?";
$stmtArchivo = $conn->prepare($sqlArchivo);
$stmtArchivo->bind_param("i", $id_libro);
$stmtArchivo->execute();
$resultArchivo = $stmtArchivo->get_result();

if ($resultArchivo->num_rows === 1) {
    $libro = $resultArchivo->fetch_assoc();
    $archivoRuta = "../uploads/" . $libro['archivo'];
    if (file_exists($archivoRuta)) {
        unlink($archivoRuta);
    }
}
$stmtArchivo->close();

// Eliminar el libro de la base de datos
$sql = "DELETE FROM libro WHERE id_libro = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_libro);

if ($stmt->execute()) {
    echo json_encode(["mensaje" => "Libro eliminado correctamente."]);
} else {
    echo json_encode(["mensaje" => "Error al eliminar el libro."]);
}

$stmt->close();
$conn->close();
?>
