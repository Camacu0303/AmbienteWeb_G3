<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Navbar Example</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
    <div class="navImage"></div>
    <div class="navContainer">
        <form action="Catalogo.php" method="GET">
            <div class="input-group">
                <input type="text" class="form-control" name="busqueda"
                    placeholder="Buscar libros por título, autor o categoría">
                <button class="lens" type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </form>
        <div class="login-container">
            <?php
            if (session_status() === PHP_SESSION_NONE) {
                session_start();
            }
            if (!isset($_SESSION['privilegio'])) {
                echo '<a href="login.php" class="login-button">Iniciar Sesión</a>';
            } else {
                echo '<a href="../Utilidades/ClearSessionVars.php" class="login-button">Cerrar Sesión</a>';
            }
            ?>
        </div>

        <?php
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $menuItems = [
            ['href' => 'index.php', 'label' => 'Inicio'],
            ['href' => 'Comunidad.php', 'label' => 'Comunidad'],
            ['href' => 'Catalogo.php', 'label' => 'Libros y documentos'],
            ['href' => 'Contact.php', 'label' => 'Contacto'],
            ['href' => 'Perfil.php', 'label' => 'Perfil'],
            ['href' => 'QA.php', 'label' => 'Preguntas Frecuentes']
        ];
        // Agregar "Gestionar Usuarios" si es administrador
        if (isset($_SESSION['privilegio']) && $_SESSION['privilegio'] === 'admin') {
            $menuItems[] = ['href' => 'Administracion.php', 'label' => 'Administración'];
        }
        ?>
        <nav>
            <ul class="navbar_ul">
                <?php foreach ($menuItems as $item): ?>
                    <li><a href="<?= $item['href'] ?>" class="nav-link"><?= $item['label'] ?></a></li>
                <?php endforeach; ?>
            </ul>
        </nav>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const currentPage = window.location.pathname.split("/").pop();
        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            if (link.getAttribute('href') === currentPage) {
                link.classList.add('active');
            }
        });
    </script>
    <style>
        .active {
            border-bottom: 2px solid black;
        }

        .lens {
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px;
            border: 0px;
        }

        .navImage {
            height: 300px;
            width: 100%;
            background-image: url("../Images/Libros.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }

        body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        .navContainer {
            height: 30%;
            width: 100%;
            background-color: #605bab;
        }

        form {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        form .input-group {
            width: 50%;
            padding-top: 15px;
        }

        form .form-control {
            border-radius: 15px 0 0 15px;
            border: none;
            padding: 10px;
        }

        form .btn {
            border-radius: 0 15px 15px 0;
            border: none;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
            margin-top: 15px;
            padding-bottom: 15px;
        }

        nav ul li {
            margin-right: 50px;
            color: white;
        }

        button {
            background-color: white;
        }

        nav ul li:last-child {
            margin-right: 0;

        }

        .login-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .login-button {
            padding: 8px 12px;
            background-color: #605BAB;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }

        .login-button:hover {
            background-color: #7e7ba8;
        }

        .nav-link:hover {
            background-color: #7e7ba8;
        }
    </style>
</body>

</html>