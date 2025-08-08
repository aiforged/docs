gitbook.events.bind("start", function() {
    var container = $('<div id="search-container"></div>').css({ padding: "10px" });
    $(".book-summary").prepend(container);

    // Use root-relative URLs
    $('head').append('<link rel="stylesheet" href="/pagefind/pagefind-ui.css">');

    $.getScript("/pagefind/pagefind-ui.js", function() {
        if (typeof PagefindUI === "function") {
            new PagefindUI({
                element: "#search-container",
                showImages: false
            });
        }
    });
});

// Default theme color to Night mode on first visit
gitbook.events.bind("start", function() {
    if (!localStorage.getItem("bookColorTheme")) {
        localStorage.setItem("bookColorTheme", "night");
        document.querySelector("html").classList.add("color-theme-night");
    }
});
