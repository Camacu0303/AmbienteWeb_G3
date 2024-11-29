<?php 
session_start();
session_unset(); // Libera todas las variables de sesión

// Opcional: Destruir la sesión
// session_destroy(); // Descomenta esto si también quieres destruir la sesión

// Verificar si las variables de sesión están limpias
if (empty($_SESSION)) {
    echo "Las variables de sesión han sido limpiadas.";
} else {
    echo "Las variables de sesión aún contienen datos.";
}
?>