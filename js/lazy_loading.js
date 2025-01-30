document.addEventListener("DOMContentLoaded", () => {
    const lazyElements = document.querySelectorAll("[data-src]");

    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const element = entry.target;
                    element.src = element.getAttribute("data-src");
                    element.removeAttribute("data-src");
                    observer.unobserve(element);
                }
            });
        });

        lazyElements.forEach(el => observer.observe(el));
    } else {
        // Fallback for older browsers
        lazyElements.forEach(el => el.src = el.getAttribute("data-src"));
    }
});
