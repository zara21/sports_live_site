<?php
// Start session only if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once '../includes/db_connect.php';
require_once '../includes/language.php'; // Translation logic



$user_name = '';
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT first_name FROM users WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' => $user_id]);
    $user = $stmt->fetch();
    $user_name = $user ? $user['first_name'] : '';
}


// Default values
$user_name = '';
$unread_count = 0;

// Check if user is logged in
if (isset($_SESSION['user_id']) && !empty($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];

    // Fetch user name
    $sql = "SELECT first_name FROM users WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' => $user_id]);
    $user = $stmt->fetch();
    $user_name = $user ? $user['first_name'] : '';

    // Fetch unread notifications count
    $sql = "SELECT COUNT(*) AS unread_count FROM notifications WHERE user_id = :user_id AND is_read = 0";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':user_id' => $user_id]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $unread_count = $result['unread_count'] ?? 0;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="/sports_live_site/views/index.php">
            <i class="bi bi-house-door-fill"></i> <?= translate('home') ?>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/sports_live_site/views/channels.php">
                        <i class="bi bi-tv"></i> <?= translate('channels') ?>
                    </a>
                </li>
                
            </ul>
            <ul class="navbar-nav ms-auto">
                <?php if (!empty($user_id)): ?>
                    <li class="nav-item">
                        <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#profileModal">
                            <i class="bi bi-person-fill"></i> <?= htmlspecialchars($user_name) ?>
                        </a>
                    </li>

                    <?php if (!empty($user_id)): ?>
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#notificationsModal" id="load-notifications">
                                <i class="bi bi-bell-fill"></i> 
                                <span class="badge bg-danger" id="notification-count"><?= $unread_count ?></span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/sports_live_site/views/favorites.php" class="nav-link">
                                <i class="bi bi-heart-fill text-white"></i>
                                
                            </a>
                        </li>

                    <?php endif; ?>

                    

                    

                    <li class="nav-item">
                        <a class="nav-link" href="/sports_live_site/auth/logout.php">
                            <i class="bi bi-box-arrow-right"></i> <?= translate('') ?>
                        </a>
                    </li>
                <?php else: ?>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">
                            <i class="bi bi-box-arrow-in-right"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">
                            <i class="bi bi-person-plus-fill"></i>
                        </a>
                    </li>
                <?php endif; ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-light" href="#" id="languageDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-translate"></i> <?= ($_SESSION['lang'] === 'en') ? 'Eng' : 'Geo' ?>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
                        <li>
                            <a class="dropdown-item" href="?lang=en">
                                <i class="bi bi-flag-fill"></i> Eng
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="?lang=ka">
                                <i class="bi bi-flag"></i> Geo
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <button class="btn btn-sm btn-outline-light ms-2" id="dark-mode-toggle">
                        <i class="bi bi-moon-fill"></i> 
                    </button>
                </li>

            </ul>
        </div>
    </div>
</nav>



<!-- Profile Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">Your Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <p><strong>First Name:</strong> <span id="profile-first-name"></span></p>
            <p><strong>Last Name:</strong> <span id="profile-last-name"></span></p>
            <p><strong>Email:</strong> <span id="profile-email"></span></p>
            <p><strong>Subscription:</strong> <span id="profile-subscription"></span></p>
            <div id="premium-details" style="display: none;">
                <p><strong>Member Since:</strong> <span id="subscription-started"></span></p>
                <p><strong>Expires On:</strong> <span id="subscription-expires"></span></p>
            </div>
            <div id="regular-details">
                <p>You are a regular user.</p>
                <form id="buy-premium-form">
                    <button type="button" class="btn btn-primary btn-sm">Buy Premium for $1</button>
                </form>
                <a href="/sports_live_site/views/buy_premium.php" class="nav-link text-light">Learn More</a>
            </div>

            <h2>Reset Password</h2>
            <form id="reset-password-form">
                <div class="mb-3">
                    <label for="current-password" class="form-label">Current Password</label>
                    <input type="password" class="form-control" id="current-password" name="current_password" required>
                </div>
                <div class="mb-3">
                    <label for="new-password" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="new-password" name="new_password" required>
                </div>
                <div class="mb-3">
                    <label for="confirm-password" class="form-label">Confirm New Password</label>
                    <input type="password" class="form-control" id="confirm-password" name="confirm_password" required>
                </div>
                <button type="submit" class="btn btn-primary">Reset Password</button>
            </form>
        </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="/sports_live_site/auth/logout.php" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>


<!-- Notifications Modal -->
<div class="modal fade" id="notificationsModal" tabindex="-1" aria-labelledby="notificationsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notificationsModalLabel">Notifications</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul id="notifications-list" class="list-group">
                    <!-- Notifications will be loaded here -->
                </ul>
            </div>
        </div>
    </div>
</div>


