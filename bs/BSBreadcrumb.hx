package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.HBox;
import haxe.ui.core.Component;

class BSBreadcrumb extends HBox {
    public function new() {
        super();
        styleNames = "breadcrumb";
        verticalAlign = "center";
    }

    public override function addComponent(child:Component):Component {
        if (numComponents > 0) {
            var sep = new Label();
            sep.text = "›";
            sep.styleNames = "separator";
            super.addComponent(sep);
        }
        return super.addComponent(child);
    }
}