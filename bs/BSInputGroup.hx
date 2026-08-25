package bs;

import haxe.ui.containers.HBox;

/**
 * Bootstrap input group.
 *
 * Joins a text field with addons (buttons, `.input-group-text` labels)
 * into a single visual unit with squared inner corners.
 *
 * Usage:
 * `<bsinputgroup>
 *     <label text="@" styleNames="input-group-text first" />
 *     <textfield percentWidth="100" />
 *     <bsbutton text="Go" size="sm" styleNames="last" />
 * </bsinputgroup>`
 */
class BSInputGroup extends HBox {
    public function new() {
        super();
        styleNames = "input-group";
    }
}