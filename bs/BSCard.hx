package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.VBox;

/**
 * Bootstrap card container.
 *
 * A flexible content box with border, rounded corners and white (themed)
 * background. Combine with `BSCardHeader`, `BSCardBody` and `BSCardFooter`
 * children for the classic card anatomy.
 *
 * Usage:
 * `<bscard>
 *     <bscardheader text="Header" />
 *     <bscardbody>
 *         <label text="Card content" />
 *     </bscardbody>
 * </bscard>`
 */
class BSCard extends VBox {
    public function new() {
        super();
        styleNames = "card";
    }
}