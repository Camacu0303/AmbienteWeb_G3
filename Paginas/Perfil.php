<?php
$requiredRole = 'usuario';
require_once "../Utilidades/session_checkout.php";
include("../Plantillas/nav.php");
require_once "../Utilidades/Conn.php";

$db = new Database();
$conn = $db->getConnection();

// Obtener las categorías
$sqlCategorias = "SELECT id_categoria, nombre FROM categoria";
$resultCategorias = $conn->query($sqlCategorias);

$categorias = [];
while ($row = $resultCategorias->fetch_assoc()) {
    $categorias[] = $row;
}

// Obtener los estados
$sqlEstados = "SELECT id_estado, nombre FROM estado_libro";
$resultEstados = $conn->query($sqlEstados);

// Obtener los idiomas
$sqlIdiomas = "SELECT id_idioma, nombre FROM idiomas";
$resultIdiomas = $conn->query($sqlIdiomas);

// Obtener los libros del usuario
$id_usuario = isset($_SESSION['id_usuario']) ? $_SESSION['id_usuario'] : null;
$misLibros = [];
if ($id_usuario) {
    // Obtener información del usuario
    $sqlUsuario = "SELECT nombre, email, foto_perfil, telefono, direccion, idioma_preferido, intereses, usuario, pass FROM usuario WHERE id_usuario = ?";
    $stmt = $conn->prepare($sqlUsuario);
    $stmt->bind_param("i", $id_usuario);
    $stmt->execute();
    $resultUsuario = $stmt->get_result();
    $usuario = $resultUsuario->fetch_assoc();
    $stmt->close();
}

