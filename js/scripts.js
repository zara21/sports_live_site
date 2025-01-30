document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('searchInput');
    const resultsDiv = document.getElementById('results');

    if (searchInput) {
        searchInput.addEventListener('input', () => {
            const query = searchInput.value;

            if (query.length < 2) {
                resultsDiv.innerHTML = '';
                return;
            }

            fetch(`/api/search_channels.php?query=${query}`)
                .then(response => response.json())
                .then(data => {
                    resultsDiv.innerHTML = '<ul>' +
                        data.map(channel => `<li><a href="/views/channel_page.php?slug=${channel.slug}">${channel.name}</a></li>`).join('') +
                        '</ul>';
                });
        });
    }
});



document.addEventListener("DOMContentLoaded", () => {
    const darkModeToggle = document.getElementById("dark-mode-toggle");
    const isDarkMode = localStorage.getItem("darkMode") === "true";

    if (isDarkMode) {
        document.body.classList.add("dark-mode");
    }

    darkModeToggle.addEventListener("click", () => {
        document.body.classList.toggle("dark-mode");
        const isDarkMode = document.body.classList.contains("dark-mode");
        localStorage.setItem("darkMode", isDarkMode);
    });
});
