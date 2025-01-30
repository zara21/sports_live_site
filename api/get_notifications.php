<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$sql = "SELECT id, message, created_at, is_read FROM notifications WHERE user_id = :user_id ORDER BY is_read ASC, created_at DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);
$notifications = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['status' => 'success', 'notifications' => $notifications]);
?>
