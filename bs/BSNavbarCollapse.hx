package bs;

import haxe.ui.containers.HBox;

/**
 * Bootstrap navbar collapse container.
 *
 * Holds the collapsible navbar content (nav items, forms). Visibility on
 * mobile is driven by `BSNavbar` via the `expanded` flag; the `show` class
 * is kept in sync for CSS styling hooks.
 *
 * Usage:
 * `<bsnavbarcollapse>
 *     <bsnavitem text="Home" />
 * </bsnavbarcollapse>`
 */
class BSNavbarCollapse extends HBox {
    /** Mobile state: true = collapse is open, false = hidden. */
    public var expanded(default, set):Bool = false;

    public function new() {
        super();
        styleNames = "navbar-collapse";
        update();
    }

    private function set_expanded(v:Bool):Bool {
        expanded = v;
        update();
        return v;
    }

    /* Keep the `show` class in sync with the expanded state */
    private function update() {
        if (expanded) {
            addClass("show");
        } else {
            removeClass("show");
        }
    }
}