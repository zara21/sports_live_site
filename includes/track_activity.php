<?php
require_once 'db_connect.php';
session_start();

function trackActivity($page) {
    global $pdo;

    if (isset($_SESSION['user_id'])) {
        $sql = "INSERT INTO user_activity (user_id, page_visited) VALUES (:user_id, :page)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':user_id' => $_SESSION['user_id'],
            ':page' => $page
        ]);
    }
}
?>
