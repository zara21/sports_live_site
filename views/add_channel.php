<?php
require_once '../includes/db_connect.php';

// Fetch categories from the database
$sql = "SELECT id, name FROM categories ORDER BY name ASC";
$stmt = $pdo->query($sql);
$categories = $stmt->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $slug = preg_replace('/[^a-z0-9-]+/', '-', strtolower($name)); // Auto-generate slug
    $link = filter_var($_POST['link'], FILTER_VALIDATE_URL);
    $category_id = (int) $_POST['category_id'];
    $access_level = $_POST['access_level'] ?? 'all';
    $status = 'active';

    if (!$name || !$link) {
        echo "Invalid input data.";
        exit;
    }

    // Handle icon upload
    $icon_name = null;
    if (isset($_FILES['icon']) && $_FILES['icon']['error'] === UPLOAD_ERR_OK) {
        $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif'];
        $file_extension = strtolower(pathinfo($_FILES['icon']['name'], PATHINFO_EXTENSION));

        if (!in_array($file_extension, $allowed_extensions)) {
            echo "Invalid file type.";
            exit;
        }

        $uploads_dir = '../uploads/icons';
        if (!is_dir($uploads_dir)) {
            mkdir($uploads_dir, 0777, true);
        }

        $icon_name = $slug . '.' . $file_extension;
        $icon_path = "$uploads_dir/$icon_name";

        if (!move_uploaded_file($_FILES['icon']['tmp_name'], $icon_path)) {
            echo "Failed to upload icon.";
            exit;
        }
    }

    // Insert into database
    $sql = "INSERT INTO channels (name, slug, link, category_id, icon, access_level, status) 
            VALUES (:name, :slug, :link, :category_id, :icon, :access_level, :status)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':slug' => $slug,
        ':link' => $link,
        ':category_id' => $category_id,
        ':icon' => $icon_name,
        ':access_level' => $access_level,
        ':status' => $status,
    ]);

    // Generate a new page for the channel
    $channel_file = "../channels/$slug.php";
    $content = "<?php\n";
    $content .= "\$slug = '$slug';\n";
    $content .= "include '../templates/channel_template.php';\n";

    // Write the content to the new file
    if (file_put_contents($channel_file, $content) === false) {
        echo "Failed to create channel page.";
        exit;
    }

    echo "Channel added successfully!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Channel</title>
</head>
<body>
    <h1>Add New Channel</h1>
    <form method="POST" enctype="multipart/form-data">
        <input type="text" name="name" placeholder="Channel Name" required>
        <input type="text" name="slug" placeholder="Slug (e.g., setanta)" required>
        <input type="text" name="link" placeholder="Link (e.g., https://example.com/live-stream)" required>
        <select name="category_id" required>
            <option value="">Select Category</option>
            <?php foreach ($categories as $category): ?>
                <option value="<?= $category['id'] ?>"><?= htmlspecialchars($category['name']) ?></option>
            <?php endforeach; ?>
        </select>
        <select name="access_level" required>
            <option value="all">All Users</option>
            <option value="premium">Premium Users Only</option>
        </select>
        <input type="file" name="icon" accept="image/*" required>
        <button type="submit">Add Channel</button>
    </form>
</body>
</html>
