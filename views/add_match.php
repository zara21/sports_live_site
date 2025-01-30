<?php
require_once '../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $team1 = trim($_POST['team1']);
    $team2 = trim($_POST['team2']);
    $tournament_name = trim($_POST['tournament_name']) ?: null;
    $slug = strtolower(preg_replace('/[^a-zA-Z0-9-]+/', '-', "{$team1}-vs-{$team2}")); // Generate slug
    $start_time = $_POST['start_time'] ?: null;
    $end_time = $_POST['end_time'] ?: null;
    $status = $_POST['status'] ?: 'upcoming';
    $allow_comments = isset($_POST['allow_comments']) ? 1 : 0;

    // Handle banner upload
    $banner_name = null;
    $uploads_dir = '../uploads/banners';

    // Ensure the uploads directory exists
    if (!is_dir($uploads_dir)) {
        mkdir($uploads_dir, 0777, true); // Create directory if it doesn't exist
    }

    if (isset($_FILES['banner']) && $_FILES['banner']['error'] === UPLOAD_ERR_OK) {
        $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif'];
        $file_extension = strtolower(pathinfo($_FILES['banner']['name'], PATHINFO_EXTENSION));

        if (!in_array($file_extension, $allowed_extensions)) {
            echo "Invalid file type.";
            exit;
        }

        $banner_name = $slug . '.' . $file_extension;
        $banner_path = "$uploads_dir/$banner_name";

        if (!move_uploaded_file($_FILES['banner']['tmp_name'], $banner_path)) {
            echo "Failed to upload banner.";
            exit;
        }
    }

    // Insert into database
    $link = trim($_POST['link']) ?: null; // თუ ლინკი არ არის შევსებული, $link იქნება null

    $sql = "INSERT INTO matches (team1, team2, tournament_name, slug, link, start_time, end_time, banner, status, allow_comments) 
            VALUES (:team1, :team2, :tournament_name, :slug, :link, :start_time, :end_time, :banner, :status, :allow_comments)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':team1' => $team1,
        ':team2' => $team2,
        ':tournament_name' => $tournament_name,
        ':slug' => $slug,
        ':link' => $link, // Pass the $link variable
        ':start_time' => $start_time,
        ':end_time' => $end_time,
        ':banner' => $banner_name,
        ':status' => $status,
        ':allow_comments' => $allow_comments,
    ]);


    // Create match file
    $file_path = "../matches/$slug.php";
    $file_content = "<?php\n\$slug = '$slug';\ninclude '../templates/match_template.php';\n";
    file_put_contents($file_path, $file_content);

    echo "Match added successfully!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Match</title>
    <link rel="stylesheet" href="../css/add.css">

</head>
<body>
    <h1>Add Match</h1>
    <form method="POST" enctype="multipart/form-data">
        <input type="text" name="team1" placeholder="Team 1 Name" required>
        <input type="text" name="team2" placeholder="Team 2 Name" required>
        <input type="text" name="tournament_name" placeholder="Tournament Name">
        <input type="text" name="link" placeholder="Match Link">
        <label for="start_time">Start Time:</label>
        <input type="datetime-local" name="start_time" id="start_time">
        <label for="end_time">End Time:</label>
        <input type="datetime-local" name="end_time" id="end_time">
        <label for="status">Status:</label>
        <select name="status" id="status">
            <option value="upcoming">Upcoming</option>
            <option value="ongoing">Ongoing</option>
            <option value="finished">Finished</option>
        </select>
        <label for="allow_comments">Allow Comments:</label>
        <input type="checkbox" name="allow_comments" id="allow_comments">
        <input type="file" name="banner" accept="image/*">
        <button type="submit">Add Match</button>
    </form>
</body>
</html>
