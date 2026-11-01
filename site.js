// Shared behaviour for the sub-pages (blog, provider guides, 404). The homepage
// inlines the same logic. The theme itself is applied by a tiny inline script in
// each page's <head> so there is no flash of the wrong colour scheme.
(function () {
  var year = document.getElementById('current-year');
  if (year) year.textContent = new Date().getFullYear();

  var root = document.documentElement;
  var toggle = document.getElementById('theme-toggle');
  if (toggle) {
    toggle.setAttribute('aria-pressed', String(root.classList.contains('dark')));
    toggle.addEventListener('click', function () {
      var dark = root.classList.toggle('dark');
      toggle.setAttribute('aria-pressed', String(dark));
      try { localStorage.theme = dark ? 'dark' : 'light'; } catch (e) {}
    });
  }

  // Wire up obfuscated email links at runtime (avoids Cloudflare email
  // obfuscation rewriting to /cdn-cgi/l/email-protection which 404s for
  // crawlers that don't execute JS).
  document.querySelectorAll('a.js-email').forEach(function (a) {
    var addr = a.dataset.emailUser + '@' + a.dataset.emailDomain;
    a.setAttribute('href', 'mail' + 'to:' + addr);
    if (a.hasAttribute('data-show-address') || a.textContent.trim() === '') a.textContent = addr;
  });
})();
