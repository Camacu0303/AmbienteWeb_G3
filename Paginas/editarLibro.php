<?php
require_once "../Utilidades/Conn.php";
session_start();

$db = new Database();
$conn = $db->getConnection();

if (!isset($_GET['id'])) {
    $_SESSION['mensaje'] = "ID de libro no especificado.";
    header("Location: Perfil.php");
    exit;
}

$id_libro = intval($_GET['id']);

// Obtener los datos del libro
$sql = "SELECT * FROM libro WHERE id_libro = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_libro);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $libro = $result->fetch_assoc();
} else {
    $_SESSION['mensaje'] = "Libro no encontrado.";
    header("Location: Perfil.php");
    exit;
}
$stmt->close();

// Verifica que el formulario haya sido enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titulo = $_POST['titulo'];
    $autor = $_POST['autor'];
    $id_categoria = $_POST['id_categoria'];
    $id_estado = $_POST['id_estado'];
    $descripcion = $_POST['descripcion'];

    $archivoNombre = $libro['archivo']; // Mantener el archivo actual por defecto
    if (isset($_FILES['archivo']) && $_FILES['archivo']['error'] === UPLOAD_ERR_OK) {
        $archivoNombre = $_FILES['archivo']['name'];
        $archivoTmp = $_FILES['archivo']['tmp_name'];
        $archivoDestino = "../uploads/" . basename($archivoNombre);

        if (move_uploaded_file($archivoTmp, $archivoDestino)) {
            // Eliminar el archivo anterior si existe
            if (!empty($libro['archivo']) && file_exists("../uploads/" . $libro['archivo'])) {
                unlink("../uploads/" . $libro['archivo']);
            }
        } else {
            $_SESSION['mensaje'] = "Error al subir el archivo.";
            header("Location: editarLibro.php?id=" . $id_libro);
            exit;
        }
    }

    // Actualizar el registro del libro
    $sql = "UPDATE libro SET titulo = ?, autor = ?, id_categoria = ?, id_estado = ?, descripcion = ?, archivo = ? WHERE id_libro = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssisssi", $titulo, $autor, $id_categoria, $id_estado, $descripcion, $archivoNombre, $id_libro);

    if ($stmt->execute()) {
        $_SESSION['mensaje'] = "Libro actualizado correctamente.";
        header("Location: Perfil.php");
        exit;
    } else {
        echo "Error al actualizar el libro: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        body {
            background-color: #f8f9fa;
        }

        .form-label {
            font-weight: bold;
        }

        .button-container {
            display: flex;
            justify-content: flex-start;
            gap: 15px;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <h2 style="text-align: center;">Editar Libro</h2>
        <form method="POST" enctype="multipart/form-data">
            <!-- Título -->
            <label for="titulo" class="form-label">Título del libro:</label>
            <input type="text" id="titulo" name="titulo" value="<?php echo htmlspecialchars($libro['titulo']); ?>"
                required class="form-control">

            <!-- Autor -->
            <label for="autor" class="form-label">Autor:</label>
            <input type="text" id="autor" name="autor" value="<?php echo htmlspecialchars($libro['autor']); ?>" required
                class="form-control">

            <!-- Categoría -->
            <label for="categoria" class="form-label">Categoría:</label>
            <select id="categoria" name="id_categoria" class="form-control" required>
                <?php
                $sqlCategorias = "SELECT id_categoria, nombre FROM categoria";
                $resultCategorias = $conn->query($sqlCategorias);
                while ($row = $resultCategorias->fetch_assoc()) {
                    $selected = $row['id_categoria'] == $libro['id_categoria'] ? 'selected' : '';
                    echo "<option value='" . $row['id_categoria'] . "' $selected>" . htmlspecialchars($row['nombre']) . "</option>";
                }
                ?>
            </select>

            <!-- Estado -->
            <label for="estado" class="form-label">Estado del libro:</label>
            <select id="estado" name="id_estado" class="form-control" required>
                <?php
                $sqlEstados = "SELECT id_estado, nombre FROM estado_libro";
                $resultEstados = $conn->query($sqlEstados);
                while ($row = $resultEstados->fetch_assoc()) {
                    $selected = $row['id_estado'] == $libro['id_estado'] ? 'selected' : '';
                    echo "<option value='" . $row['id_estado'] . "' $selected>" . htmlspecialchars($row['nombre']) . "</option>";
                }
                ?>
            </select>

            <!-- Descripción -->
            <label for="descripcion" class="form-label">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="3" required
                class="form-control"><?php echo htmlspecialchars($libro['descripcion']); ?></textarea>

            <!-- Archivo Actual -->
            <label for="archivo" class="form-label">Archivo actual:</label>
            <?php if (!empty($libro['archivo'])): ?>
                <div>
                    <a href="../uploads/<?php echo htmlspecialchars($libro['archivo']); ?>" target="_blank">
                        <?php echo htmlspecialchars($libro['archivo']); ?>
                    </a>
                </div>
            <?php else: ?>
                <p>No hay archivo cargado.</p>
            <?php endif; ?>

            <!-- Subir Nuevo Archivo -->
            <label for="archivo" class="form-label">Subir un nuevo archivo:</label>
            <input type="file" id="archivo" name="archivo" accept=".pdf,.doc,.docx" class="form-control">

            <!-- Botones -->
            <div class="button-container mt-3">
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                <a href="Perfil.php" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>

    <?php if (isset($_SESSION['mensaje'])): ?>
        <div class="alert alert-info mt-3">
            <?php echo htmlspecialchars($_SESSION['mensaje']); ?>
        </div>
        <?php unset($_SESSION['mensaje']); ?>
    <?php endif; ?>
</body>

</html>