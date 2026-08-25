package bs;

import haxe.ui.components.Button;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;

/**
 * Bootstrap pagination.
 *
 * Renders a row of numbered page links. Changing `pages` or `current`
 * rebuilds the row; the current page gets `active`, the ends get
 * `first` / `last` for rounded corners.
 *
 * Usage:
 * `<bspagination pages="5" current="2" />`
 */
class BSPagination extends HBox {
    /** Total number of pages (rebuilds the row on change). */
    public var pages(default, set):Int = 0;
    /** Currently highlighted page, 1-based (rebuilds the row on change). */
    public var current(default, set):Int = 1;

    public function new() {
        super();
        styleNames = "pagination";
    }

    private function set_pages(v:Int):Int { pages = v; rebuild(); return v; }
    private function set_current(v:Int):Int { current = v; rebuild(); return v; }

    /* Rebuild the page items from scratch */
    private function rebuild():Void {
        if (pages <= 0) return;
        removeAllComponents();
        for (i in 1...pages + 1) {
            // page-item wrapper carries state classes for CSS
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