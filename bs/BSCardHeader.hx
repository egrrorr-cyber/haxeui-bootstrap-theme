package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap card header.
 *
 * Muted strip at the top of a `BSCard` (`.card-header` class),
 * typically holding a title or toolbar.
 *
 * Usage:
 * `<bscardheader>
 *     <label text="Featured" />
 * </bscardheader>`
 */
class BSCardHeader extends VBox {
    public function new() {
        super();
        styleNames = "card-header";
    }
}