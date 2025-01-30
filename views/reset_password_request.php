<?php
require_once '../includes/db_connect.php';
include '../includes/navbar.php';


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/autoload.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);

    if (!$email) {
        echo "Invalid email address.";
        exit;
    }

    // Check if the email exists
    $sql = "SELECT id FROM users WHERE email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':email' => $email]);
    $user = $stmt->fetch();

    if (!$user) {
        echo "No user found with this email.";
        exit;
    }

    // Generate new password
    $new_password = bin2hex(random_bytes(4)); // 8-character password
    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

    // Update the database with the new password
    $sql = "UPDATE users SET password = :password WHERE email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':password' => $hashed_password,
        ':email' => $email,
    ]);

    // Send the new password via email
    $mail = new PHPMailer(true);

    try {
        // SMTP server configuration
        $mail->isSMTP();
        $mail->Host = 'mail.livematch.ge';
        $mail->SMTPAuth = true;
        $mail->Username = 'test@livematch.ge';
        $mail->Password = 'IJG0p3*.KOJJ';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port = 465;

        // Email settings
        $mail->setFrom('test@livematch.ge', 'Sports Live Site');
        $mail->addAddress($email);

        $mail->isHTML(true);
        $mail->Subject = 'Your New Password';
        $mail->Body = "<p>Your new password is: <strong>$new_password</strong></p><p>Please change it after logging in for security reasons.</p>";

        $mail->send();
        echo "A new password has been sent to your email.";
    } catch (Exception $e) {
        echo "Failed to send email. Error: {$mail->ErrorInfo}";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link rel="stylesheet" href="../css/styles.css">

</head>
<body>
    <h1>Reset Password </h1>
    <form method="POST">
        <input type="email" name="email" placeholder="Enter your email" required>
        <button type="submit">Send Password</button>
    </form>
</body>
</html>
