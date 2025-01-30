<?php
require_once '../includes/db_connect.php';
include '../includes/navbar.php';

// Check if slug is provided
if (!isset($slug)) {
    echo "Slug not provided.";
    exit;
}

// Fetch the match details using the slug
$sql = "SELECT * FROM matches WHERE slug = :slug";
$stmt = $pdo->prepare($sql);
$stmt->execute([':slug' => $slug]);
$match = $stmt->fetch();

if (!$match) {
    echo "Match not found.";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars("{$match['team1']} vs {$match['team2']}") ?> - Match</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/styles.css">
        <link rel="stylesheet" href="../css/match_template.css">

</head>
<body>
    <!-- Banner Section -->
    <div class="banner-container">
        <?php if ($match['banner']): ?>
            <img src="../uploads/banners/<?= htmlspecialchars($match['banner']) ?>" alt="Match Banner" class="banner-img">
        <?php endif; ?>
    </div>

    <!-- Match Details Section -->
    <div class="match-details container text-center py-4">
        <h1 class="match-title"><?= htmlspecialchars("{$match['team1']} vs {$match['team2']}") ?></h1>
        <p class="match-date">Start Time: <?= htmlspecialchars($match['start_time']) ?></p>
    </div>

    <!-- Live Match Section -->
    <div class="container iframe-container text-center py-4">
        <?php if (!empty($match['link'])): ?>
            <iframe src="<?= htmlspecialchars($match['link']) ?>" frameborder="0" class="match-iframe" allowfullscreen></iframe>
        <?php else: ?>
            <p>No live match link available.</p>
        <?php endif; ?>
    </div>


    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
