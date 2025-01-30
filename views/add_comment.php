<?php
require_once '../includes/db_connect.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$user_id = $_SESSION['user_id'] ?? null;
$channel_id = $_POST['channel_id'] ?? null;
$comment = trim($_POST['comment'] ?? '');

if (!$channel_id || !$comment) {
    echo "Invalid input.";
    exit;
}

if (!$user_id) {
    echo "You need to login to add a comment.";
    exit;
}

// Check user role and comments
$sql = "SELECT role FROM users WHERE id = :user_id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);
$user = $stmt->fetch();

if (!$user) {
    echo "User not found.";
    exit;
}

if ($user['role'] === 'user') {
    // Check if the user has already added a comment today
    $sql = "SELECT COUNT(*) FROM channel_comments WHERE user_id = :user_id AND channel_id = :channel_id AND DATE(created_at) = CURDATE()";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':user_id' => $user_id, ':channel_id' => $channel_id]);
    $comment_count = $stmt->fetchColumn();

    if ($comment_count >= 1) {
        echo "You can only leave one comment as a regular user. Upgrade to premium for more.";
        exit;
    }
}

// Insert comment
$sql = "INSERT INTO channel_comments (user_id, channel_id, comment) VALUES (:user_id, :channel_id, :comment)";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    ':user_id' => $user_id,
    ':channel_id' => $channel_id,
    ':comment' => $comment,
]);

echo "Comment added successfully.";
