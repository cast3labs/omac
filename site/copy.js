// A "Copy" button beside each command (PLAN-ship G17). Loads from this site
// only, sends nothing, and does nothing without the clipboard API.
(function () {
  if (!navigator.clipboard || !document.querySelectorAll) return;
  document.querySelectorAll("pre > code[data-cmd]").forEach(function (code) {
    var pre = code.parentNode;
    var button = document.createElement("button");
    button.type = "button";
    button.className = "copy";
    button.textContent = "Copy";
    button.setAttribute("aria-label", "Copy the command");
    button.addEventListener("click", function () {
      navigator.clipboard.writeText(code.textContent.trim()).then(function () {
        button.textContent = "Copied";
        setTimeout(function () { button.textContent = "Copy"; }, 1500);
      }, function () { button.textContent = "Select it and press ⌘C"; });
    });
    pre.classList.add("has-copy");
    pre.appendChild(button);
  });
})();
