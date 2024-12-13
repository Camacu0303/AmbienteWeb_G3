<?php
require_once "../Utilidades/Conn.php";

session_start();

// Comprobar si el usuario está autenticado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: ../Paginas/login.php");
    exit();
}

$id_usuario = $_SESSION['id_usuario'];
$db = new Database();
$conn = $db->getConnection();

// Validar datos recibidos del formulario
$nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : "";
$email = isset($_POST['email']) ? trim($_POST['email']) : "";
$telefono = isset($_POST['telefono']) ? trim($_POST['telefono']) : "";
$direccion = isset($_POST['direccion']) ? trim($_POST['direccion']) : "";
$idioma_preferido = isset($_POST['idioma_preferido']) ? implode(',', $_POST['idioma_preferido']) : "";
$intereses = isset($_POST['intereses']) ? implode(',', $_POST['intereses']) : "";

// Manejar la subida de la imagen de perfil
$foto_perfil = null;
if (isset($_FILES['foto_perfil']) && $_FILES['foto_perfil']['error'] === UPLOAD_ERR_OK) {
    $uploadDir = '../uploadsImg/';
    $filename = basename($_FILES['foto_perfil']['name']);
    $targetFilePath = $uploadDir . $filename;

    // Validar el tipo de archivo
    $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);
    $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];

    if (in_array(strtolower($fileType), $allowedTypes)) {
        if (move_uploaded_file($_FILES['foto_perfil']['tmp_name'], $targetFilePath)) {
            $foto_perfil = $filename;
        } else {
            $_SESSION['mensaje'] = "Error al subir la imagen de perfil.";
            header("Location: perfil.php");
            exit();
        }
    } else {
        $_SESSION['mensaje'] = "Formato de imagen no válido. Solo se permiten JPG, JPEG, PNG y GIF.";
        header("Location: perfil.php");
        exit();
    }
}

// Construir la consulta de actualización
$sql = "UPDATE usuario SET nombre = ?, email = ?, telefono = ?, direccion = ?, idioma_preferido = ?, intereses = ?";

if ($foto_perfil) {
    $sql .= ", foto_perfil = ?";
}

$sql .= " WHERE id_usuario = ?";

$stmt = $conn->prepare($sql);

if ($foto_perfil) {
    $stmt->bind_param("sssssssi", $nombre, $email, $telefono, $direccion, $idioma_preferido, $intereses, $foto_perfil, $id_usuario);
} else {
    $stmt->bind_param("ssssssi", $nombre, $email, $telefono, $direccion, $idioma_preferido, $intereses, $id_usuario);
}

// Ejecutar la consulta
if ($stmt->execute()) {
    $_SESSION['mensaje'] = "Perfil actualizado con éxito.";
    // Actualizar la sesión si es necesario
    $_SESSION['nombre'] = $nombre;
    $_SESSION['email'] = $email;
    $_SESSION['idioma_preferido'] = $idioma_preferido;
    $_SESSION['intereses'] = $intereses;
    if ($foto_perfil) {
        $_SESSION['foto_perfil'] = $foto_perfil;
    }
} else {
    $_SESSION['mensaje'] = "Error al actualizar el perfil: " . $stmt->error;
}

$stmt->close();
$conn->close();

header("Location: perfil.php#tab1");
exit();
?>
