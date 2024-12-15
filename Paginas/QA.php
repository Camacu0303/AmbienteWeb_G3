<?php
session_start();
include("../Plantillas/nav.php");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preguntas Frecuentes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .search-container {
            margin: 20px;
        }
        .faq-item {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        function filterQuestions() {
            const searchValue = document.getElementById('search').value.trim();
            const faqItems = document.querySelectorAll('.faq-item');
            const regex = new RegExp(searchValue, 'i'); // Case-insensitive regex
            faqItems.forEach(item => {
                const text = item.textContent || item.innerText;
                if (regex.test(text)) {
                    item.classList.remove('hidden');
                } else {
                    item.classList.add('hidden');
                }
            });
        }
    </script>
</head>
<body>

<div class="search-container">
    <label for="search">Busca en las preguntas frecuentes:</label>
    <input type="text" id="search" oninput="filterQuestions()" placeholder="Escribe una palabra clave o usa regex...">
</div>

<div id="faq-container">
    <div class="faq-item">
        <strong>¿Cómo se llevan a cabo los intercambios en físico?</strong>
        <p>Los intercambios físicos se realizan entregando el libro en una de nuestras tiendas autorizadas. Allí podrás recoger el libro que deseas recibir.</p>
    </div>
    <div class="faq-item">
        <strong>¿Cómo funcionan los intercambios virtuales?</strong>
        <p>Los intercambios virtuales son totalmente gratuitos. Puedes descargar los libros directamente desde nuestra plataforma en formato digital, creando así una experiencia de biblioteca virtual.</p>
    </div>
    <div class="faq-item">
        <strong>¿Qué necesito para realizar un intercambio?</strong>
        <p>Debes tener una cuenta en nuestra plataforma, registrar el libro que deseas intercambiar y seleccionar el libro que quieres recibir.</p>
    </div>
    <div class="faq-item">
        <strong>¿Puedo intercambiar cualquier libro?</strong>
        <p>Sí, puedes intercambiar cualquier libro disponible en nuestra plataforma, ya sea físico o digital.</p>
    </div>
    <div class="faq-item">
        <strong>¿Qué sucede si el libro físico no está en buen estado?</strong>
        <p>Los libros que no cumplan con nuestras condiciones de intercambio serán rechazados al momento de la entrega en la tienda.</p>
    </div>
    <div class="faq-item">
        <strong>¿Puedo realizar más de un intercambio a la vez?</strong>
        <p>Sí, puedes registrar múltiples libros y realizar varios intercambios simultáneamente, tanto físicos como virtuales.</p>
    </div>
    <div class="faq-item">
        <strong>¿Hay algún límite en las descargas de libros digitales?</strong>
        <p>No, puedes descargar todos los libros digitales disponibles en la plataforma, siempre que respetes nuestras condiciones de uso.</p>
    </div>
    <div class="faq-item">
        <strong>¿Qué sucede si no estoy satisfecho con un libro recibido en un intercambio?</strong>
        <p>Para libros físicos, puedes comunicarte con nosotros para evaluar una posible solución. Para libros digitales, te recomendamos revisar las descripciones antes de descargar.</p>
    </div>
    <div class="faq-item">
        <strong>¿Cómo sé si un libro que quiero está disponible?</strong>
        <p>Puedes buscar el libro en nuestra plataforma y verificar su disponibilidad en físico o digital.</p>
    </div>
    <div class="faq-item">
        <strong>¿Puedo intercambiar libros con un usuario específico?</strong>
        <p>Sí, nuestra plataforma permite realizar intercambios directos entre usuarios, siempre y cuando ambos estén de acuerdo y cumplan con las condiciones.</p>
    </div>
</div>

</body>
</html>
