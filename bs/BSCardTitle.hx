package bs;

import haxe.ui.components.Label;

/**
 * Bootstrap card title.
 *
 * Bold heading label for use inside `BSCardBody` (`.card-title` class).
 *
 * Usage:
 * `<bscardbody>
 *     <bscardtitle text="Card title" />
 *     <bscardtext text="Supporting text below." />
 * </bscardbody>`
 */
class BSCardTitle extends Label {
    public function new() {
        super();
        styleNames = "card-title";
    }
}