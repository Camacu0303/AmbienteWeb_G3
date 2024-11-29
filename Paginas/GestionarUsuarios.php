<?php
$requiredRole = 'admin'; 
require_once "../Utilidades/session_checkout.php";
include("../Plantillas/nav.php");
?><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-k6RqeWeci5ZR/Lv4MR0sA0FfDOM1qya3hE2D8A1RZ/g5K81+0Qw9Nx2RQjb9gZzCD5yZK10A/GoN+pLmr21Z+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<table id="usuariosTable" class="display">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Usuario</th>
            <th>Privilegio</th>
            <th>Acciones</th> <!-- New column for actions -->
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
                "dataSrc": "" // Use empty string to directly map to the response
            },
            "columns": [
                { "data": "id_usuario" },
                { "data": "nombre" },
                { "data": "email" },
                { "data": "usuario" },
                { "data": "privilegio" },
                { "data": null, "render": function(data, type, row) {
                    return `
                        <a href="edit_user.php?id=${row.id_usuario}" class="edit-link"><i class="fas fa-edit"></i> Editar</a>
                        <a href="#" class="delete-link" data-id="${row.id_usuario}"><i class="fas fa-trash-alt"></i> Eliminar</a>
                    `;
                }} // Render action links
            ],
            "paging": true,
            "searching": true,
            "lengthChange": true,
            "pageLength": 10
        });

        // Event listener for delete links
        $('#usuariosTable tbody').on('click', '.delete-link', function(e) {
            e.preventDefault(); // Prevent default link behavior
            var userId = $(this).data('id');
            if (confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
                // Call delete function (e.g., via AJAX)
                $.ajax({
                    url: '../ScriptsDB/delete_user.php',
                    type: 'POST',
                    data: { id: userId },
                    success: function(response) {
                        // Reload DataTable or handle response
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

</body>
</html>
