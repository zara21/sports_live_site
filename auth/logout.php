<?php
session_start();

// გაანადგურეთ სესია
session_unset();
session_destroy();

// მიღება პარამეტრის `redirect`, ან დაბრუნება ძირითად გვერდზე
$redirect = $_GET['redirect'] ?? '/sports_live_site/views/index.php';

// გადამისამართება საჭირო გვერდზე
header("Location: $redirect");
exit;
?>
