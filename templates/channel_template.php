<?php
require_once '../includes/db_connect.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Check if $slug is set
if (!isset($slug)) {
    echo "Slug not provided.";
    exit;
}

// Fetch the channel details using the slug
$sql = "SELECT * FROM channels WHERE slug = :slug";
$stmt = $pdo->prepare($sql);
$stmt->execute([':slug' => $slug]);
$channel = $stmt->fetch();

if (!$channel) {
    echo "Channel not found.";
    exit;
}

// Check if the channel is already in favorites
$isFavorite = false;
if (isset($_SESSION['user_id'])) {
    $sqlFavorite = "SELECT * FROM favorites WHERE user_id = :user_id AND channel_id = :channel_id";
    $stmtFavorite = $pdo->prepare($sqlFavorite);
    $stmtFavorite->execute([
        ':user_id' => $_SESSION['user_id'],
        ':channel_id' => $channel['id']
    ]);
    $isFavorite = $stmtFavorite->fetch() !== false;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($channel['name']) ?></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <?php include '../includes/navbar.php'; ?>

    <div class="container mt-4">
        <div class="container-header">
            <h1><?= htmlspecialchars($channel['name']) ?></h1>
            <div class="fav-icon-in-container">
                <?php if (isset($_SESSION['user_id'])): ?>
                    <form method="POST" action="../views/toggle_favorite.php">
                        <input type="hidden" name="channel_id" value="<?= htmlspecialchars($channel['id']) ?>">
                        <button type="submit" class="btn <?= $isFavorite ? 'btn-danger' : 'btn-success' ?>">
                            <i class="bi <?= $isFavorite ? 'bi-star-fill' : 'bi-star' ?>"></i>
                        </button>
                    </form>
                <?php else: ?>
                    <!-- შეგიძლიათ დაამატოთ placeholder ელემენტი, თუ მომხმარებელი არ არის შესული -->
                <?php endif; ?>
            </div>
        </div>

          
        <iframe src    ="<?= htmlspecialchars($channel['link']) ?>" frameborder="0" width="900" height="550" allowfullscreen></iframe>

        
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
