package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap card body.
 *
 * The main padded content area of a `BSCard` (`.card-body` class).
 *
 * Usage:
 * `<bscardbody>
 *     <label text="Card content" />
 * </bscardbody>`
 */
class BSCardBody extends VBox {
    public function new() {
        super();
        styleNames = "card-body";
    }
}