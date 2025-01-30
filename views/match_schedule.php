<?php
require_once '../includes/db_connect.php';

// Fetch today's matches
$today_start = date('Y-m-d 00:00:00');
$today_end = date('Y-m-d 23:59:59');
$sql_today = "SELECT * FROM matches WHERE start_time BETWEEN :start AND :end ORDER BY start_time ASC";
$stmt = $pdo->prepare($sql_today);
$stmt->execute([':start' => $today_start, ':end' => $today_end]);
$today_matches = $stmt->fetchAll();

// Fetch this week's matches
$week_start = date('Y-m-d 00:00:00', strtotime('monday this week'));
$week_end = date('Y-m-d 23:59:59', strtotime('sunday this week'));
$sql_week = "SELECT * FROM matches WHERE start_time BETWEEN :start AND :end ORDER BY start_time ASC";
$stmt = $pdo->prepare($sql_week);
$stmt->execute([':start' => $week_start, ':end' => $week_end]);
$week_matches = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Match Schedule</title>
</head>
<body>
    <h1>Today's Matches</h1>
    <ul>
        <?php foreach ($today_matches as $match): ?>
            <li>
                <?= htmlspecialchars($match['team1']) ?> vs <?= htmlspecialchars($match['team2']) ?> - 
                <?= htmlspecialchars(date('H:i', strtotime($match['start_time']))) ?>
            </li>
        <?php endforeach; ?>
    </ul>

    <h1>This Week's Matches</h1>
    <ul>
        <?php foreach ($week_matches as $match): ?>
            <li>
                <?= htmlspecialchars($match['team1']) ?> vs <?= htmlspecialchars($match['team2']) ?> - 
                <?= htmlspecialchars(date('D, H:i', strtotime($match['start_time']))) ?>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
