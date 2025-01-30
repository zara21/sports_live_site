<?php
require_once '../includes/db_connect.php';

// Handle search and filter inputs
$search = $_GET['search'] ?? '';
$category = $_GET['category'] ?? '';
$status = $_GET['status'] ?? '';

// Build dynamic query
$sql = "SELECT * FROM channels WHERE 1";
$params = [];

if (!empty($search)) {
    $sql .= " AND name LIKE :search";
    $params[':search'] = "%$search%";
}

if (!empty($category)) {
    $sql .= " AND category_id = :category";
    $params[':category'] = $category;
}

if (!empty($status)) {
    $sql .= " AND status = :status";
    $params[':status'] = $status;
}

$sql .= " ORDER BY name ASC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$channels = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Channels</title>
</head>
<body>
    <form method="GET">
        <input type="text" name="search" placeholder="Search by name" value="<?= htmlspecialchars($search) ?>">
        <select name="category">
            <option value="">All Categories</option>
            <!-- Dynamically populate categories -->
            <?php
            $categories = $pdo->query("SELECT id, name FROM categories")->fetchAll();
            foreach ($categories as $cat) {
                echo "<option value='{$cat['id']}' " . ($category == $cat['id'] ? 'selected' : '') . ">{$cat['name']}</option>";
            }
            ?>
        </select>
        <select name="status">
            <option value="">All Status</option>
            <option value="active" <?= $status == 'active' ? 'selected' : '' ?>>Active</option>
            <option value="hidden" <?= $status == 'hidden' ? 'selected' : '' ?>>Hidden</option>
        </select>
        <button type="submit">Filter</button>
    </form>

    <ul>
        <?php foreach ($channels as $channel): ?>
            <li><?= htmlspecialchars($channel['name']) ?> - <?= htmlspecialchars($channel['status']) ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
