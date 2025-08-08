gitbook.events.bind("start", function() {
    var searchContainer = $('<div id="search-container"></div>')
        .css({ padding: "10px" });
    $(".book-summary").prepend(searchContainer);

    $('head').append('<link rel="stylesheet" href="pagefind/pagefind-ui.css">');
    $.getScript("pagefind/pagefind-ui.js", function() {
        new PagefindUI({
            element: "#search-container",
            showImages: false
        });
    });
});
