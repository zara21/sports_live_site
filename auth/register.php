<?php
require_once '../includes/db_connect.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $response = [];

    $first_name = trim($_POST['first_name']);
    $last_name = trim($_POST['last_name']);
    $email = trim($_POST['email']);
    $password = password_hash(trim($_POST['password']), PASSWORD_BCRYPT);

    // ვალიდაცია
    if (empty($first_name) || empty($last_name) || empty($email) || empty($password)) {
        $response = [
            'status' => 'error',
            'message' => 'All fields are required!'
        ];
        echo json_encode($response);
        exit;
    }

    // ელ.ფოსტის შემოწმება
    $sql = "SELECT id FROM users WHERE email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':email' => $email]);
    if ($stmt->fetch()) {
        $response = [
            'status' => 'error',
            'message' => 'Email is already registered!'
        ];
        echo json_encode($response);
        exit;
    }

    // მომხმარებლის დამატება
    $sql = "INSERT INTO users (first_name, last_name, email, password, role) VALUES (:first_name, :last_name, :email, :password, 'user')";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':first_name' => $first_name,
        ':last_name' => $last_name,
        ':email' => $email,
        ':password' => $password,
    ]);

    // მომხმარებლის ავტორიზაცია
    $user_id = $pdo->lastInsertId();
    session_start();
    $_SESSION['user_id'] = $user_id;
    $_SESSION['user_name'] = $first_name;

    $response = [
        'status' => 'success',
        'message' => 'Registration successful!'
    ];
    echo json_encode($response);
    exit;
}
?>
