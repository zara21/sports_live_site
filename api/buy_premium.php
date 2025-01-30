<?php
session_start();
require_once '../includes/db_connect.php';

// Ensure user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'You must be logged in to activate premium.']);
    exit;
}

$user_id = $_SESSION['user_id'];

// Check current subscription
$sql = "SELECT subscription_type FROM users WHERE id = :user_id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);
$user = $stmt->fetch();

if ($user && $user['subscription_type'] === 'premium') {
    echo json_encode(['status' => 'error', 'message' => 'Already a premium member.']);
    exit;
}

// Update subscription
$sql = "UPDATE users SET subscription_type = 'premium', subscription_started_at = NOW(), subscription_expires_at = DATE_ADD(NOW(), INTERVAL 1 MONTH) WHERE id = :user_id";
$stmt = $pdo->prepare($sql);
if ($stmt->execute([':user_id' => $user_id])) {
    echo json_encode(['status' => 'success', 'message' => 'Successfully upgraded to premium.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error updating subscription.']);
}
?>
