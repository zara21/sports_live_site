<?php
require_once '../includes/db_connect.php';
require_once '../includes/session.php';

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to view this page.");
}

$user_id = $_SESSION['user_id'];

// Fetch user details
$sql = "SELECT first_name, last_name, subscription_type, subscription_started_at, subscription_expires_at 
        FROM users WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':id' => $user_id]);
$user = $stmt->fetch();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Handle Buy Premium
    if (isset($_POST['buy_premium'])) {
        $sql = "UPDATE users 
                SET subscription_type = 'premium', 
                    subscription_started_at = NOW(),
                    subscription_expires_at = DATE_ADD(NOW(), INTERVAL 1 MONTH) 
                WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':id' => $user_id]);

        echo "You are now a premium member!";
        header("Location: profile.php");
        exit;
    }

    // Handle Password Reset
    if (isset($_POST['reset_password'])) {
        $current_password = $_POST['current_password'];
        $new_password = $_POST['new_password'];
        $confirm_password = $_POST['confirm_password'];

        if ($new_password !== $confirm_password) {
            echo "Passwords do not match.";
            exit;
        }

        // Verify current password
        $sql = "SELECT password FROM users WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':id' => $user_id]);
        $stored_password = $stmt->fetchColumn();

        if (!password_verify($current_password, $stored_password)) {
            echo "Incorrect current password.";
            exit;
        }

        // Update to new password
        $hashed_password = password_hash($new_password, PASSWORD_BCRYPT);
        $sql = "UPDATE users SET password = :password WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':password' => $hashed_password, ':id' => $user_id]);

        echo "Password updated successfully!";
        header("Location: profile.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Welcome, <?= htmlspecialchars($user['first_name']) ?>!</h1>
    <p>Status: <?= htmlspecialchars(ucfirst($user['subscription_type'])) ?></p>
    <?php if ($user['subscription_type'] === 'premium'): ?>
        <p>Premium Member since: <?= htmlspecialchars($user['subscription_started_at']) ?></p>
        <p>Expires on: <?= htmlspecialchars($user['subscription_expires_at']) ?></p>
    <?php else: ?>
        <p>You are a regular user.</p>
        <form method="POST">
            <button type="submit" name="buy_premium">Buy Premium for $1</button>
        </form>
    <?php endif; ?>

    <h2>Reset Password</h2>
    <form method="POST">
        <label for="current_password">Current Password:</label>
        <input type="password" name="current_password" id="current_password" required>
        <br>
        <label for="new_password">New Password:</label>
        <input type="password" name="new_password" id="new_password" required>
        <br>
        <label for="confirm_password">Confirm New Password:</label>
        <input type="password" name="confirm_password" id="confirm_password" required>
        <br>
        <button type="submit" name="reset_password">Reset Password</button>
    </form>
</body>
</html>
