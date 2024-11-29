<?php
//Es utilidad de debug, no usar.
session_start(); 

if (!empty($_SESSION)) {
    echo "<h2>Variables de Sesión:</h2>";
    echo "<pre>";
    print_r($_SESSION); // Muestra todas las variables de sesión
    echo "</pre>";
} else {
    echo "No hay variables de sesión establecidas.";
}
?>