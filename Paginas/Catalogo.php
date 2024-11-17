<?php
include("../Plantillas/nav.php");

$libros = [
    [
        "titulo" => "Libro 1",
        "autor" => "Autor 1",
        "categoria" => "Ficción",
        "formato" => "",
        "imagen" => "../Images/LibroC.jpg"
    ],
    [
        "titulo" => " Libro 2",
        "autor" => "Autor 2",
        "categoria" => "Novela",
        "formato" => "",
        "imagen" => "../Images/LibroC.jpg"
    ],
    [
        "titulo" => "Libro 3",
        "autor" => "Autor 3",
        "categoria" => "Historia",
        "formato" => "",
        "imagen" => "../Images/LibroC.jpg"
    ]
];

// Variables para almacenar los filtros seleccionados
$filtroCategoria = $_GET['categoria'] ?? '';
$filtroAutor = $_GET['autor'] ?? '';
$filtroFormato = $_GET['formato'] ?? '';

// Filtrar los libros
$librosFiltrados = array_filter($libros, function ($libro) use ($filtroCategoria, $filtroAutor, $filtroFormato) {
    return (!$filtroCategoria || $libro['categoria'] === $filtroCategoria) &&
        (!$filtroAutor || $libro['autor'] === $filtroAutor) &&
        (!$filtroFormato || $libro['formato'] === $filtroFormato);
});
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Libros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .libro {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        .filters {
            margin-bottom: 20px;
        }

        .filters label {
            display: block;
            margin: 5px 0;
        }

        .libro img {
            width: 100px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .detalle-button{
            display: inline-block;            
            padding: 8px 16px;             
            background-color: #8B4513;            
            color: #fff; text-decoration: none; 
            border-radius: 5px; margin-top: 10px; 
        }.detalle-button:hover {
            background-color: #A0522D;
        } 
        
    </style>
</head>

<body>
    <h1>Catálogo de Libros</h1>

    <form method="get" class="filters">
        <label>
            Categoría:
            <select name="categoria">
                <option value="">Todas</option>
                <option value="Ficción" <?= $filtroCategoria === 'Ficción' ? 'selected' : '' ?>>Ficción</option>
                <option value="Novela" <?= $filtroCategoria === 'Novela' ? 'selected' : '' ?>>Novela</option>
                <option value="Historia" <?= $filtroCategoria === 'Historia' ? 'selected' : '' ?>>Historia</option>
            </select>
        </label>
        <label>
            Autor:
            <select name="autor">
                <option value="">Todos</option>
                <option value="Autor 1" <?= $filtroAutor === 'Autor 1' ? 'selected' : '' ?>>Autor 1</option>
                <option value="Autor 2" <?= $filtroAutor === 'Autor 2' ? 'selected' : '' ?>>Autor 2</option>
                <option value="Autor 3" <?= $filtroAutor === 'Autor 3' ? 'selected' : '' ?>>Autor 3</option>
            </select>
        </label>
        <label>
            Formato:
            <select name="formato">
                <option value="">Todos</option>
                <option value="" <?= $filtroFormato === '' ? 'selected' : '' ?>></option>
                <option value="" <?= $filtroFormato === '' ? 'selected' : '' ?>></option>
            </select>
        </label>
        <button type="submit">Aplicar Filtro</button>
    </form>

    <div class="catalogo">
    <?php if (empty($librosFiltrados)): ?>
        <p>No se encontraron libros con los filtros seleccionados.</p>
    <?php else: ?>
        <?php foreach ($librosFiltrados as $libro): ?>
            <div class="libro">
                <h2><?= htmlspecialchars($libro['titulo']) ?></h2>
                <img src="<?= htmlspecialchars($libro['imagen']) ?>" alt="Imagen de <?= htmlspecialchars($libro['titulo']) ?>" style="width: 150px; height: auto;">
                <p><strong>Autor:</strong> <?= htmlspecialchars($libro['autor']) ?></p>
                <p><strong>Categoría:</strong> <?= htmlspecialchars($libro['categoria']) ?></p>
                <p><strong>Formato:</strong> <?= htmlspecialchars($libro['formato']) ?></p>
                <a class="detalle-button" href="Detalle.php?id=<?php echo urlencode($libro['titulo']); ?>">Ver detalle</a>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

</body>

</html>