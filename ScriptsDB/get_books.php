<?php
require_once "../Utilidades/Conn.php";

// Conexión a la base de datos
$db = new Database();
$conn = $db->getConnection();

// Parámetros de DataTable
$draw = $_POST['draw'];
$start = $_POST['start'];
$length = $_POST['length'];
$searchValue = $_POST['search']['value'];

// Contar todos los libros
$totalQuery = "SELECT COUNT(*) AS total FROM libro";
$totalResult = $conn->query($totalQuery);
$totalBooks = $totalResult->fetch_assoc()['total'];

// Filtrar libros si hay búsqueda
$searchQuery = "";
if (!empty($searchValue)) {
    $searchQuery = "WHERE titulo LIKE ? OR autor LIKE ?";
}

// Obtener libros con paginación y filtrado
$query = "
    SELECT id_libro, titulo, autor
    FROM libro
    $searchQuery
    LIMIT ?, ?
";

$stmt = $conn->prepare($query);

if (!empty($searchValue)) {
    $searchValue = "%$searchValue%";
    $stmt->bind_param("ssii", $searchValue, $searchValue, $start, $length);
} else {
    $stmt->bind_param("ii", $start, $length);
}

$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

// Contar los libros filtrados
$filteredQuery = "SELECT COUNT(*) AS total FROM libro $searchQuery";
$filteredStmt = $conn->prepare($filteredQuery);
if (!empty($searchValue)) {
    $filteredStmt->bind_param("ss", $searchValue, $searchValue);
}
$filteredStmt->execute();
$filteredResult = $filteredStmt->get_result();
$totalFilteredBooks = $filteredResult->fetch_assoc()['total'];

// Respuesta para DataTable
$response = [
    "draw" => intval($draw),
    "recordsTotal" => intval($totalBooks),
    "recordsFiltered" => intval($totalFilteredBooks),
    "data" => $data
];

echo json_encode($response);

$stmt->close();
$conn->close();
?>
