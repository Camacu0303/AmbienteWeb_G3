<?php
// Conexión a la base de datos
require_once "../Utilidades/Conn.php";
session_start();

// Verifica que el formulario haya sido enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titulo = $_POST['titulo'];
    $autor = $_POST['autor'];
    $id_categoria = $_POST['id_categoria'];
    $id_estado = $_POST['id_estado'];
    $descripcion = $_POST['descripcion'];
    $id_usuario = isset($_SESSION['id_usuario']) ? $_SESSION['id_usuario'] : 1;

    // Manejo del archivo subido
    if (isset($_FILES['archivo']) && $_FILES['archivo']['error'] === UPLOAD_ERR_OK) {
        $archivoNombre = $_FILES['archivo']['name'];
        $archivoTmp = $_FILES['archivo']['tmp_name'];
        $archivoDestino = "../uploads/" . basename($archivoNombre);

        // Mover el archivo a la carpeta de destino
        if (move_uploaded_file($archivoTmp, $archivoDestino)) {
            $db = new Database();
            $conn = $db->getConnection();

            $sql = "INSERT INTO libro (titulo, autor, id_categoria, id_estado, descripcion, id_usuario, archivo) 
                    VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $archivoNombreGuardado = basename($archivoNombre);
            $stmt->bind_param("ssissis", $titulo, $autor, $id_categoria, $id_estado, $descripcion, $id_usuario, $archivoNombreGuardado);

            if ($stmt->execute()) {
                
                // Almacenar un mensaje de éxito en la sesión
                $_SESSION['mensaje'] = "Documento subido correctamente.";
                header("Location: Perfil.php");
                exit;
            } else {
                echo "Error al guardar el libro: " . $stmt->error;
            }

            $stmt->close();
            $conn->close();
        } else {
            echo "Error al subir el archivo. Verifica los permisos.";
        }
    } else {
        echo "No se seleccionó archivo o hubo un error.";
    }
} else {
    echo "Método de solicitud no válido.";
}
?>