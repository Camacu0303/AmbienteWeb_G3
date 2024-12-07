<?php
require_once '../Utilidades/Conn.php'; 
$db = new Database();
$conn = $db->getConnection();


$query = "SELECT id_usuario, nombre, email, usuario, privilegio FROM usuario";
$result = $conn->query($query);


$data = [];
while ($user = $result->fetch_assoc()) {
    $data[] = $user;
}


header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
