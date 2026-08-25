package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap card footer.
 *
 * Muted strip at the bottom of a `BSCard` (`.card-footer` class),
 * typically holding actions or metadata.
 *
 * Usage:
 * `<bscardfooter>
 *     <label text="2 days ago" styleNames="text-muted" />
 * </bscardfooter>`
 */
class BSCardFooter extends VBox {
    public function new() {
        super();
        styleNames = "card-footer";
    }
}