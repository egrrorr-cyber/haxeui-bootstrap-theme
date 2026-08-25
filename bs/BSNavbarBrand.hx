package bs;

import haxe.ui.components.Label;

/**
 * Bootstrap navbar brand.
 *
 * The site/app title shown at the start of a `BSNavbar`
 * (`.navbar-brand` class: bold, larger text).
 *
 * Usage:
 * `<bsnavbarbrand text="Album" />`
 */
class BSNavbarBrand extends Label {
    public function new() {
        super();
        styleNames = "navbar-brand";
    }
}