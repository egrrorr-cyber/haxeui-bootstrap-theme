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

class BSModal extends Dialog {
    public function new() {
        super();
        addClass("modal-content");
        dialogTitle.addClass("modal-header");
        dialogTitleLabel.addClass("modal-title");
        dialogContent.addClass("modal-body");
        dialogFooterContainer.addClass("modal-footer");
        dialogFooter.addClass("modal-footer");
    }

    /* Дети уже маршрутизируются базой в dialogContent */

    public function addFooter(child:Component):Component {
        addFooterComponent(child);
        return child;
    }

    public function open():Void {
        centerDialog = false;
        autoCenterDialog = false;
        showDialog(true);
        Toolkit.callLater(function() {
            recenter();
            Toolkit.callLater(recenter);   // после полной валидации
        });
    }

    private function recenter():Void {
        var sw = Screen.instance.width;
        var sh = Screen.instance.height;
        moveComponent((sw - componentWidth) / 2, (sh - componentHeight) / 2);
    }

    public function close_():Void {
        hideDialog(DialogButton.CLOSE);
    }
}