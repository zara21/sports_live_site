<?php
$host = 'localhost';
$db = 'sports_channels';
$user = 'root';
$pass = '';

// MySQLi connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection for MySQLi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    // Set charset for MySQLi
    if (!$conn->set_charset("utf8mb4")) {
        die("Error loading character set utf8mb4: " . $conn->error);
    }
}

// PDO connection
try {
    $dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false); // Disable emulate prepares for security
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
