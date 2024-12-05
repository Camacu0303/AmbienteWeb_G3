<?php
require_once "../Utilidades/Conn.php";
session_start();

$db = new Database();
$conn = $db->getConnection();

if (!isset($_POST['id'])) {
    $_SESSION['mensaje'] = "ID no especificado.";
    header("Location: Perfil.php");
    exit;
}

$id_libro = intval($_POST['id']);

// Borrar el archivo relacionado del servidor, si existe
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
    $_SESSION['mensaje'] = "Libro eliminado correctamente.";
} else {
    $_SESSION['mensaje'] = "Error al eliminar el libro.";
}

$stmt->close();
$conn->close();

header("Location: Perfil.php");
exit;
?>