<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="login-form" method="POST">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Login</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="login-email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="login-email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="login-password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="login-password" name="password" required>
                    </div>
                    <div id="login-error" class="text-danger"></div>
                    <p class="mt-3">
                        <a href="/sports_live_site/views/reset_password_request.php" target="_blank">
                            Forgot Password?
                        </a>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Register Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="register-form" method="POST">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">Register</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="register-first-name" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="register-first-name" name="first_name" required>
                    </div>
                    <div class="mb-3">
                        <label for="register-last-name" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="register-last-name" name="last_name" required>
                    </div>
                    <div class="mb-3">
                        <label for="register-email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="register-email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="register-password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="register-password" name="password" required>
                    </div>
                    <div id="register-error" class="text-danger"></div>
                    <p class="mt-3">
                        Already have an account? <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login here</a>.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Handle Login
    document.getElementById('login-form').addEventListener('submit', function(e) {
        e.preventDefault();
        const formData = new FormData(this);
        fetch('/sports_live_site/auth/login.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            if (data === 'success') {
                location.reload(); // Reload the page
            } else {
                document.getElementById('login-error').textContent = data;
            }
        })
        .catch(error => console.error('Error:', error));
    });

    // Handle Registration
    document.getElementById('register-form').addEventListener('submit', function(e) {
        e.preventDefault();
        const formData = new FormData(this);
        fetch('/sports_live_site/auth/register.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            if (data === 'success') {
                location.reload(); // Reload the page
            } else {
                document.getElementById('register-error').textContent = data;
            }
        })
        .catch(error => console.error('Error:', error));
    });
</script>


<script>
    document.getElementById('reset-password-form').addEventListener('submit', function (e) {
        e.preventDefault();

        const formData = new FormData(this);

        fetch('/sports_live_site/api/reset_password.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert('Password reset successfully!');
            } else {
                alert(data.message || 'Error resetting password.');
            }
        })
        .catch(error => console.error('Error:', error));
    });

</script>


<script>

    document.getElementById('profileModal').addEventListener('show.bs.modal', function () {
        fetch('/sports_live_site/api/get_user_profile.php')
            .then(response => response.json())
            .then(data => {
                document.getElementById('profile-first-name').textContent = data.first_name;
                document.getElementById('profile-last-name').textContent = data.last_name;
                document.getElementById('profile-email').textContent = data.email;
                document.getElementById('profile-subscription').textContent = data.subscription_type;

                if (data.subscription_type === 'premium') {
                    document.getElementById('premium-details').style.display = 'block';
                    document.getElementById('subscription-started').textContent = data.subscription_started_at;
                    document.getElementById('subscription-expires').textContent = data.subscription_expires_at;
                    document.getElementById('regular-details').style.display = 'none';
                } else {
                    document.getElementById('regular-details').style.display = 'block';
                    document.getElementById('premium-details').style.display = 'none';
                }
            })
            .catch(error => console.error('Error:', error));
    });


</script>

<script>
    document.getElementById('buy-premium-form').addEventListener('click', function (e) {
        e.preventDefault(); // Prevent default behavior

        fetch('/sports_live_site/api/buy_premium.php', {
            method: 'POST',
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert('Premium activated successfully!');
                window.location.reload(); // Reload the page to reflect changes
            } else {
                alert(data.message || 'Failed to activate premium.');
            }
        })
        .catch(error => console.error('Error:', error));
    });


</script>



<script>
    document.getElementById('login-form').addEventListener('submit', function(e) {
        e.preventDefault(); // Prevent the default form submission

        const formData = new FormData(this);

        fetch('../auth/login.php', {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                // Reload the current page on successful login
                window.location.reload();
            } else {
                // Show error message
                document.getElementById('login-error-message').textContent = data.message;
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });


    document.getElementById('register-form').addEventListener('submit', function (e) {
        e.preventDefault(); // Prevent the default form submission

        const formData = new FormData(this);

        fetch('../auth/register.php', {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                // ავტომატურად გადაატვირთოს ფეიჯი, რათა იუზერი იყოს ლოგინებული
                window.location.reload();
            } else {
                // შეცდომის შეტყობინების ჩვენება
                document.getElementById('register-error-message').textContent = data.message;
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });




</script>



<script>
    document.getElementById('load-notifications').addEventListener('click', function () {
        fetch('/sports_live_site/api/get_notifications.php')
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    const notificationsList = document.getElementById('notifications-list');
                    notificationsList.innerHTML = ''; // Clear the current list

                    data.notifications.forEach(notification => {
                        const listItem = document.createElement('li');
                        listItem.className = 'list-group-item d-flex justify-content-between align-items-center';
                        listItem.innerHTML = `
                            <span>${notification.message}</span>
                            <small class="text-muted">${new Date(notification.created_at).toLocaleString()}</small>
                        `;
                        notificationsList.appendChild(listItem);
                    });

                    // Update unread count badge
                    document.getElementById('notification-count').textContent = data.notifications.filter(n => n.is_read === 0).length;
                } else {
                    console.error(data.message);
                }
            })
            .catch(error => console.error('Error:', error));
    });
</script>


<script>
    document.getElementById('notificationsModal').addEventListener('shown.bs.modal', function () {
        fetch('/sports_live_site/api/mark_notifications_read.php', { method: 'POST' })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    document.getElementById('notification-count').textContent = 0; // Reset unread count
                }
            })
            .catch(error => console.error('Error:', error));
    });
</script>


<script>
    // Toggle dark mode
    const darkModeToggle = document.getElementById('dark-mode-toggle');
    const body = document.body;

    // Check localStorage for saved dark mode preference
    if (localStorage.getItem('darkMode') === 'enabled') {
        body.classList.add('dark-mode');
        darkModeToggle.innerHTML = '<i class="bi bi-sun-fill"></i> ';
    }

    darkModeToggle.addEventListener('click', () => {
        body.classList.toggle('dark-mode');

        // Update button icon and text
        if (body.classList.contains('dark-mode')) {
            darkModeToggle.innerHTML = '<i class="bi bi-sun-fill"></i> ';
            localStorage.setItem('darkMode', 'enabled');
        } else {
            darkModeToggle.innerHTML = '<i class="bi bi-moon-fill"></i> ';
            localStorage.setItem('darkMode', 'disabled');
        }
    });
</script>






</body>
</html>
