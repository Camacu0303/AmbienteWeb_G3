<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start(); 
}

// Verifica que el rol esté definido en la sesión
if (!isset($_SESSION['privilegio'])) {
    header("Location: ../Paginas/login.php");
    exit();
}

// Compara el rol del usuario con el rol requerido
if ($_SESSION['privilegio'] !== $requiredRole) {
    if ($_SESSION['privilegio'] === 'admin') {
        // Si el usuario es admin, permite el acceso absoluto a todas las páginas
        // (No se realiza ninguna acción, simplemente continúa la ejecución)
    } else{
        // Si el usuario intenta acceder a una página no permitida, redirige al index
        header("Location: ../Paginas/index.php");
        exit();
    }
}
// Aquí puedes añadir el código para las páginas que requieren privilegios de admin o user
?>

