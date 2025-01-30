<?php
require_once '../includes/db_connect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];

    // Insert the category into the database
    $sql = "INSERT INTO categories (name) VALUES (:name)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':name' => $name]);

    echo "Category added successfully!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
</head>
<body>
    <h1>Add a New Category</h1>
    <form method="POST">
        <input type="text" name="name" placeholder="Category Name" required>
        <button type="submit">Add Category</button>
    </form>
</body>
</html>
