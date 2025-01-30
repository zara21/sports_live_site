<?php
require_once '../includes/db_connect.php';
require_once '../includes/session.php';

// Ensure user_subscription is set in session
if (!isset($_SESSION['user_subscription'])) {
    $_SESSION['user_subscription'] = 'user'; // Default to 'user' if not set
}

// Query to fetch channels
$sql = "SELECT * FROM channels 
        WHERE access_level = 'all' 
        OR (access_level = 'premium' AND :is_premium = 1)";
$stmt = $pdo->prepare($sql);
$stmt->execute([':is_premium' => ($_SESSION['user_subscription'] === 'premium' ? 1 : 0)]);
$channels = $stmt->fetchAll();

// Category filter
$category_id = $_GET['category_id'] ?? null;
if ($category_id) {
    $sql = "SELECT * FROM channels WHERE category_id = :category_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':category_id' => $category_id]);
    $channels = $stmt->fetchAll();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Channels</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Available Channels</h1>
    <ul>
        <?php foreach ($channels as $channel): ?>
            <li>
                <?= htmlspecialchars($channel['name']) ?> - 
                <a href="<?= htmlspecialchars($channel['link']) ?>" target="_blank">Watch</a>
                <?= $channel['access_level'] === 'premium' ? '(Premium Only)' : '' ?>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
