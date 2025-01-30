<?php

// =================== manage_channel.php ===================
require_once '../includes/db_connect.php';
require_once '../includes/session.php';

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to access this page.");
}

// Ensure the role exists in the session
if (!isset($_SESSION['role'])) {
    // Fetch the user's role from the database if not set in the session
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT role FROM users WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' => $user_id]);
    $user = $stmt->fetch();

    if (!$user) {
        die("User not found.");
    }

    $_SESSION['role'] = $user['role'];
}

// Check if user is an admin
if ($_SESSION['role'] !== 'admin') {
    die("Access denied. Admins only.");
}

// Fetch all channels
$sql = "SELECT * FROM channels";
$stmt = $pdo->query($sql);
$channels = $stmt->fetchAll();

// Handle channel actions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_channel'])) {
        $channel_id = $_POST['channel_id'];
        $sql = "DELETE FROM channels WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':id' => $channel_id]);
        header("Location: manage_channel.php");
        exit;
    } elseif (isset($_POST['edit_channel'])) {
        $channel_id = $_POST['channel_id'];
        $new_name = $_POST['name'];
        $new_slug = $_POST['slug'];
        $sql = "UPDATE channels SET name = :name, slug = :slug WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':name' => $new_name,
            ':slug' => $new_slug,
            ':id' => $channel_id,
        ]);
        header("Location: manage_channel.php");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Channels</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Manage Channels</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Slug</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($channels as $channel): ?>
                <tr>
                    <td><?= htmlspecialchars($channel['id']) ?></td>
                    <td><?= htmlspecialchars($channel['name']) ?></td>
                    <td><?= htmlspecialchars($channel['slug']) ?></td>
                    <td>
                        <form method="POST" style="display:inline;">
                            <input type="hidden" name="channel_id" value="<?= $channel['id'] ?>">
                            <input type="text" name="name" placeholder="New Name" required>
                            <input type="text" name="slug" placeholder="New Slug" required>
                            <button type="submit" name="edit_channel">Edit</button>
                        </form>
                        <form method="POST" style="display:inline;">
                            <input type="hidden" name="channel_id" value="<?= $channel['id'] ?>">
                            <button type="submit" name="delete_channel">Delete</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
