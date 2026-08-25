package bs;

import haxe.ui.components.Button;
import haxe.ui.components.Label;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.containers.dialogs.Dialog.DialogButton;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.Toolkit;

/**
 * Bootstrap-styled modal dialog.
 *
 * Restyles the built-in `Dialog` with Bootstrap modal classes:
 * header / body / footer parts get `modal-header` / `modal-body` /
 * `modal-footer` styling on top of the native dialog structure.
 *
 * Usage:
 * `<bsmodal id="myModal" title="Confirm">
 *     <label text="Are you sure?" />
 *     <bsbutton text="OK" onClick="myModal.close_()" />
 * </bsmodal>`
 */
class BSModal extends Dialog {
    public function new() {
        super();
        // map native dialog parts onto Bootstrap modal anatomy
        addClass("modal-content");
        dialogTitle.addClass("modal-header");
        dialogTitleLabel.addClass("modal-title");
        dialogContent.addClass("modal-body");
        dialogFooterContainer.addClass("modal-footer");
        dialogFooter.addClass("modal-footer");
    }

    /**
     * Convenience wrapper to append footer content (buttons, etc.),
     * returning the added component for chaining/event wiring.
     */
    public function addFooter(child:Component):Component {
        addFooterComponent(child);
        return child;
    }

    /**
     * Shows the modal and centers it manually.
     *
     * Native dialog auto-centering is disabled because the dialog is
     * mounted at screen level; centering is applied after layout settles
     * (double `callLater` waits for the dialog to be measured).
     */
    public function open():Void {
        centerDialog = false;
        autoCenterDialog = false;
        showDialog(true);
        Toolkit.callLater(function() {
            recenter();
            Toolkit.callLater(recenter);
        });
    }

    /* Centers the dialog in the current screen bounds */
    private function recenter():Void {
        var sw = Screen.instance.width;
        var sh = Screen.instance.height;
        moveComponent((sw - componentWidth) / 2, (sh - componentHeight) / 2);
    }

    /**
     * Hides the modal reporting `DialogButton.CLOSE` as the result.
     * (Named `close_` to avoid clashing with the native dialog API.)
     */
    public function close_():Void {
        hideDialog(DialogButton.CLOSE);
    }
}