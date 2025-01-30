<?php
session_start();
require_once '../includes/db_connect.php';

$response = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (empty($email) || empty($password)) {
        $response = ['status' => 'error', 'message' => 'Please fill all fields!'];
    } else {
        $sql = "SELECT * FROM users WHERE email = :email";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['first_name'];
            $_SESSION['role'] = $user['role'];
            $response = ['status' => 'success', 'message' => 'Login successful!', 'user_name' => $user['first_name']];
        } else {
            $response = 'Invalid email or password!';
        }
    }
}

header('Content-Type: application/json');
echo json_encode($response);
exit;
?>
