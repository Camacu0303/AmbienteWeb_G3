
<?php
header('Content-type: text/html; charset=utf-8');
include("../Plantillas/nav.php");

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiLibro.com</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }
        header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }
        nav {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 30px;
        }
        section {
            margin: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            margin-top: 20px;
        }
        .content {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .content div {
            flex: 1;
        }
    </style>
</head>
<body>

    <section id="seccion1">
        <h2>Bienvenidos a MiLibro.com</h2>
        <p>En nuestra librería, encontrarás una amplia selección de libros de todos los géneros, desde literatura clásica hasta las últimas novedades en ciencia ficción. Nos especializamos en brindarte experiencias literarias únicas.</p>
    </section>

    <section id="seccion2">
        <h2>Catálogo de Libros</h2>
        <div class="content">
            <div>
                <h3>Ficción</h3>
                <ul>
                    <li>El Gran Gatsby - F. Scott Fitzgerald</li>
                    <li>1984 - George Orwell</li>
                    <li>Crónica de una Muerte Anunciada - Gabriel García Márquez</li>
                </ul>
            </div>
            <div>
                <h3>No Ficción</h3>
                <ul>
                    <li>Sapiens: De Animales a Dioses - Yuval Noah Harari</li>
                    <li>Educated - Tara Westover</li>
                    <li>El Poder del Hábito - Charles Duhigg</li>
                </ul>
            </div>
            <div>
                <h3>Infantil</h3>
                <ul>
                    <li>El Principito - Antoine de Saint-Exupéry</li>
                    <li>Harry Potter y la Piedra Filosofal - J.K. Rowling</li>
                    <li>Matilda - Roald Dahl</li>
                </ul>
            </div>
        </div>
    </section>

    <section id="seccion3">
        <h2>Eventos en la Librería</h2>
        <p>Únete a nosotros en una variedad de eventos, como presentaciones de libros, charlas de autores y talleres literarios.</p>
        <ul>
            <li>Presentación de "El Secreto" - 15 de noviembre</li>
            <li>Charla con el autor Carlos Ruiz Zafón - 20 de noviembre</li>
            <li>Taller de escritura creativa - 25 de noviembre</li>
        </ul>
    </section>

    <section id="seccion4">
        <h2>Contacto</h2>
        <p>Para más información, no dudes en ponerte en contacto con nosotros:</p>
        <ul>
            <li>Email: contacto@laplumamagica.com</li>
            <li>Teléfono: +123 456 789</li>
            <li>Dirección: Calle de los Libros, 123, Ciudad</li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2024 Librería "La Pluma Mágica". Todos los derechos reservados.</p>
    </footer>

</body>
</html>
