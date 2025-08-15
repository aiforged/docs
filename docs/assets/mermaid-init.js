(function () {
  function currentTheme() {
    // Material sets data-md-color-scheme on <html>: 'default' (light) or 'slate' (dark)
    const scheme = document.documentElement.getAttribute('data-md-color-scheme');
    return scheme === 'slate' ? 'dark' : 'default';
  }

  function initMermaid() {
    if (!window.mermaid) return;
    window.mermaid.initialize({
      startOnLoad: false,
      securityLevel: 'loose',
      theme: currentTheme()
    });
    // Render all blocks on page
    window.mermaid.run({ querySelector: '.mermaid' });
  }

  // Initial render
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMermaid);
  } else {
    initMermaid();
  }

  // Re-render on Material's instant navigation
  if (window.document$) {
    document$.subscribe(() => initMermaid());
  }

  // Re-render when user toggles light/dark (palette toggle updates this attribute)
  const obs = new MutationObserver(initMermaid);
  obs.observe(document.documentElement, { attributes: true, attributeFilter: ['data-md-color-scheme'] });
})();