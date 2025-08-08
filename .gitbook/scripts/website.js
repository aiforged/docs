gitbook.events.bind("start", function() {
    var container = $('<div id="search-container"></div>')
        .css({ padding: "10px" });
    $(".book-summary").prepend(container);

    // Load Pagefind CSS
    $('head').append('<link rel="stylesheet" href="pagefind/pagefind-ui.css">');

    // Load Pagefind UI JS and initialize
    $.getScript("pagefind/pagefind-ui.js", function() {
        new PagefindUI({
            element: "#search-container",
            showImages: false
        });
    });
});

gitbook.events.bind("start", function() {
    if (!localStorage.getItem("bookColorTheme")) {
        localStorage.setItem("bookColorTheme", "night");
        document.querySelector("html").classList.add("color-theme-night");
    }
});
