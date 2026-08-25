package bs;

import haxe.ui.containers.HBox;

/**
 * Bootstrap grid row.
 *
 * Horizontal container for `BSCol` columns. Wrapping (flex-wrap-like
 * behavior) and gutters come from the `.row` CSS class, which applies
 * the `horizontal-continuous` layout — columns whose widths overflow
 * are moved to the next line.
 *
 * Usage:
 * `<bsrow>
 *     <bscol sm="6" md="3">...</bscol>
 *     <bscol sm="6" md="3">...</bscol>
 * </bsrow>`
 */
class BSRow extends HBox {
    public function new() {
        super();
        styleNames = "row";
    }
}