package ;

import haxe.ui.containers.ScrollView;
import haxe.ui.events.MouseEvent;
import bs.BSButton;
import bs.BSModal;
import haxe.ui.components.Label;
import haxe.ui.Toolkit; 

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends ScrollView {

    public function new() {
        super();

        var openBtn = cast(this.findComponent("openModal"), BSButton);
        openBtn.onClick = function(_) {
            var modal = new BSModal();
            modal.title = "Confirm action";

            var msg = new Label();
            msg.text = "Do you really want to continue?";
            modal.addComponent(msg);

            var yes = new BSButton();
            yes.text = "Yes";
            yes.variant = "primary";
            yes.onClick = function(_) modal.close_();
            modal.addFooter(yes);

            var no = new BSButton();
            no.text = "Cancel";
            no.variant = "secondary";
            no.onClick = function(_) modal.close_();
            modal.addFooter(no);

            modal.open();
        };

        var toggle = cast(this.findComponent("themeToggle"), BSButton);
        toggle.onClick = function(_) {
            Toolkit.theme = (Toolkit.theme == "dark") ? "bootstrap" : "dark";
        };
    }
}