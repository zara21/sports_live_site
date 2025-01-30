<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    echo "<script>alert('Please log in to access this page.'); window.location.href='/sports_live_site/views/index.php';</script>";
    exit;
}

$user_id = $_SESSION['user_id'];
$sql = "SELECT subscription_type FROM users WHERE id = :user_id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':user_id' => $user_id]);
$user = $stmt->fetch();

if ($user['subscription_type'] === 'premium') {
    echo "<script>alert('You are already a premium member.'); window.location.href='/sports_live_site/views/index.php';</script>";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy Premium</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Premium Membership</h1>
    <p>Unlock exclusive features with our premium membership for only $1. Enjoy ad-free streaming, access to premium content, and more!</p>
    <form id="buy-premium-page-form">
        <button type="button" class="btn btn-success">Activate Premium</button>
    </form>
    <a href="/sports_live_site/views/index.php" class="btn btn-secondary mt-3">Back to Home</a>
</div>

<script>
    document.getElementById('buy-premium-page-form').addEventListener('submit', function(e) {
        e.preventDefault();

        fetch('/sports_live_site/api/buy_premium.php', { method: 'POST' })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('Premium activated successfully!');
                    window.location.href = '/sports_live_site/views/index.php';
                } else {
                    alert(data.message || 'Error activating premium.');
                }
            })
            .catch(error => console.error('Error:', error));
    });
</script>
</body>
</html>
