/* Progressive catalogue search. All content is present in the generated HTML. */
(() => {
  "use strict";

  const search = document.getElementById("search");
  const category = document.getElementById("category");
  const lean = document.getElementById("lean-status");
  const rows = [...document.querySelectorAll(".result-row")];
  const count = document.getElementById("results-count");
  const empty = document.getElementById("empty-state");
  const clearButtons = [...document.querySelectorAll("#clear-filters, [data-clear-filters]")];

  // Fold accents so Erdős is also discoverable with an ordinary Latin keyboard.
  const normalize = value => String(value || "")
    .normalize("NFKD")
    .replace(/\p{Diacritic}/gu, "")
    .toLocaleLowerCase("en")
    .replace(/[’‘]/g, "'")
    .replace(/[–—−]/g, "-")
    .replace(/\s+/g, " ")
    .trim();

  const validValue = (select, value) => {
    if (!select || !value) return "";
    return [...select.options].some(option => option.value === value) ? value : "";
  };

  if (search && category && lean && rows.length) {
    const indexed = rows.map(row => ({
      row,
      text: normalize(row.dataset.search || row.textContent),
      category: row.dataset.category || "",
      status: row.dataset.status || "none",
    }));

    const readUrl = () => {
      const parameters = new URLSearchParams(window.location.search);
      search.value = parameters.get("q") || "";
      category.value = validValue(category, parameters.get("category"));
      lean.value = validValue(lean, parameters.get("lean"));
    };

    const writeUrl = () => {
      const url = new URL(window.location.href);
      const parameters = { q: search.value.trim(), category: category.value, lean: lean.value };
      Object.entries(parameters).forEach(([key, value]) => {
        if (value) url.searchParams.set(key, value);
        else url.searchParams.delete(key);
      });
      // File previews can prohibit History API changes; filtering still works.
      try { window.history.replaceState(null, "", url); } catch (_) { /* no-op */ }
    };

    const applyFilters = (updateUrl = true) => {
      const terms = normalize(search.value).match(/"[^"]+"|\S+/g) || [];
      const tokens = terms.map(term => term.replace(/^"|"$/g, ""));
      let visible = 0;

      indexed.forEach(item => {
        const matches = (!category.value || item.category === category.value)
          && (!lean.value || item.status === lean.value)
          && tokens.every(token => item.text.includes(token));
        item.row.hidden = !matches;
        if (matches) visible += 1;
      });

      if (count) {
        const noun = visible === 1 ? "result" : "results";
        count.textContent = visible === rows.length
          ? `${visible} ${noun}`
          : `${visible} of ${rows.length} results`;
      }
      if (empty) empty.hidden = visible > 0;
      const active = Boolean(search.value.trim() || category.value || lean.value);
      clearButtons.forEach(button => { button.hidden = !active; });
      if (updateUrl) writeUrl();
    };

    let timer;
    search.addEventListener("input", () => {
      window.clearTimeout(timer);
      timer = window.setTimeout(applyFilters, 100);
    });
    category.addEventListener("change", () => applyFilters());
    lean.addEventListener("change", () => applyFilters());

    const form = search.closest("form");
    if (form) form.addEventListener("submit", event => {
      event.preventDefault();
      window.clearTimeout(timer);
      applyFilters();
    });

    clearButtons.forEach(button => button.addEventListener("click", event => {
      event.preventDefault();
      window.clearTimeout(timer);
      search.value = "";
      category.value = "";
      lean.value = "";
      applyFilters();
      search.focus();
    }));

    document.addEventListener("keydown", event => {
      const target = event.target;
      const editing = target instanceof HTMLElement
        && (target.isContentEditable || /^(INPUT|TEXTAREA|SELECT)$/.test(target.tagName));
      if (event.key === "/" && !editing && !event.ctrlKey && !event.metaKey && !event.altKey) {
        event.preventDefault();
        search.focus();
        search.select();
      }
      if (event.key === "Escape" && document.activeElement === search && search.value) {
        event.preventDefault();
        window.clearTimeout(timer);
        search.value = "";
        applyFilters();
      }
    });

    window.addEventListener("popstate", () => { readUrl(); applyFilters(false); });
    readUrl();
    applyFilters(false);
  }

  const tocLinks = [...document.querySelectorAll(".page-toc a[href^='#']")];
  if (tocLinks.length && "IntersectionObserver" in window) {
    const headings = new Map();
    tocLinks.forEach(link => {
      let id;
      try { id = decodeURIComponent(link.hash.slice(1)); } catch (_) { return; }
      const heading = document.getElementById(id);
      if (heading) headings.set(heading, link);
    });
    const observer = new IntersectionObserver(entries => {
      const visible = entries.filter(entry => entry.isIntersecting)
        .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top);
      if (!visible.length) return;
      tocLinks.forEach(link => link.removeAttribute("aria-current"));
      const active = headings.get(visible[0].target);
      if (active) active.setAttribute("aria-current", "location");
    }, { rootMargin: "-8% 0px -65% 0px", threshold: 0 });
    headings.forEach((_, heading) => observer.observe(heading));
  }
})();
