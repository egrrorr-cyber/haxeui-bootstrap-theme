package bs;

import haxe.ui.containers.VBox;
import haxe.ui.core.Component;

class BSCol extends VBox {
    public var cols(default, set):Int = 0;
    public var sm(default, set):Int = 0;
    public var md(default, set):Int = 0;
    public var lg(default, set):Int = 0;

    public function new() {
        super();
        apply();
    }

    private function set_cols(v:Int):Int { cols = v; apply(); return v; }
    private function set_sm(v:Int):Int { sm = v; apply(); return v; }
    private function set_md(v:Int):Int { md = v; apply(); return v; }
    private function set_lg(v:Int):Int { lg = v; apply(); return v; }

    /* Колонка ведёт себя как блочный элемент: дети на всю ширину */
    public override function addComponent(child:Component):Component {
        child.percentWidth = 100;
        return super.addComponent(child);
    }

    private function apply():Void {
        var parts:Array<String> = [];
        if (cols > 0) parts.push("col-" + cols);
        if (sm > 0) parts.push("col-sm-" + sm);
        if (md > 0) parts.push("col-md-" + md);
        if (lg > 0) parts.push("col-lg-" + lg);
        if (parts.length == 0) parts.push("col-12");
        styleNames = parts.join(" ");
    }
}