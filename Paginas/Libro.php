<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="navContainer">
        <!-- Aquí va la barra de navegación existente -->
    </div>
    
    <div class="container mt-5">
        <!-- Imagen adicional en la parte superior -->
        <div class="top-image mb-4">
            <img src="../Images/image.svg" alt="Imagen principal" class="img-fluid" style="width: 100%; border-radius: 8px;">
        </div>
        
        <div class="row">
            <!-- Imagen del libro -->
            <div class="col-md-4">
                <div class="book-image">
                    <img src="../Images/SINFOTO.jpg" alt="Imagen del libro" class="img-fluid" style="border-radius: 8px;">
                </div>
            </div>
            <!-- Información del libro -->
            <div class="col-md-8">
                <h2>Nombre del Libro</h2>
                <p><strong>Descripción:</strong> Breve descripción sobre el libro. Este espacio mostrará una sinopsis o resumen una vez se tenga la información disponible.</p>
                <p><strong>Cantidad de Páginas:</strong> Paginas totales del libro</p>
                <p><strong>Género:</strong> Genero del libro (Historia, Comedia...)</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }
        
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .navContainer {
            height: 30%;
            width: 100%;
            background-color: #B79188;
        }
        
        .book-image img {
            max-width: 100%;
            height: auto;
            display: block;
        }
    </style>
</body>
</html>