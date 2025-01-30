<?php
require_once '../includes/db_connect.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user_id'])) {
    die("Please login to view your favorites.");
}

$sql = "SELECT c.id, c.name, c.link 
        FROM favorites f
        JOIN channels c ON f.channel_id = c.id
        WHERE f.user_id = :user_id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $_SESSION['user_id']]);
$favorites = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Favorites</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <?php include '../includes/navbar.php'; ?>

    <div class="container mt-4">
        <h1>Your Favorite Channels</h1>
        <?php if (empty($favorites)): ?>
            <div class="alert alert-warning">You have no favorite channels yet.</div>
        <?php else: ?>
            <ul class="list-group">
                <?php foreach ($favorites as $channel): ?>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="<?= htmlspecialchars($channel['link']) ?>" target="_blank"><?= htmlspecialchars($channel['name']) ?></a>
                        <form method="POST" action="../views/toggle_favorite.php">
                            <input type="hidden" name="channel_id" value="<?= htmlspecialchars($channel['id']) ?>">
                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
