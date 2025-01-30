<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$current_password = $_POST['current_password'];
$new_password = $_POST['new_password'];
$confirm_password = $_POST['confirm_password'];

if ($new_password !== $confirm_password) {
    echo json_encode(['status' => 'error', 'message' => 'Passwords do not match']);
    exit;
}

$sql = "SELECT password FROM users WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':id' => $user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!password_verify($current_password, $user['password'])) {
    echo json_encode(['status' => 'error', 'message' => 'Current password is incorrect']);
    exit;
}

$new_password_hashed = password_hash($new_password, PASSWORD_BCRYPT);
$sql = "UPDATE users SET password = :password WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':password' => $new_password_hashed, ':id' => $user_id]);

echo json_encode(['status' => 'success']);
