<?php
require_once "../Utilidades/Conn.php";
session_start();

$db = new Database();
$conn = $db->getConnection();

// Verifica si el ID del libro está en la URL
if (!isset($_GET['id_libro'])) {
    $_SESSION['mensaje'] = "ID del libro no especificado.";
    header("Location: Catalogo.php");
    exit;
}

$id_libro = intval($_GET['id_libro']);
$id_usuario_actual = isset($_SESSION['id_usuario']) ? $_SESSION['id_usuario'] : null;

// Obtener los detalles del libro
$sqlLibro = "
    SELECT 
        libro.titulo, 
        libro.autor, 
        libro.id_usuario AS id_propietario,
        categoria.nombre AS categoria, 
        estado_libro.nombre AS estado, 
        libro.descripcion, 
        libro.imagen
    FROM libro
    JOIN categoria ON libro.id_categoria = categoria.id_categoria
    JOIN estado_libro ON libro.id_estado = estado_libro.id_estado
    WHERE libro.id_libro = ?";
$stmt = $conn->prepare($sqlLibro);
$stmt->bind_param("i", $id_libro);
$stmt->execute();
$resultLibro = $stmt->get_result();

if ($resultLibro->num_rows === 1) {
    $libro = $resultLibro->fetch_assoc();
} else {
    $_SESSION['mensaje'] = "El libro no fue encontrado.";
    header("Location: Catalogo.php");
    exit;
}
$stmt->close();

$id_propietario = $libro['id_propietario'];

// Manejar la solicitud de trueque
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['solicitar_trueque']) && $id_usuario_actual !== $id_propietario) {
    $id_estado = 1; // Estado "Pendiente"
    $fecha_intercambio = date("Y-m-d");

    $sqlInsertTrueque = "INSERT INTO intercambio (id_usuario_ofreciente, id_usuario_receptor, id_libro_solicitado, fecha_intercambio, id_estado) VALUES (?, ?, ?, ?, ?)";
    $stmtInsertTrueque = $conn->prepare($sqlInsertTrueque);
    $stmtInsertTrueque->bind_param("iiisi", $id_usuario_actual, $id_propietario, $id_libro, $fecha_intercambio, $id_estado);

    if ($stmtInsertTrueque->execute()) {
        $_SESSION['mensaje'] = "Solicitud de trueque enviada correctamente.";
        header("Location: Catalogo.php");
        exit;
    } else {
        $_SESSION['mensaje'] = "Error al enviar la solicitud: " . $stmtInsertTrueque->error;
    }
    $stmtInsertTrueque->close();
}

// Manejar la inserción de valoraciones
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['calificacion'], $_POST['comentario'])) {
    if ($id_usuario_actual && $id_usuario_actual !== $id_propietario) {
        $calificacion = intval($_POST['calificacion']);
        $comentario = trim($_POST['comentario']);
        $fecha = date("Y-m-d");

        $sqlInsert = "INSERT INTO valoracion (id_usuario_receptor, id_usuario_ofreciente, calificacion, comentario, fecha) 
                      VALUES (?, ?, ?, ?, ?)";
        $stmtInsert = $conn->prepare($sqlInsert);
        $stmtInsert->bind_param("iiiss", $id_propietario, $id_usuario_actual, $calificacion, $comentario, $fecha);

        if ($stmtInsert->execute()) {
            $_SESSION['mensaje'] = "Valoración enviada correctamente.";
            header("Location: Detalle.php?id_libro=" . $id_libro);
            exit;
        } else {
            $_SESSION['mensaje'] = "Error al agregar la valoración: " . $stmtInsert->error;
        }
        $stmtInsert->close();
    }
}

        // Obtener las valoraciones del libro
        $sqlValoraciones = "
            SELECT 
                valoracion.calificacion, 
                valoracion.comentario, 
                valoracion.fecha, 
                usuario.nombre AS nombre_usuario
            FROM valoracion
            JOIN usuario ON valoracion.id_usuario_ofreciente = usuario.id_usuario
            WHERE valoracion.id_usuario_receptor = ?";
        $stmtValoraciones = $conn->prepare($sqlValoraciones);
        $stmtValoraciones->bind_param("i", $id_propietario);
        $stmtValoraciones->execute();
        $resultValoraciones = $stmtValoraciones->get_result();
        $valoraciones = $resultValoraciones->fetch_all(MYSQLI_ASSOC);
        $stmtValoraciones->close();
        ?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 30px;
            max-width: 800px;
        }

        .card-img-top {
            width: auto;
            height: 150px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .rating-container {
            margin-top: 20px;
        }

        .comment-card {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card shadow-lg">
            <img src="../uploadsLib/<?php echo htmlspecialchars($libro['imagen']); ?>" class="card-img-top"
                alt="Imagen del libro">
            <div class="card-body">
                <h3 class="card-title text-center"><?php echo htmlspecialchars($libro['titulo']); ?></h3>
                <p><strong>Autor:</strong> <?php echo htmlspecialchars($libro['autor']); ?></p>
                <p><strong>Categoría:</strong> <?php echo htmlspecialchars($libro['categoria']); ?></p>
                <p><strong>Estado:</strong> <?php echo htmlspecialchars($libro['estado']); ?></p>
                <p><strong>Descripción:</strong> <?php echo htmlspecialchars($libro['descripcion']); ?></p>

                <!-- Botón para solicitar trueque -->
                <?php if ($id_usuario_actual !== $id_propietario): ?>
                    <form method="POST">
                        <button type="submit" name="solicitar_trueque" class="btn btn-primary">Solicitar Trueque</button>
                    </form>
                <?php else: ?>
                    <p class="text-muted text-center">Este libro te pertenece.</p>
                <?php endif; ?>
            </div>
        </div>

        <!-- Sección de valoración -->
        <h4>Valoraciones</h4>
        <?php if ($id_usuario_actual !== $id_propietario): ?>
            <form method="POST">
                <div class="mb-3">
                    <label for="calificacion" class="form-label">Calificación</label>
                    <select id="calificacion" name="calificacion" class="form-select" required>
                        <option value="" selected disabled>Selecciona una calificación</option>
                        <option value="1">1 - Muy malo</option>
                        <option value="2">2 - Malo</option>
                        <option value="3">3 - Regular</option>
                        <option value="4">4 - Bueno</option>
                        <option value="5">5 - Excelente</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="comentario" class="form-label">Comentario</label>
                    <textarea id="comentario" name="comentario" class="form-control" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        <?php else: ?>
            <p class="text-muted">No puedes valorar tu propio libro.</p>
        <?php endif; ?>

        <!-- Mostrar valoraciones -->
        <div class="mt-4">
            <?php if (!empty($valoraciones)): ?>
                <?php foreach ($valoraciones as $valoracion): ?>
                    <div class="card mb-2">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlspecialchars($valoracion['nombre_usuario']); ?></h5>
                            <p class="card-text"><strong>Calificación:</strong>
                                <?php echo htmlspecialchars($valoracion['calificacion']); ?></p>
                            <p class="card-text"><?php echo nl2br(htmlspecialchars($valoracion['comentario'])); ?></p>
                            <p class="text-muted"><small><?php echo htmlspecialchars($valoracion['fecha']); ?></small></p>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>No hay valoraciones aún.</p>
            <?php endif; ?>
        </div>

        <!-- Botón para regresar -->
        <div class="text-center mt-4">
            <a href="Catalogo.php" class="btn btn-secondary">Regresar al Catálogo</a>
        </div>
    </div>
</body>

</html>