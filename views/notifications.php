<?php
require_once '../includes/session.php'; // Ensure the user is logged in
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Notifications</h1>
    <ul id="notifications">
        <li>Loading notifications...</li>
    </ul>
    <script src="../js/notifications.js"></script>
</body>
</html>
