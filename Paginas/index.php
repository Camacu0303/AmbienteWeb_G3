<?php
session_start();
include("../Plantillas/nav.php");
require_once '../Utilidades/Conn.php';
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Explora nuestro blog sobre intercambio de libros, donde compartimos ideas, opiniones y recomendaciones literarias. Conecta con una comunidad apasionada por la lectura.">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <title>Blog - MiLibro.com</title>
</head>

<body>
    <div class="container mt-5">
        <h1 class="text-center">Bienvenidos a MiLibro.com</h1>

        <section class="mt-4">
            <h2>Visión</h2>
            <p>Ser la plataforma líder en el intercambio de libros, promoviendo una cultura sostenible y una comunidad global de lectores apasionados.</p>

            <h2>Misión</h2>
            <p>Facilitar el acceso a libros para todas las personas mediante un sistema colaborativo de intercambio, fomentando el amor por la lectura y el aprendizaje continuo.</p>
        </section>

        <section class="mt-5 mb-5">
            <h2>Explora Nuestro Blog</h2>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="7000">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="dark-overlay"></div>
                        <img src="../Images/library.jpg" class="d-block w-100" alt="Bienvenidos">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Intercambia Libros</h5>
                            <p>Conecta con lectores y comparte tus historias.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="dark-overlay"></div>
                        <img src="../Images/comunity.webp" class="d-block w-100" alt="Comunidad">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Nuestra Comunidad</h5>
                            <p>Únete a una red global de amantes de la lectura.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="dark-overlay"></div>
                        <img src="../Images/blog.png" class="d-block w-100" alt="Blog">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Explora el Blog</h5>
                            <p>Descubre nuevas ideas y recomendaciones literarias.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Anterior</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Siguiente</span>
                </a>
            </div>
        </section>
    </div>
    <style>
        .carousel-caption {
            background-color: rgba(255, 255, 255, 0.34);
            /* Blanco con 70% de opacidad */
            padding: 10px;
            border-radius: 5px;
            /* Opcional: para bordes redondeados */
        }

        .carousel-item .dark-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.27);
            /* Negro con 50% de opacidad */
            z-index: 1;
        }
    </style>
</body>

</html>