<?php
include("../Plantillas/nav.php");

// Datos del libro
$libro = [
    "titulo" => "Libro 1",
    "autor" => "Autor 1",
    "categoria" => "Ficción",
    "formato" => "PDF",
    "imagen" => "../Images/Libros_Catalogo.jpg",
    "descripcion" => "Descripcion del libro.",
    "reseñas" => [
        ["autor" => "Usuario 1", "comentario" => "Comentario."],
        ["autor" => "Usuario 2", "comentario" => "Comentario."],
        ["autor" => "Usuario 3", "comentario" => "Comentario."]
    ]
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Libro - <?= htmlspecialchars($libro['titulo']) ?></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .detalle-libro {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .detalle-libro img {
            width: 200px;
            height: auto;
            margin-bottom: 20px;
        }
        .reseñas {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ccc;
        }
        .reseña {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <h1>Detalle del Libro: <?= htmlspecialchars($libro['titulo']) ?></h1>

    <div class="detalle-libro">
        <img src="<?= htmlspecialchars($libro['imagen']) ?>" alt="Imagen de <?= htmlspecialchars($libro['titulo']) ?>">
        <p><strong>Título:</strong> <?= htmlspecialchars($libro['titulo']) ?></p>
        <p><strong>Autor:</strong> <?= htmlspecialchars($libro['autor']) ?></p>
        <p><strong>Categoría:</strong> <?= htmlspecialchars($libro['categoria']) ?></p>
        <p><strong>Formato:</strong> <?= htmlspecialchars($libro['formato']) ?></p>
        <p><strong>Descripción:</strong> <?= htmlspecialchars($libro['descripcion']) ?></p>
    </div>

    <div class="reseñas">
        <h2>Reseñas:</h2>
        <?php foreach ($libro['reseñas'] as $reseña): ?>
            <div class="reseña">
                <p><strong><?= htmlspecialchars($reseña['autor']) ?>:</strong></p>
                <p><?= htmlspecialchars($reseña['comentario']) ?></p>
            </div>
        <?php endforeach; ?>
    </div>

</body>
</html>