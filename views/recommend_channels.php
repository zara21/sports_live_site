<?php
require_once __DIR__ . '/../includes/db_connect.php';
session_start();

$user_id = $_SESSION['user_id'] ?? null;

if (!$user_id) {
    echo "No recommended channels available.";
    exit;
}

$sql = "SELECT c.name, c.link FROM user_watched_channels uw 
        JOIN channels c ON uw.channel_id = c.id 
        WHERE uw.user_id = :user_id 
        GROUP BY uw.channel_id 
        ORDER BY COUNT(uw.channel_id) DESC 
        LIMIT 5";

$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);
$recommended_channels = $stmt->fetchAll();
?>

<h2>Recommended Channels</h2>
<ul>
    <?php foreach ($recommended_channels as $channel): ?>
        <li><a href="<?= htmlspecialchars($channel['link']) ?>"><?= htmlspecialchars($channel['name']) ?></a></li>
    <?php endforeach; ?>
</ul>

