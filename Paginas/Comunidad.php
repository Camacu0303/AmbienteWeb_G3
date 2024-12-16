<?php
session_start();
include("../Plantillas/nav.php");
require_once '../Utilidades/Conn.php';

if (!isset($_SESSION['privilegio'])) {
    echo '<p>Inicia sesión o crea una cuenta para acceder a los blogs y a la comunidad.</p>';
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/fontawesome.min.css" integrity="sha512-lauN4D/0AgFUGvmMR+knQnbOADyD/XuQ8VF18I8Ll0+TLvsujshyxvU+uzogmQbSq6qJd5jnUdYtK8ShxXMlSg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
    <div class="container mt-5">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="tab1-tab" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">Blog <i class="fa-regular fa-comment"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="tab2-tab" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Usuarios <i class="fa-solid fa-users"></i></a>
            </li>
        </ul>

        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
                <main>
                    <div id="publicaciones">
                    </div>
                </main>
                <script>
                    let limit = 10;
                    let offset = 0;
                    let cargando = false;

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
                                window.location.href = window.location.href;
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

                                // Si no hay publicaciones en los datos cargados
                                if (data.length === 0) {
                                    if (offset === 0) {
                                        // Si es la primera carga y no hay publicaciones
                                        container.innerHTML = '<p>No hay publicaciones para mostrar.</p>';
                                    }
                                    cargando = false;
                                    return;
                                }

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
            </div>
            <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
                <div style="display: flex; margin-bottom: 10px;">
                    <input type="text" id="username-search" placeholder="Buscar por username" style="flex: 1; padding: 8px; margin-right: 5px; margin-top:15px;">
                    <button id="search-button" style="padding: 8px;">Buscar</button>
                </div>
                <div class="user-list-container" style="max-height: 500px; overflow-y: auto; margin-bottom: 30px;">
                    <div id="user-list">
                        <!-- Datos cargados desde el backend -->
                    </div>
                    <div id="loading" style="text-align: center; display: none;">Cargando...</div>
                </div>
            </div>

            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    const userContainer = document.getElementById("user-list");
                    const loadingIndicator = document.getElementById("loading");
                    const tabContent = document.querySelector("#tab2 .user-list-container");
                    const searchInput = document.getElementById("username-search");
                    const searchButton = document.getElementById("search-button");

                    let offset = 0;
                    const limit = 10; // Número de usuarios por carga
                    let loading = false;
                    let endOfList = false;

                    // Función para cargar usuarios
                    async function loadUsers() {
                        if (loading || endOfList) return;
                        loading = true;
                        loadingIndicator.style.display = "block";

                        const searchQuery = searchInput.value.trim();

                        try {
                            const response = await fetch(`../ScriptsDB/load_users.php?offset=${offset}&limit=${limit}&search=${encodeURIComponent(searchQuery)}`);
                            const data = await response.json();

                            if (data.length === 0) {
                                endOfList = true;
                            } else {
                                offset += data.length; // Solo se incrementa el offset si hay resultados
                                data.forEach(user => {
                                    const userDiv = document.createElement("div");
                                    userDiv.className = "user-item";
                                    userDiv.style.border = "1px solid #ccc";
                                    userDiv.style.margin = "5px 0";
                                    userDiv.style.padding = "10px";

                                    // Verificar si hay foto de perfil, de lo contrario usar placeholder
                                    const photoUrl = user.foto_perfil && user.foto_perfil.trim() !== "" ?
                                        `../uploadsImg/${user.foto_perfil}` :
                                        '../uploadsImg/default.png'; // Cambia esta URL por la de tu imagen de placeholder

                                    // Cambiar el botón de acuerdo a si ya sigue al usuario
                                    const followButton = user.ya_sigue > 0 ?
                                        `<button disabled>Ya sigues a ${user.usuario}</button>` :
                                        `<button onclick="followUser(${user.id_usuario})">Follow</button>`;

                                    userDiv.innerHTML = `
    <img src="${photoUrl}" alt="${user.usuario}" style="width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
    <strong>${user.usuario}</strong>
    <p>Idiomas: ${user.idioma_preferido && user.idioma_preferido.trim() ? user.idioma_preferido : "No establecido"}</p>
    <p>Intereses: ${user.intereses && user.intereses.trim() ? user.intereses : "No establecido"}</p>
    ${followButton}
`;


                                    userContainer.appendChild(userDiv);
                                });
                            }
                        } catch (error) {
                            console.error("Error al cargar usuarios:", error);
                        } finally {
                            loading = false;
                            loadingIndicator.style.display = "none";
                        }
                    }

                    // Manejo del scroll infinito
                    tabContent.addEventListener("scroll", () => {
                        if (tabContent.scrollTop + tabContent.clientHeight >= tabContent.scrollHeight) {
                            loadUsers();
                        }
                    });

                    // Cargar los primeros usuarios al abrir la pestaña
                    document.querySelector("#tab2-tab").addEventListener("click", loadUsers, {
                        once: true
                    });

                    // Función para realizar la búsqueda
                    function performSearch() {
                        // Reiniciar el offset y la lista de usuarios
                        offset = 0; // Reiniciar el offset al buscar
                        endOfList = false;
                        userContainer.innerHTML = ""; // Limpiar la lista existente
                        loadUsers(); // Cargar los usuarios según el nuevo filtro
                    }

                    // Añadir el evento al botón de búsqueda
                    searchButton.addEventListener("click", performSearch);

                    // También permitir búsqueda al presionar "Enter"
                    searchInput.addEventListener("keypress", function(event) {
                        if (event.key === "Enter") {
                            performSearch();
                        }
                    });
                });

                // Función para seguir a un usuario
                async function followUser(idUsuarioSeguido) {
                    try {
                        const response = await fetch('../ScriptsDB/follow_user.php', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                id_usuario_seguido: idUsuarioSeguido,
                                id_usuario_seguidor: <?php echo json_encode($_SESSION['id_usuario']); ?>
                            })
                        });

                        const data = await response.json();
                        if (data.success) {
                            alert("Usuario seguido con éxito.");
                        } else {
                            alert("Error al seguir al usuario: " + data.error);
                        }
                    } catch (error) {
                        console.error("Error al seguir al usuario:", error);
                    }
                }
            </script>




        </div>
    </div>
</body>

</html>