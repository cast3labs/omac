// A "Copy" button beside each command (PLAN-ship G17). Loads from this site
// only, sends nothing, and does nothing without the clipboard API.
(function () {
  if (!navigator.clipboard || !document.querySelectorAll) return;
  // The button's label is fixed, so its "Copied" is never read out: say the
  // result in a polite live region instead.
  var status = document.createElement("span");
  status.className = "sr-status";
  status.setAttribute("role", "status");
  status.setAttribute("aria-live", "polite");
  document.body.appendChild(status);
  function say(text) { status.textContent = ""; setTimeout(function () { status.textContent = text; }, 50); }
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
        say("Command copied");
        setTimeout(function () { button.textContent = "Copy"; }, 1500);
      }, function () {
        button.textContent = "Select it and press ⌘C";
        say("Could not copy: select the command and press Command-C");
      });
    });
    pre.classList.add("has-copy");
    pre.appendChild(button);
  });
})();
