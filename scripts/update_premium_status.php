<?php
require_once '../includes/db_connect.php';

// Update expired premium accounts
$sql = "UPDATE users 
        SET subscription_type = 'regular', 
            subscription_started_at = NULL, 
            subscription_expires_at = NULL 
        WHERE subscription_expires_at <= NOW() AND subscription_type = 'premium'";
$stmt = $pdo->prepare($sql);
$stmt->execute();

echo "Expired premium accounts updated.";
