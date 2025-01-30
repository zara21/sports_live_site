<?php
require_once '../includes/db_connect.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user_id']) || !isset($_POST['channel_id'])) {
    die("Unauthorized access.");
}

$user_id = $_SESSION['user_id'];
$channel_id = intval($_POST['channel_id']);

$sqlCheck = "SELECT * FROM favorites WHERE user_id = :user_id AND channel_id = :channel_id";
$stmtCheck = $pdo->prepare($sqlCheck);
$stmtCheck->execute([
    ':user_id' => $user_id,
    ':channel_id' => $channel_id
]);
$isFavorite = $stmtCheck->fetch() !== false;

if ($isFavorite) {
    $sqlDelete = "DELETE FROM favorites WHERE user_id = :user_id AND channel_id = :channel_id";
    $stmtDelete = $pdo->prepare($sqlDelete);
    $stmtDelete->execute([
        ':user_id' => $user_id,
        ':channel_id' => $channel_id
    ]);
} else {
    $sqlInsert = "INSERT INTO favorites (user_id, channel_id) VALUES (:user_id, :channel_id)";
    $stmtInsert = $pdo->prepare($sqlInsert);
    $stmtInsert->execute([
        ':user_id' => $user_id,
        ':channel_id' => $channel_id
    ]);
}

header("Location: " . $_SERVER['HTTP_REFERER']);
exit;
?>
