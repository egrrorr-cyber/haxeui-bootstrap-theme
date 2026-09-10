package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap layout container.
 *
 * Page-level padded wrapper for content (`.container` class),
 * the Bootstrap equivalent of `<div class="container">`.
 *
 * Usage:
 * `<bscontainer>
 *     <bsrow>...</bsrow>
 * </bscontainer>`
 */
class BSContainer extends VBox {
    public function new() {
        super();
        styleNames = "container";
    }
}