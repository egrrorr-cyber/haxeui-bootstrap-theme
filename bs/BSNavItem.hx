package bs;

import haxe.ui.components.Button;

/**
 * Bootstrap nav item (link).
 *
 * A navigation link built on `Button` with link-like styling
 * (`.nav-link` class). `active` marks the current page.
 *
 * Usage:
 * `<bsnavitem text="Home" active="true" />`
 * `<bsnavitem text="About" />`
 */
class BSNavItem extends Button {
    /** Highlights the item as the current page (`active` class). */
    public var active(default, set):Bool = false;

    public function new() {
        super();
        styleNames = "nav-link";
    }

    private function set_active(v:Bool):Bool {
        active = v;
        if (v) addClass("active") else removeClass("active");
        return v;
    }
}