if ($id_usuario) {
    $sqlMisLibros = "SELECT id_libro, titulo, autor, descripcion, archivo, imagen FROM libro WHERE id_usuario = ?";
    $stmt = $conn->prepare($sqlMisLibros);
    $stmt->bind_param("i", $id_usuario);
    $stmt->execute();
    $resultMisLibros = $stmt->get_result();

    while ($row = $resultMisLibros->fetch_assoc()) {
        $misLibros[] = $row;
    }

    $stmt->close();
}

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" <link>
    <!-- CSS de Select2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet" />

    <!-- JS de Select2 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            background-color: #f4f4f4;
            text-align: center;

        }

        .tab-container {
            width: 90%;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: auto;
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

        .profile-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .profile-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .profile-image img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .profile-details {
            width: 100%;
            text-align: left;
        }

        .profile-details .form-label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .profile-details .form-control {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
            font-size: 14px;
            margin-bottom: 15px;
            width: 100%;
        }

        button.btn-primary {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button.btn-primary:hover {
            background-color: #0056b3;
        }

        input[type="file"] {
            font-size: 14px;
            color: #666;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 5px;
            background-color: #f8f9fa;
            margin-top: 10px;
            width: 100%;
            cursor: pointer;
        }

        .card-img-top {
            width: auto;
            height: 150px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <div class="tab-container">
        <div class="tab-list">
            <button class="tab-button active" data-target="tab1">Cuenta</button>
            <button class="tab-button" data-target="tab2">Subir documento</button>
            <button class="tab-button" data-target="tab3">Historial de trueques</button>
            <button class="tab-button" data-target="tab4">Mis libros y documentos</button>
        </div>
        <div class="tab-content">

            <!-- Cuenta -->
            <div id="tab1" class="tab-panel active">
                <h2>Cuenta</h2>
                <div class="profile-container">
                    <form action="actualizarCuenta.php" method="POST" enctype="multipart/form-data"
                        class="profile-card mx-auto">
                        <div class="profile-image">
                            <img src="../uploadsImg/<?php echo isset($usuario['foto_perfil']) ? htmlspecialchars($usuario['foto_perfil']) : 'default.png'; ?>"
                                alt="Imagen de perfil" class="rounded-circle" width="150">
                            <input type="file" name="foto_perfil" class="form-control mt-3">
                        </div>
                        <div class="profile-details">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <input type="text" id="nombre" name="nombre"
                                value="<?php echo htmlspecialchars($usuario['nombre']); ?>" class="form-control mb-3">

                            <label for="email" class="form-label">Email:</label>
                            <input type="email" id="email" name="email"
                                value="<?php echo htmlspecialchars($usuario['email']); ?>" class="form-control mb-3">

                            <label for="usuario" class="form-label">Nombre de Usuario:</label>
                            <input type="text" id="usuario" name="usuario"
                                value="<?php echo htmlspecialchars($usuario['usuario']); ?>" class="form-control">

                            <label for="pass" class="form-label">Nueva Contraseña:</label>
                            <input type="password" id="pass" name="pass" class="form-control">

                            <label for="telefono" class="form-label">Teléfono:</label>
                            <input type="text" id="telefono" name="telefono"
                                value="<?php echo htmlspecialchars($usuario['telefono']); ?>" class="form-control mb-3">

                            <label for="direccion" class="form-label">Dirección:</label>
                            <textarea id="direccion" name="direccion"
                                class="form-control mb-3"><?php echo htmlspecialchars($usuario['direccion']); ?></textarea>

                            <!-- Idiomas Preferidos -->
                            <label for="idioma_preferido" class="form-label">Idiomas Preferidos:</label>
                            <select id="idioma_preferido" name="idioma_preferido[]" class="form-control select2 mb-3"
                                multiple>
                                <?php
                                $idiomasSeleccionados = explode(',', $usuario['idioma_preferido']);
                                while ($idioma = $resultIdiomas->fetch_assoc()) {
                                    $selected = in_array($idioma['nombre'], $idiomasSeleccionados) ? 'selected' : '';
                                    echo "<option value=\"" . htmlspecialchars($idioma['nombre']) . "\" $selected>" . htmlspecialchars($idioma['nombre']) . "</option>";
                                }
                                ?>
                            </select>

                            <label for="intereses" class="form-label">Intereses:</label>
                            <select id="intereses" name="intereses[]" class="form-control select2 mb-3" multiple>
                                <?php
                                $interesesSeleccionados = explode(',', $usuario['intereses']);
                                foreach ($categorias as $categoria) {
                                    $selected = in_array($categoria['nombre'], $interesesSeleccionados) ? 'selected' : '';
                                    echo "<option value=\"" . htmlspecialchars($categoria['nombre']) . "\" $selected>" . htmlspecialchars($categoria['nombre']) . "</option>";
                                }
                                ?>
                            </select>

                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $('.select2').select2({
                        placeholder: "Selecciona una o más opciones",
                        allowClear: true,
                        width: '100%'
                    });
                });
            </script>


            <!-- Subir Documento  -->
            <div id="tab2" class="tab-panel">
                <h2 style="text-align: center; margin-bottom: 20px;">Subir documento</h2>
                <form action="libro.php" method="post" enctype="multipart/form-data"
                    style="max-width: 800px; margin: 0 auto; display: grid; grid-template-columns: 1fr 2fr; gap: 15px; align-items: center;">
                    <!-- Título -->
                    <label for="titulo" style="font-weight: bold;">Título del libro:</label>
                    <input type="text" id="titulo" name="titulo"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required>

                    <!-- Autor -->
                    <label for="autor" style="font-weight: bold;">Autor:</label>
                    <input type="text" id="autor" name="autor"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required>

                    <!-- Categoría -->
                    <label for="categoria" style="font-weight: bold;">Categoría:</label>
                    <select id="categoria" name="id_categoria"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required>
                        <?php foreach ($categorias as $categoria): ?>
                            <option value="<?php echo $categoria['id_categoria']; ?>">
                                <?php echo htmlspecialchars($categoria['nombre']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>

                    <!-- Estado -->
                    <label for="estado" style="font-weight: bold;">Estado del libro:</label>
                    <select id="estado" name="id_estado"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required>
                        <?php while ($row = $resultEstados->fetch_assoc()): ?>
                            <option value="<?php echo $row['id_estado']; ?>"><?php echo htmlspecialchars($row['nombre']); ?>
                            </option>
                        <?php endwhile; ?>
                    </select>

                    <!-- Descripción -->
                    <label for="descripcion" style="font-weight: bold;">Descripción:</label>
                    <textarea id="descripcion" name="descripcion" rows="3"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required></textarea>

                    <!-- Archivo -->
                    <label for="archivo" style="font-weight: bold;">Seleccionar archivo (PDF/Word):</label>
                    <input type="file" id="archivo" name="archivo" accept=".pdf,.doc,.docx" class="form-control"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required>

                    <!-- Imagen -->
                    <label for="imagen" style="font-weight: bold;">Imagen del libro:</label>
                    <input type="file" id="imagen" name="imagen" accept="image/*" class="form-control"
                        style="padding: 10px; border: 1px solid #ccc; border-radius: 4px;" required>

                    <!-- Botón -->
                    <div></div>
                    <button type="submit"
                        style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer;">Subir</button>
                </form>
            </div>

            <div id="tab3" class="tab-panel">
                <h2>Historial de trueques</h2>
                <p>Contenido relacionado con el historial de trueques.</p>
            </div>

            <div id="tab4" class="tab-panel">
                <h2>Mis libros y documentos</h2>
                <?php if (!empty($misLibros)): ?>
                    <div class="container mt-4">
                        <div class="row">
                            <?php foreach ($misLibros as $libro): ?>
                                <div class="col-md-4 mb-4">
                                    <div class="card shadow-sm h-100" style="min-height: 250px;">

                                        <!-- Imagen del libro -->
                                        <img src="../uploadsLib/<?php echo !empty($libro['imagen']) ? htmlspecialchars($libro['imagen']) : 'default-image.png'; ?>"
                                            alt="Imagen del libro" class="card-img-top"
                                            style="height: 150px; object-fit: cover;">


                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-title"><?php echo htmlspecialchars($libro['titulo']); ?></h5>
                                            <p class="card-text"><strong>Autor:</strong>
                                                <?php echo htmlspecialchars($libro['autor']); ?></p>
                                            <p class="card-text"><?php echo htmlspecialchars($libro['descripcion']); ?></p>
                                            <div class="mt-auto d-flex justify-content-between">
                                                <!-- Botón de Editar -->
                                                <a href="editarLibro.php?id=<?php echo htmlspecialchars($libro['id_libro']); ?>"
                                                    class="btn btn-warning btn-sm">Editar</a>
                                                <!-- Botón de Borrar -->
                                                <form action="borrarLibro.php" method="POST"
                                                    onsubmit="return confirm('¿Estás seguro de que deseas eliminar este libro?');">
                                                    <input type="hidden" name="id"
                                                        value="<?php echo htmlspecialchars($libro['id_libro']); ?>">
                                                    <button type="submit" class="btn btn-danger btn-sm">Borrar</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                <?php else: ?>
                    <p>No has subido ningún libro o documento todavía.</p>
                <?php endif; ?>
            </div>

            <script>
                const buttons = document.querySelectorAll('.tab-button');
                const panels = document.querySelectorAll('.tab-panel');

                buttons.forEach(button => {
                    button.addEventListener('click', () => {

                        buttons.forEach(btn => btn.classList.remove('active'));
                        panels.forEach(panel => panel.classList.remove('active'));

                        button.classList.add('active');
                        const target = document.getElementById(button.dataset.target);
                        target.classList.add('active');
                    });
                });

            </script>
            <?php if (isset($_SESSION['mensaje'])): ?>
                <div class="modal fade" id="mensajeModal" tabindex="-1" aria-labelledby="mensajeModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="mensajeModalLabel">Notificación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <?php echo htmlspecialchars($_SESSION['mensaje']); ?>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script>

                    document.addEventListener('DOMContentLoaded', () => {
                        const modal = new bootstrap.Modal(document.getElementById('mensajeModal'));
                        modal.show();
                    });
                </script>
                <?php unset($_SESSION['mensaje']);
                ?>
            <?php endif; ?>
</body>

</html>