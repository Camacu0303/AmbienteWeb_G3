<?php

require_once "../Utilidades/Conn.php";
include("../Plantillas/nav.php");

$db = new Database();
$conn = $db->getConnection();

// Obtener categorías
$sqlCategorias = "SELECT id_categoria, nombre FROM categoria";
$resultCategorias = $conn->query($sqlCategorias);

// Obtener autores únicos
$sqlAutores = "SELECT DISTINCT autor FROM libro";
$resultAutores = $conn->query($sqlAutores);

// Obtener libros filtrados (si hay filtros aplicados)
$catalogoLibros = [];
$filtroCategoria = $_GET['categoria'] ?? '';
$filtroAutor = $_GET['autor'] ?? '';

$sqlLibros = "SELECT * FROM libro WHERE 1=1";
if (!empty($filtroCategoria)) {
    $sqlLibros .= " AND id_categoria = ?";
}
if (!empty($filtroAutor)) {
    $sqlLibros .= " AND autor = ?";
}

$stmt = $conn->prepare($sqlLibros);

if (!empty($filtroCategoria) && !empty($filtroAutor)) {
    $stmt->bind_param("is", $filtroCategoria, $filtroAutor);
} elseif (!empty($filtroCategoria)) {
    $stmt->bind_param("i", $filtroCategoria);
} elseif (!empty($filtroAutor)) {
    $stmt->bind_param("s", $filtroAutor);
}

$stmt->execute();
$resultLibros = $stmt->get_result();

while ($row = $resultLibros->fetch_assoc()) {
    $catalogoLibros[] = $row;
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Libros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .filter-container {
            margin: 20px 0;
        }

        .card {
            min-height: 350px;
            max-width: 18rem;
            margin: auto;
        }

        .card-img-top {
            height: 150px;
            object-fit: cover;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .filter-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
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

        .filter-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class="text-center my-4">Catálogo de Libros</h1>

       <!-- Filtros -->
<form method="GET" action="Catalogo.php" class="filter-container row align-items-end mb-4">
    <!-- Filtro por Categoría -->
    <div class="col-md-4">
        <label for="categoria" class="form-label">Categoría</label>
        <select id="categoria" name="categoria" class="form-select">
            <option value="">Todas las categorías</option>
            <?php while ($row = $resultCategorias->fetch_assoc()): ?>
                <option value="<?php echo $row['id_categoria']; ?>"
                    <?php echo ($filtroCategoria == $row['id_categoria']) ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($row['nombre']); ?>
                </option>
            <?php endwhile; ?>
        </select>
    </div>

    <!-- Filtro por Autor -->
    <div class="col-md-4">
        <label for="autor" class="form-label">Autor</label>
        <select id="autor" name="autor" class="form-select">
            <option value="">Todos los autores</option>
            <?php while ($row = $resultAutores->fetch_assoc()): ?>
                <option value="<?php echo htmlspecialchars($row['autor']); ?>"
                    <?php echo ($filtroAutor == $row['autor']) ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($row['autor']); ?>
                </option>
            <?php endwhile; ?>
        </select>
    </div>

    <!-- Botón de Filtrar -->
    <div class="col-md-4">
        <label class="form-label d-block">&nbsp;</label>
        <button type="submit" class="btn btn-primary w-100">Filtrar</button>
    </div>
</form>

<!-- Botón Mostrar Todos -->
<div class="text-center mb-4">
    <a href="Catalogo.php" class="btn btn-secondary">Mostrar Todos</a>
</div>
        <!-- Listado de Libros -->
        <div class="row">
            <?php if (!empty($catalogoLibros)): ?>
                <?php foreach ($catalogoLibros as $libro): ?>
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <!-- Imagen del libro -->
                            <img src="../uploadsLib/<?php echo !empty($libro['imagen']) ? htmlspecialchars($libro['imagen']) : 'default-image.png'; ?>"
                                 alt="Imagen del libro"
                                 class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title text-center"><?php echo htmlspecialchars($libro['titulo']); ?></h5>
                                <p class="card-text text-center"><strong>Autor:</strong> <?php echo htmlspecialchars($libro['autor']); ?></p>
                                <p class="card-text text-center"><?php echo htmlspecialchars($libro['descripcion']); ?></p>
                                <div class="text-center">
                                <a href="Detalle.php?id_libro=<?php echo htmlspecialchars($libro['id_libro']); ?>"
                                class="btn btn-info btn-sm">Detalle</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p class="text-center">No hay libros disponibles con los filtros seleccionados.</p>
            <?php endif; ?>
        </div>
    </div>
</body>

</html>