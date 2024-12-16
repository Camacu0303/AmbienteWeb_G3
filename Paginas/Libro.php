<?php
// Conexión a la base de datos
require_once "../Utilidades/Conn.php";
session_start();
$requiredRole = 'usuario';
require_once "../Utilidades/session_checkout.php";
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

            // Manejo de la imagen subida (obligatoria)
            if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
                $imagenNombre = basename($_FILES['imagen']['name']);
                $imagenTmp = $_FILES['imagen']['tmp_name'];
                $imagenDestino = "../uploadsLib/" . $imagenNombre;

                // Validar tipo de archivo para la imagen
                $fileType = pathinfo($imagenDestino, PATHINFO_EXTENSION);
                $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];

                if (in_array(strtolower($fileType), $allowedTypes)) {
                    if (move_uploaded_file($imagenTmp, $imagenDestino)) {
                        // Guardar datos en la base de datos
                        $sql = "INSERT INTO libro (titulo, autor, id_categoria, id_estado, descripcion, id_usuario, archivo, imagen) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param(
                            "ssississ",
                            $titulo,
                            $autor,
                            $id_categoria,
                            $id_estado,
                            $descripcion,
                            $id_usuario,
                            $archivoNombre,
                            $imagenNombre
                        );

                        if ($stmt->execute()) {
                            // Mensaje de éxito
                            $_SESSION['mensaje'] = "Documento subido correctamente.";
                            header("Location: Perfil.php");
                            exit;
                        } else {
                            echo "Error al guardar el libro: " . $stmt->error;
                        }

                        $stmt->close();
                        $conn->close();
                    } else {
                        echo "Error al subir la imagen. Verifica los permisos.";
                    }
                } else {
                    echo "Formato de imagen no válido.";
                }
            } else {
                echo "La imagen es obligatoria.";
            }
        } else {
            echo "Error al subir el archivo. Verifica los permisos.";
        }
    } else {
        echo "El archivo es obligatorio.";
    }
} else {
    echo "Método de solicitud no válido.";
}
?>