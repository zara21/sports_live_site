<?php
require_once '../includes/db_connect.php';

// Start session only if not started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$channel_id = $_GET['channel_id'] ?? null;

if (!$channel_id) {
    echo "Channel ID not provided.";
    exit;
}

// Fetch existing comments
$sql = "SELECT cc.comment, u.first_name FROM channel_comments cc 
        JOIN users u ON cc.user_id = u.id 
        WHERE cc.channel_id = :channel_id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':channel_id' => $channel_id]);
$comments = $stmt->fetchAll();
?>

<h2>Comments</h2>
<ul>
    <?php foreach ($comments as $comment): ?>
        <li><strong><?= htmlspecialchars($comment['first_name']) ?>:</strong> <?= htmlspecialchars($comment['comment']) ?></li>
    <?php endforeach; ?>
</ul>

<h3>Leave a Comment</h3>
<form id="comment-form">
    <input type="hidden" name="channel_id" value="<?= htmlspecialchars($channel_id) ?>">
    <textarea name="comment" placeholder="Add your comment..." required></textarea>
    <button type="submit">Submit</button>
</form>
<div id="comment-message" style="color: red; margin-top: 10px;"></div>

<script>
document.getElementById('comment-form').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent form from submitting normally

    const formData = new FormData(this);
    fetch('../actions/add_comment.php', {
        method: 'POST',
        body: formData,
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('comment-message').textContent = data;

        // Refresh comments after successful submission
        if (data === "Comment added successfully.") {
            location.reload();
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
</script>
