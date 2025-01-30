<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$sql = "UPDATE notifications SET is_read = 1 WHERE user_id = :user_id AND is_read = 0";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);

echo json_encode(['status' => 'success']);
?>
