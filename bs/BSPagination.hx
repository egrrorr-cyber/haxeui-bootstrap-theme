package bs;

import haxe.ui.components.Button;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;

class BSPagination extends HBox {
    public var pages(default, set):Int = 0;
    public var current(default, set):Int = 1;

    public function new() {
        super();
        styleNames = "pagination";
    }

    private function set_pages(v:Int):Int { pages = v; rebuild(); return v; }
    private function set_current(v:Int):Int { current = v; rebuild(); return v; }

    private function rebuild():Void {
        if (pages <= 0) return;
        removeAllComponents();
        for (i in 1...pages + 1) {
            var cls = "page-item";
            if (i == current) cls += " active";
            if (i == 1) cls += " first";
            if (i == pages) cls += " last";
            var item = new VBox();
            item.styleNames = cls;
            var b = new Button();
            b.styleNames = "page-link";
            b.text = Std.string(i);
            item.addComponent(b);
            addComponent(item);
        }
    }
}