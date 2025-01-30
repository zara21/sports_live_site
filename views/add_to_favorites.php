<?php
require_once '../includes/db_connect.php';
require_once '../includes/session.php';

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to add a favorite channel.");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id'];
    $channel_id = (int)$_POST['channel_id'];

    // Check if the channel is already a favorite
    $sql = "SELECT COUNT(*) FROM favorites WHERE user_id = :user_id AND channel_id = :channel_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':user_id' => $user_id, ':channel_id' => $channel_id]);
    $exists = $stmt->fetchColumn();

    if ($exists) {
        die("This channel is already in your favorites.");
    }

    // Add the channel to favorites
    $sql = "INSERT INTO favorites (user_id, channel_id) VALUES (:user_id, :channel_id)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':user_id' => $user_id, ':channel_id' => $channel_id]);

    echo "Channel added to favorites successfully!";
    header("Location: ../views/favorites.php");
    exit;
}
?>
