<?php
require_once '../includes/db_connect.php';
include '../includes/navbar.php';


// Check if the user is logged in and has a role
if (!isset($_SESSION['user_id']) || !isset($_SESSION['role'])) {
    die("Access denied. Please log in.");
}

// Check if the user is an admin
if ($_SESSION['role'] !== 'admin') {
    die("Access denied. Admins only.");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $message = trim($_POST['message']);
    $user_id = $_POST['user_id'] ?? 'all'; // 'all' for all users

    if (empty($message)) {
        echo "Message cannot be empty.";
        exit;
    }

    try {
        if ($user_id === 'all') {
            // Add notification for all users
            $sql = "SELECT id FROM users";
            $stmt = $pdo->query($sql);
            $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($users as $user) {
                $sql = "INSERT INTO notifications (user_id, message) VALUES (:user_id, :message)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    ':user_id' => $user['id'],
                    ':message' => $message,
                ]);
            }
            echo "Notification sent to all users!";
        } else {
            // Add notification for a specific user
            $sql = "INSERT INTO notifications (user_id, message) VALUES (:user_id, :message)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                ':user_id' => $user_id,
                ':message' => $message,
            ]);
            echo "Notification sent to user ID $user_id!";
        }
    } catch (PDOException $e) {
        echo "Failed to add notification: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Notification</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Add Notification</h1>
    <form method="POST">
        <label for="user_id">User ID:</label>
        <select name="user_id" id="user_id">
            <option value="all">All Users</option>
            <?php
            // Fetch all users to show in the dropdown
            $sql = "SELECT id, first_name, last_name FROM users";
            $stmt = $pdo->query($sql);
            $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($users as $user) {
                echo "<option value='{$user['id']}'>{$user['first_name']} {$user['last_name']} (ID: {$user['id']})</option>";
            }
            ?>
        </select>
        <br><br>
        <label for="message">Message:</label>
        <textarea name="message" id="message" rows="4" cols="50" required></textarea>
        <br><br>
        <button type="submit">Send Notification</button>
    </form>
</body>
</html>
