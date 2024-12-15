<?php
$requiredRole = 'admin';
require_once "../Utilidades/session_checkout.php";
include("../Plantillas/nav.php");
require_once "../Utilidades/Conn.php";

$db = new Database();
$conn = $db->getConnection();

// Obtener el ID del usuario a editar
$id_usuario = isset($_GET['id']) ? (int)$_GET['id'] : null;

// Validar que el ID del usuario sea válido
if (!$id_usuario) {
    die("ID de usuario no válido.");
}

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

// Obtener información del usuario
$sqlUsuario = "SELECT nombre, email, foto_perfil, telefono, direccion, idioma_preferido, intereses, usuario, pass FROM usuario WHERE id_usuario = ?";
$stmt = $conn->prepare($sqlUsuario);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();
$resultUsuario = $stmt->get_result();

// Verificar si se encontró el usuario
if ($resultUsuario->num_rows === 0) {
    die("Usuario no encontrado.");
}

$usuario = $resultUsuario->fetch_assoc();
$stmt->close();
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
    </style>
</head>
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
<body>
    <div class="profile-container">
        <form action="actualizarCuenta.php" method="POST" enctype="multipart/form-data"
            class="profile-card mx-auto">
            <div class="profile-image">
                <img src="<?php echo isset($usuario['foto_perfil']) && !empty($usuario['foto_perfil']) ? '../uploadsImg/' . htmlspecialchars($usuario['foto_perfil']) : 'https://via.placeholder.com/200.png?text=Sin+agregar'; ?>"
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

    <script>
        $(document).ready(function() {
            $('.select2').select2({
                placeholder: "Selecciona una o más opciones",
                allowClear: true,
                width: '100%'
            });
        });
    </script>
</body>



</html>