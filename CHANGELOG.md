# Changelog

## 0.2.0

### New components
- **Navigation**: `BSNavbar` + `BSNavbarBrand`, `BSNavbarToggler`, `BSNavbarCollapse`,
  `BSNavItem` — responsive navbar with `expand` breakpoints
  (`never | always | sm | md | lg | xl | xxl`) and live resize handling.
- **Overlays**: `BSOffcanvas` (dimmed backdrop + right panel, screen-level),
  `BSToast` (shared screen-level stack, auto-hide), `BSModal`
  (Bootstrap-styled `Dialog` with manual centering).
- **Content**: `BSCarousel` (slides, arrows, indicator dots), `BSTable`
  (header + striped rows), `BSListGroup` / `BSListGroupItem`
  (active / action / disabled), `BSProgress` (variants + % label),
  `BSJumbotron`, `BSInputGroup`, `BSButtonGroup`, `BSCloseButton`.

### Grid
- Mobile-first 12-column grid: `col-*`, `col-sm-*`, `col-md-*`, `col-lg-*`
  (breakpoints 576 / 768 / 992).
- `.row` uses the `horizontal-continuous` layout → true flex-wrap behavior
  for percent-width columns (Bootstrap-like 4 → 2×2 → 1 reflow).
- Utilities: `justify-content-*`, responsive display `d-*-none` / `d-*-block`,
  `.container`.

### Theme architecture
- Variables moved from `_variables.css` to `<var>` entries in `module.xml`
  (`bootstrap` and `dark` themes). **Breaking:** `_variables.css` removed.
- Custom CSS function `rgba()` registered (`bs.CssHelper.rgba`).
- Dark theme: full override set incl. default-theme variable inversion for
  stock widgets; solid colors instead of alpha blending (backend workaround).

### Styling
- Buttons: solid/outline variants with hover/active/disabled states, sizes.
- Forms: text inputs, checkbox, radio, dropdown with Bootstrap focus rings.
- Typography & utilities: `h1`–`h6`, `lead`, `text-*`, `bg-*`, spacing,
  borders, visibility.
- Components CSS: alerts, badges, cards, breadcrumbs, pagination, modal,
  tooltip, toast, progress, list group, button/input groups, jumbotron,
  offcanvas, table, carousel, tabs, accordion.