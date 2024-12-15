<?php
$requiredRole = 'admin';
require_once "../Utilidades/session_checkout.php";
include("../Plantillas/nav.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tab View</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-k6RqeWeci5ZR/Lv4MR0sA0FfDOM1qya3hE2D8A1RZ/g5K81+0Qw9Nx2RQjb9gZzCD5yZK10A/GoN+pLmr21Z+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            background-color: #f4f4f4;
            display: table;
            text-align: center;
        }

        .tab-container {
            width: 90%;
            height: 60%;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: auto;
            display: inline-block;
            text-align: left;
        }

        .tab-list {
            background-color: #f8f9fa;
            border-right: 1px solid #ddd;
            display: flex;
            flex-direction: row;
        }

        .tab-list button {
            padding: 15px;
            border: none;
            border-bottom: 1px solid #ddd;
            background-color: #f8f9fa;
            text-align: left;
            font-size: 16px;
            cursor: pointer;
            outline: none;
            transition: background-color 0.3s;
        }

        .tab-list button:hover {
            background-color: #e9ecef;
        }

        .tab-list button.active {
            background-color: #007bff;
            color: white;
        }

        .tab-content {
            margin: 15px;
        }

        .tab-panel {
            display: none;
        }

        .tab-panel.active {
            display: block;
        }

        .form-control {
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <div class="tab-container">
        <div class="tab-list">
            <button class="tab-button active" data-target="tab1">Gestión de usuarios</button>
            <button class="tab-button" data-target="tab2">Gestión de Libros y Documentos</button>
            <button class="tab-button" data-target="tab3">Gestión de Categorías</button>
            <button class="tab-button" data-target="tab4">Estadísticas de uso</button>
        </div>
        <div class="tab-content">
            <div id="tab1" class="tab-panel active">
                <h2>Gestión de usuarios</h2>
                <div>
                    <table id="usuariosTable" class="display">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Email</th>
                                <th>Usuario</th>
                                <th>Privilegio</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- DataTables will populate this -->
                        </tbody>
                    </table>
                    <script>
                        $(document).ready(function() {
                            $('#usuariosTable').DataTable({
                                "processing": true,
                                "ajax": {
                                    "url": "../ScriptsDB/get_users.php",
                                    "type": "POST",
                                    "dataSrc": ""
                                },
                                "columns": [{
                                        "data": "id_usuario"
                                    },
                                    {
                                        "data": "nombre"
                                    },
                                    {
                                        "data": "email"
                                    },
                                    {
                                        "data": "usuario"
                                    },
                                    {
                                        "data": "privilegio"
                                    },
                                    {
                                        "data": null,
                                        "render": function(data, type, row) {
                                            return `
                                                <a href="edit_user.php?id=${row.id_usuario}" class="edit-link"><i class="fas fa-edit"></i> Editar</a>
                                                <a href="#" class="delete-link" data-id="${row.id_usuario}"><i class="fas fa-trash-alt"></i> Eliminar</a>
                                            `;
                                        }
                                    }
                                ],
                                "paging": true,
                                "searching": true,
                                "lengthChange": true,
                                "pageLength": 10
                            });

                            $('#usuariosTable tbody').on('click', '.delete-link', function(e) {
                                e.preventDefault();
                                var userId = $(this).data('id');
                                if (confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
                                    $.ajax({
                                        url: '../ScriptsDB/delete_user.php',
                                        type: 'POST',
                                        data: {
                                            id: userId
                                        },
                                        success: function(response) {
                                            $('#usuariosTable').DataTable().ajax.reload();
                                        },
                                        error: function() {
                                            alert("Error al eliminar el usuario.");
                                        }
                                    });
                                }
                            });
                        });
                    </script>
                </div>
            </div>

            <div id="tab2" class="tab-panel">
                <h2>Gestión de Libros y Documentos</h2>
                <p>En construcción</p>
            </div>

            <div id="tab3" class="tab-panel">
                <h2>Gestión de categorías</h2>
                <div>
                    <h3>Añadir Nueva Categoría</h3>
                    <form id="addCategoryForm">
                        <input type="text" class="form-control" id="nombre_categoria" name="nombre_categoria" placeholder="Nombre de la categoría" required>
                        <button type="submit" class="btn btn-primary">Agregar Categoría</button>
                    </form>
                    <table id="categoriasTable" class="display">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- DataTables will populate this -->
                        </tbody>
                    </table>
                    <script>
                        $(document).ready(function() {
                            // Initialize categories DataTable
                            const categoriasTable = $('#categoriasTable').DataTable({
                                "processing": true,
                                "ajax": {
                                    "url": "../ScriptsDB/get_categories.php",
                                    "type": "POST",
                                    "dataSrc": ""
                                },
                                "columns": [{
                                        "data": "id_categoria"
                                    },
                                    {
                                        "data": "nombre"
                                    },
                                    {
                                        "data": null,
                                        "render": function(data, type, row) {
                                            return `
                                                <a href="edit_category.php?id=${row.id_categoria}" class="edit-link"><i class="fas fa-edit"></i> Editar</a>
                                                <a href="#" class="delete-link" data-id="${row.id_categoria}"><i class="fas fa-trash-alt"></i> Borrar</a>
                                            `;
                                        }
                                    }
                                ],
                                "paging": true,
                                "searching": true,
                                "lengthChange": true,
                                "pageLength": 10
                            });

                            // Add category form submission
                            $('#addCategoryForm').on('submit', function(e) {
                                e.preventDefault();
                                const nombreCategoria = $('#nombre_categoria').val();
                                $.ajax({
                                    url: '../ScriptsDB/add_category.php',
                                    type: 'POST',
                                    data: {
                                        nombre: nombreCategoria
                                    },
                                    success: function(response) {
                                        $('#categoriasTable').DataTable().ajax.reload();
                                        $('#nombre_categoria').val(''); // Clear input
                                    },
                                    error: function() {
                                        alert("Error al agregar la categoría.");
                                    }
                                });
                            });

                            // Event listener for delete links
                            $('#categoriasTable tbody').on('click', '.delete-link', function(e) {
                                e.preventDefault();
                                var categoryId = $(this).data('id');
                                if (confirm("¿Estás seguro de que deseas eliminar esta categoría?")) {
                                    $.ajax({
                                        url: '../ScriptsDB/delete_category.php',
                                        type: 'POST',
                                        data: {
                                            id: categoryId
                                        },
                                        success: function(response) {
                                            $('#categoriasTable').DataTable().ajax.reload();
                                        },
                                        error: function() {
                                            alert("Error al eliminar la categoría.");
                                        }
                                    });
                                }
                            });
                        });
                    </script>
                </div>
            </div>

            <div id="tab4" class="tab-panel">
                <h2>Estadísticas de uso</h2>
                <p>En construcción...</p>
            </div>
        </div>
    </div>

    <script>
        const buttons = document.querySelectorAll('.tab-button');
        const panels = document.querySelectorAll('.tab-panel');

        buttons.forEach(button => {
            button.addEventListener('click', () => {
                // Remove active class from all buttons and panels
                buttons.forEach(btn => btn.classList.remove('active'));
                panels.forEach(panel => panel.classList.remove('active'));

                // Add active class to clicked button and corresponding panel
                button.classList.add('active');
                const target = document.getElementById(button.dataset.target);
                target.classList.add('active');
            });
        });
    </script>
</body>

</html>
