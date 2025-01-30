<?php
// 6. search_channels.php - AJAX ძიების სერვერი
require_once 'includes/db_connect.php';
$query = $_GET['query'] ?? '';
$sql = "SELECT * FROM channels WHERE name LIKE :query";
$stmt = $pdo->prepare($sql);
$stmt->execute([':query' => "%$query%"]);
$results = $stmt->fetchAll();
echo json_encode($results);
?>