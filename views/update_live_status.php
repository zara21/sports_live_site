<?php
// 11. update_live_status.php - Update live or offline status
require_once '../includes/db_connect.php'; // Correct path to db_connect.php
require_once '../includes/session.php'; // Ensure user is logged in

// Check if user is an admin
if ($_SESSION['role'] !== 'admin') {
    die("Access denied. Admins only.");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $channel_id = (int) $_POST['channel_id'];
    $live_status = (int) $_POST['live_status'];

    // Update live status in the database
    $sql = "UPDATE channels SET live_status = :live_status WHERE id = :channel_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':live_status' => $live_status, ':channel_id' => $channel_id]);

    echo "Status updated!";
    header("Location: update_live_status.php");
    exit;
}

// Fetch all channels from the database
$sql = "SELECT id, name, live_status FROM channels";
$stmt = $pdo->query($sql);
$channels = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Live Status</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Update Channel Live Status</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Channel Name</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($channels as $channel): ?>
                <tr>
                    <td><?= htmlspecialchars($channel['name']) ?></td>
                    <td><?= $channel['live_status'] ? 'Live' : 'Offline' ?></td>
                    <td>
                        <form method="POST" style="display: inline;">
                            <input type="hidden" name="channel_id" value="<?= $channel['id'] ?>">
                            <select name="live_status">
                                <option value="1" <?= $channel['live_status'] ? 'selected' : '' ?>>Live</option>
                                <option value="0" <?= !$channel['live_status'] ? 'selected' : '' ?>>Offline</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
