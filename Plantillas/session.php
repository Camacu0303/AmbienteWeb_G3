<?php
session_start(); 
if (basename($_SERVER['PHP_SELF']) == 'index.php') {
    echo "Estás en index.php";
} else {
    if (!isset($_SESSION['usuario'])) {
        header("Location: ../Paginas/index.php");
        exit(); 
    }
}
?>
