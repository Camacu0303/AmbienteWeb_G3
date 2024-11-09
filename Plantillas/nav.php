<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Navbar Example</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
    <div class="navImage"></div>
    <div class="navContainer">
        <form target="#">
            <div class="input-group">
                <input type="text" class="form-control"
                    placeholder="Ingrese un parámetro de búsqueda... Don Quijote de la Mancha">
                <button class="lens" type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </form>
        <div class="login-container">
            <a href="login.php" class="login-button">Iniciar Sesión</a>
        </div>
        <nav>
            <ul class="navbar_ul">
                <li><a href="index.php" class="nav-link">Inicio</a></li>
                <li><a href="Libros.php" class="nav-link">Libros</a></li>
                <li><a href="" class="nav-link">Contactos</a></li>
                <li><a href="" class="nav-link">Preguntas Frecuentes</a></li>
                <li><a href="../Paginas/Perfil.php" class="nav-link">Perfil</a></li>

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
            background-image: url("../Images/image.svg");
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
            background-color: #B79188;
        }

        form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 15px 0;
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
            /* Rounded corners for the button */
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
        }

        button {
            background-color: white;
        }

        nav ul li:last-child {
            margin-right: 0;

        }

    </style>
</body>

</html>