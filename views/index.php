<?php
require_once '../includes/db_connect.php';
include '../includes/navbar.php';
require_once '../includes/language.php';

// Fetch categories and channels
$channels = $pdo->query("SELECT * FROM channels ORDER BY name ASC")->fetchAll();
$matches = $pdo->query("SELECT * FROM matches ORDER BY date DESC LIMIT 3")->fetchAll();


$query = "SELECT name FROM categories";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    $categories = [];
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row['name'];
    }
} else {
    $categories = [];
}


// Highlight featured channels (e.g., first 5 channels)
$featured_channels = array_slice($channels, 0, 5);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sports Channels</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/styles.css"> <!-- Custom CSS -->

</head>
<body>
    <!-- Header -->
    <header class=" text-white ">
        <div id="mainCarousel" class="carousel slide " data-bs-ride="carousel">
            <div class="carousel-inner">
                <?php foreach ($matches as $index => $match): ?>
                    <div class="carousel-item <?= $index === 0 ? 'active' : '' ?>">
                        <a href="../matches/<?= htmlspecialchars($match['slug']) ?>.php">
                            <img src="../uploads/banners/<?= htmlspecialchars($match['banner']) ?>" class="d-block w-100" alt="<?= htmlspecialchars($match['team1'] . ' Vs ' . $match['team2']) ?>.php">
                            <div class="carousel-caption d-none d-md-block">
                                <h5><?= htmlspecialchars($match['team1'] . ' Vs ' . $match['team2']) ?></h5>
                                <p><?= htmlspecialchars($match['tournament_name']) ?></p> <!-- ტურნირის დასახელება -->
                                <h6><?= htmlspecialchars(date('Y-m-d H:i', strtotime($match['start_time']))) ?></h6> <!-- ტურნირის დრო -->

                            </div>
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </header>

   <!-- Slider -->

<section>
    <div class="categories-container">
        <h2>Categories</h2>
        <div class="slider-wrapper">
            <div class="categories-slider">
                <?php foreach ($categories as $category): 
                    // კატეგორიის სახელი ლინკის ფორმატში
                    $link = str_replace(' ', '-', $category);
                ?>
                    <a href="/<?= $link ?>.php" class="category-box">
                        <?= htmlspecialchars($category) ?>
                    </a>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
   


<section>
    <div class="container my-5">
        <h2 class="text-center mb-4">Available Channels</h2>
        <div class="search-filter-wrapper">
            <div class="search-box">
                <input type="text" id="channel-search" placeholder="Search channels..." class="search-input">
                <button id="clear-search" class="clear-btn"><span aria-hidden="true">&times;</span></button>
            </div>
            
            <div class="filter-buttons">
                <button class="filter-btn" data-filter="all">All</button>
                <button class="filter-btn" data-filter="free">Free</button>
                <button class="filter-btn" data-filter="premium">Premium</button>
            </div>
        </div>
        <div class="channels-grid" id="channels-container">
            <?php foreach ($channels as $channel): ?>
                <div class="channel-card" data-access="<?= htmlspecialchars($channel['access_level']) ?>" data-name="<?= htmlspecialchars($channel['name']) ?>">
                    <a href="../channels/<?= htmlspecialchars($channel['slug']) ?>.php">
                        <?php 
                        $image_src = !empty($channel['icon']) ? "../uploads/icons/" . htmlspecialchars($channel['icon']) : htmlspecialchars($channel['logo']); 
                        ?>
                        <img src="<?= $image_src ?>" alt="<?= htmlspecialchars($channel['name']) ?> Icon" class="channel-icon">
                        <h3><?= htmlspecialchars($channel['name']) ?></h3>
                    </a>
                    <?= $channel['access_level'] === 'premium' ? '<span class="premium-label">(Premium)</span>' : '<span class="free-label">(Free)</span>' ?>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-3">
        <div class="container text-center">
            <p>&copy; 2024 Sports Channels. All Rights Reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('channel-search');
            const clearBtn = document.getElementById('clear-search');
            const filterBtns = document.querySelectorAll('.filter-btn');
            const channelCards = document.querySelectorAll('.channel-card');

            searchInput.addEventListener('input', function () {
                const query = searchInput.value.toLowerCase();
                channelCards.forEach(card => {
                    const name = card.getAttribute('data-name').toLowerCase();
                    card.style.display = name.includes(query) ? '' : 'none';
                });
            });

            clearBtn.addEventListener('click', function () {
                searchInput.value = '';
                searchInput.dispatchEvent(new Event('input'));
            });

            filterBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    const filter = btn.getAttribute('data-filter');
                    channelCards.forEach(card => {
                        const accessLevel = card.getAttribute('data-access');
                        if (filter === 'free') {
                            card.style.display = accessLevel === 'all' ? '' : 'none';
                        } else {
                            card.style.display = (filter === 'all' || accessLevel === filter) ? '' : 'none';
                        }
                    });
                });
            });
        });
    </script>


    
    
</body>
</html>
