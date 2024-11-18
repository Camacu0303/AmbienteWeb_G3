
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
        <p>En nuestra librer�a, encontrar�s una amplia selecci�n de libros de todos los g�neros, desde literatura cl�sica hasta las �ltimas novedades en ciencia ficci�n. Nos especializamos en brindarte experiencias literarias �nicas.</p>
    </section>

    <section id="seccion2">
        <h2>Cat�logo de Libros</h2>
        <div class="content">
            <div>
                <h3>Ficci�n</h3>
                <ul>
                    <li>El Gran Gatsby - F. Scott Fitzgerald</li>
                    <li>1984 - George Orwell</li>
                    <li>Cr�nica de una Muerte Anunciada - Gabriel Garc�a M�rquez</li>
                </ul>
            </div>
            <div>
                <h3>No Ficci�n</h3>
                <ul>
                    <li>Sapiens: De Animales a Dioses - Yuval Noah Harari</li>
                    <li>Educated - Tara Westover</li>
                    <li>El Poder del H�bito - Charles Duhigg</li>
                </ul>
            </div>
            <div>
                <h3>Infantil</h3>
                <ul>
                    <li>El Principito - Antoine de Saint-Exup�ry</li>
                    <li>Harry Potter y la Piedra Filosofal - J.K. Rowling</li>
                    <li>Matilda - Roald Dahl</li>
                </ul>
            </div>
        </div>
    </section>

    <section id="seccion3">
        <h2>Eventos en la Librer�a</h2>
        <p>�nete a nosotros en una variedad de eventos, como presentaciones de libros, charlas de autores y talleres literarios.</p>
        <ul>
            <li>Presentaci�n de "El Secreto" - 15 de noviembre</li>
            <li>Charla con el autor Carlos Ruiz Zaf�n - 20 de noviembre</li>
            <li>Taller de escritura creativa - 25 de noviembre</li>
        </ul>
    </section>

    <section id="seccion4">
        <h2>Contacto</h2>
        <p>Para m�s informaci�n, no dudes en ponerte en contacto con nosotros:</p>
        <ul>
            <li>Email: coder.pruebas.josue@gmail.com</li>
            <li>Tel�fono: +8888-8888</li>
            <li>Direcci�n: La ciudad del corazon</li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2024 "MiLibro.com". Todos los derechos reservados.</p>
    </footer>

</body>
</html>
