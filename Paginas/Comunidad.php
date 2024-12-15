<?php
session_start();
include("../Plantillas/nav.php");
require_once '../Utilidades/Conn.php';

if (!isset($_SESSION['privilegio'])) {
    echo '<p>Inicia sesión o crea una cuenta para ver las publicaciones del blog.</p>';
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title>Blog - MiLibro.com</title>
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

        #publicaciones {
            margin: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
        }

        .publicacion {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }

        .publicacion h3 {
            margin: 0 0 10px;
        }

        .publicacion small {
            color: #666;
        }

        .comentarios {
            margin-top: 10px;
            display: none;

            padding-left: 10px;

            border-left: 2px solid #ddd;

        }

        .comentarios .comentario {
            margin-bottom: 15px;

            padding-left: 10px;

            position: relative;

        }

        .comentarios .comentario::after {
            content: "";

            display: block;
            height: 1px;

            background-color: #ddd;

            margin-top: 10px;

            position: absolute;

            left: 0;

            right: 0;

            bottom: 0;

        }

        .comentarios .comentario:last-child::after {
            display: none;

        }

        .comentarios .autor {
            font-weight: bold;

        }

        .comentarios .fecha {
            color: #666;

            font-size: 0.9em;

        }


        .form-comentario {
            margin-top: 10px;
            display: none;

        }

        .form-comentario textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .form-comentario button {
            padding: 8px 12px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #btnAgregar {
            position: fixed;
            bottom: 20px;
            right: 25px;
            z-index: 1000;
            background-color: #605BAB;
            color: #FFF;
        }

        #btnAgregar:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <main>
        <div id="publicaciones">
        </div>
    </main>
    <script>
        let limit = 10;
        let offset = 0;
        let cargando = false;
        //Falta montar.!!!!
        function agregarPublicacion() {
            const titulo = document.getElementById('titulo').value.trim();
            const contenido = document.getElementById('contenido').value.trim();

            if (!titulo || !contenido) {
                alert("Por favor, completa todos los campos.");
                return;
            }

            fetch('../ScriptsDB/crear_publicaciones.php', { // Asegúrate de que la ruta sea correcta
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        titulo: titulo,
                        contenido: contenido
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        alert(data.error);
                        return;
                    }
                    alert(data.message); // Mensaje de éxito
                    document.getElementById('formAgregar').reset();
                    cargarPublicaciones(); // Actualiza la lista de publicaciones
                    const modal = bootstrap.Modal.getInstance(document.getElementById('miModal'));
                    modal.hide(); // Cierra el modal
                })
                .catch(error => {
                    console.error('Error al agregar publicación:', error);
                });
        }



        function cargarPublicaciones() {
            if (cargando) return;
            cargando = true;

            fetch(`../ScriptsDB/cargar_publicaciones.php?limit=${limit}&offset=${offset}`)
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        alert(data.error);
                        return;
                    }

                    const container = document.getElementById('publicaciones');
                    data.forEach(pub => {
                        const div = document.createElement('div');
                        div.classList.add('publicacion');
                        div.innerHTML = `
                            <h3>${pub.titulo}</h3>
                            <p>${pub.contenido}</p>
                            <small>Publicado por ${pub.autor} el ${pub.fecha_publicacion}</small>
                            <div>
                                <p>${pub.cantidad_comentarios} comentario(s)</p>
                                <div class="comentarios" id="comentarios-${pub.id_blog}"></div>
                                <button onclick="mostrarComentarios(${pub.id_blog})">Mostrar Comentarios</button>
                                <button onclick="toggleComentarioForm(${pub.id_blog})">Agregar Comentario</button>
                                <div class="form-comentario" id="form-comentario-${pub.id_blog}">
                                    <textarea placeholder="Escribe un comentario..." id="contenido-comentario-${pub.id_blog}"></textarea>
                                    <button onclick="escribirComentario(${pub.id_blog})">Enviar Comentario</button>
                                </div>
                            </div>
                        `;
                        container.appendChild(div);
                    });
                    offset += limit;
                    cargando = false;
                })
                .catch(error => {
                    console.error('Error al cargar publicaciones:', error);
                    cargando = false;
                });
        }

        function mostrarComentarios(idBlog) {
            const comentariosDiv = document.getElementById(`comentarios-${idBlog}`);
            if (comentariosDiv.style.display === "none" || comentariosDiv.style.display === "") {
                comentariosDiv.style.display = "block";
                fetch(`../ScriptsDB/cargar_comentarios.php?id_blog=${idBlog}`)
                    .then(response => response.json())
                    .then(comentarios => {
                        comentariosDiv.innerHTML = "";
                        if (comentarios.length === 0) {
                            comentariosDiv.innerHTML = "<p>No hay comentarios.</p>";
                        } else {
                            comentarios.forEach(com => {
                                const comentarioDiv = document.createElement('div');
                                comentarioDiv.classList.add('comentario');


                                comentarioDiv.innerHTML = `
                            <div class="autor">${com.autor}</div>
                            <div>${com.contenido} <span class="fecha">${com.fecha_comentario}</span></div>`;
                                comentariosDiv.appendChild(comentarioDiv);
                            });
                        }
                    })
                    .catch(error => {
                        console.error('Error al cargar comentarios:', error);
                    });
            } else {
                comentariosDiv.style.display = "none";
            }
        }



        function toggleComentarioForm(idBlog) {
            const formComentario = document.getElementById(`form-comentario-${idBlog}`);
            formComentario.style.display = (formComentario.style.display === "block") ? "none" : "block";
        }


        function escribirComentario(idBlog) {
            const contenido = document.getElementById(`contenido-comentario-${idBlog}`).value.trim();
            if (!contenido) {
                alert("Por favor, escribe un comentario.");
                return;
            }

            fetch(`../ScriptsDB/escribir_comentario.php`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        id_blog: idBlog,
                        contenido: contenido,
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        alert(data.error);
                        return;
                    }


                    const comentariosDiv = document.getElementById(`comentarios-${idBlog}`);
                    const p = document.createElement('p');
                    p.textContent = `${data.contenido} - ${data.fecha_comentario}`;
                    comentariosDiv.appendChild(p);


                    document.getElementById(`contenido-comentario-${idBlog}`).value = "";

                    comentariosDiv.style.display = "block";
                })
                .catch(error => {
                    console.error('Error al escribir comentario:', error);
                });
        }


        window.addEventListener('scroll', () => {
            if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
                cargarPublicaciones();
            }
        });

        document.addEventListener('DOMContentLoaded', cargarPublicaciones);
    </script>
    <?php if (isset($_SESSION['privilegio'])): ?>
        <button id="btnAgregar" data-toggle="modal" data-target="#miModal" style="width: 150px; height: 50px; display: flex; align-items: center; justify-content: center; border-radius: 5px;">
            <span style="margin-right: 5px;">+</span> Agregar
        </button>
    <?php endif; ?>
    <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Agregar Publicación</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formAgregar" class="row g-3">
                        <!-- Campo Título -->
                        <div class="col-12">
                            <label for="titulo" class="form-label">Título</label>
                            <input type="text" class="form-control border border-secondary" id="titulo" placeholder="Escribe un título..." required>
                        </div>
                        <!-- Campo Contenido -->
                        <div class="col-12">
                            <label for="contenido" class="form-label">Contenido</label>
                            <textarea class="form-control border border-secondary" id="contenido" rows="3" placeholder="Escribe el contenido aquí..." required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="col-12 d-flex justify-content-end">
                        <button type="button" class="btn btn-primary" onclick="agregarPublicacion()">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



</body>

</html>