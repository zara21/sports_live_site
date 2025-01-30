<?php
require_once '../includes/db_connect.php';
require_once '../includes/session.php';

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Content-Type: application/json');
    echo json_encode(['error' => 'User not logged in.']);
    exit;
}

// Get the logged-in user ID
$user_id = $_SESSION['user_id'];

// Fetch new notifications for the user
$sql = "SELECT id, message, created_at, is_read 
        FROM notifications 
        WHERE user_id = :user_id AND is_read = 0 
        ORDER BY created_at DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);
$notifications = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Mark notifications as read after fetching
if (!empty($notifications)) {
    $sql = "UPDATE notifications SET is_read = 1 WHERE user_id = :user_id AND is_read = 0";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':user_id' => $user_id]);
}

// Return notifications as JSON
header('Content-Type: application/json');
echo json_encode(['notifications' => $notifications]);
exit;
