<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once 'db_connect.php';

// Set default language
if (!isset($_SESSION['lang'])) {
    $_SESSION['lang'] = 'en'; // Default to English
}

// Change language if requested
if (isset($_GET['lang']) && in_array($_GET['lang'], ['en', 'ka'])) {
    $_SESSION['lang'] = $_GET['lang'];
}

// Get translation
function translate($key) {
    global $pdo;

    $lang = $_SESSION['lang'];
    $sql = "SELECT $lang FROM translations WHERE key_name = :key_name";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':key_name' => $key]);
    $translation = $stmt->fetchColumn();

    return $translation ?: $key; // Fallback to key if not translated
}
?>
