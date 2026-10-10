// Videos, the founder date, "Send to my Mac". Loads and stores nothing.
(function () {
  var d = document, still = matchMedia("(prefers-reduced-motion: reduce)"), held = false, shown = new Set();
  var vids = [].slice.call(d.querySelectorAll("video.m")), save = navigator.connection && navigator.connection.saveData;
  function btn(v) { return v.parentNode.querySelector(".motion"); }
  function sync(v) {
    var b = btn(v); if (!b) return;
    b.hidden = false;
    b.setAttribute("aria-label", v.paused ? "Play" : "Pause");
    b.classList.toggle("big", v.paused && (still.matches || save || v.dataset.failed));
  }
  function play(v) {
    var r = v.play();
    if (r && r.catch) r.catch(function () { v.dataset.failed = 1; sync(v); });
  }
  function quiet() { return still.matches || save; }
  function apply() {
    vids.forEach(function (v) {
      v.removeAttribute("controls");
      v.loop = !still.matches;
      if (quiet()) v.pause();
      else if (!held && (v.classList.contains("hero-v") || shown.has(v))) play(v);
      sync(v);
    });
  }
  vids.forEach(function (v) {
    ["play", "pause"].forEach(function (e) { v.addEventListener(e, function () { sync(v); }); });
    btn(v) && btn(v).addEventListener("click", function () {
      if (v.paused) { held = false; delete v.dataset.failed; play(v); }
      else { held = true; vids.forEach(function (o) { o.pause(); }); }
    });
  });
  if ("IntersectionObserver" in window) {
    var io = new IntersectionObserver(function (es) {
      es.forEach(function (e) {
        var v = e.target;
        if (e.isIntersecting) { shown.add(v); if (!held && !quiet()) play(v); }
        else { shown.delete(v); v.pause(); }
      });
    }, { threshold: 0.5 });
    vids.forEach(function (v) { if (!v.classList.contains("hero-v")) io.observe(v); });
  }
  still.addEventListener && still.addEventListener("change", apply);
  apply();

  // The founder period may end between deploys.
  d.querySelectorAll("[data-closes]").forEach(function (c) {
    var left = Math.ceil((Date.parse(c.dataset.closes) - Date.now()) / 864e5), p = c.querySelector("[data-days]");
    if (left < 1) c.innerHTML = "<p></p>", c.firstChild.textContent = c.dataset.closed;
    else if (p) p.textContent += " " + left + (left > 1 ? " days" : " day") + " left to become a founder.";
  });

  // A phone: send the link to a Mac.
  if (!matchMedia("(hover: none) and (pointer: coarse)").matches) return;
  var live = d.createElement("span"), url = "https://omac.ghostype.ca/#get";
  live.className = "sr-status"; live.setAttribute("aria-live", "polite"); d.body.appendChild(live);
  d.querySelectorAll("a[data-share]").forEach(function (a) {
    if (navigator.share) a.textContent = "Send to my Mac";
    else if (navigator.clipboard) a.textContent = "Copy link for your Mac";
    else return;
    a.addEventListener("click", function (e) {
      e.preventDefault();
      if (navigator.share) navigator.share({ title: "Omac", url: url }).catch(function () {});
      else navigator.clipboard.writeText(url).then(function () { live.textContent = "Link copied"; });
    });
  });
  d.querySelectorAll("[data-touch]").forEach(function (p) { p.textContent = p.dataset.touch; });
})();
