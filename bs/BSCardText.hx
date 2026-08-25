package bs;

import haxe.ui.components.Label;

/**
 * Bootstrap card text.
 *
 * Muted body text for use inside `BSCardBody` (`.card-text` class).
 *
 * Usage:
 * `<bscardbody>
 *     <bscardtitle text="Title" />
 *     <bscardtext text="Supporting text below as a natural lead-in." />
 * </bscardbody>`
 */
class BSCardText extends Label {
    public function new() {
        super();
        styleNames = "card-text";
    }
}