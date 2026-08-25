package bs;

import haxe.ui.components.Button;

/**
 * Bootstrap close button (`×`).
 *
 * Generic dismiss control used in modals, offcanvas headers, toasts, etc.
 * Styled by `.btn-close`; wire its `onClick` to hide the owning component.
 *
 * Usage:
 * `<bsclosebutton onClick="myDialog.hide()" />`
 */
class BSCloseButton extends Button {
    public function new() {
        super();
        styleNames = "btn-close";
        text = "×";
    }
}