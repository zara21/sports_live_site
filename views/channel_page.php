<?php
require_once '../includes/db_connect.php';

// Get the channel slug from the URL
$slug = $_GET['slug'] ?? null;

if (!$slug) {
    die("Channel not specified.");
}

// Fetch channel details from the database
$sql = "SELECT * FROM channels WHERE slug = :slug";
$stmt = $pdo->prepare($sql);
$stmt->execute([':slug' => $slug]);
$channel = $stmt->fetch();

if (!$channel) {
    die("Channel not found.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($channel['name']) ?></title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1><?= htmlspecialchars($channel['name']) ?></h1>
    
    <form method="POST" action="../views/add_to_favorites.php">
        <input type="hidden" name="channel_id" value="<?= htmlspecialchars($channel['id']) ?>">
        <button type="submit">Add to Favorites</button>
    </form>



    <!-- Display live stream -->
    <iframe src="<?= htmlspecialchars($channel['link']) ?>" frameborder="0" width="800" height="450" allowfullscreen></iframe>

    <!-- Include comments section -->
    <?php include 'channel_comments.php'; ?>
</body>
</html>
