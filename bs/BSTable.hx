package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;

/**
 * Bootstrap table.
 *
 * A simple table built from rows of equal-width cells. The first row is
 * usually a header (`addHeader`); body rows added via `addRow` alternate
 * a striped background automatically.
 *
 * Usage (code):
 * `var t = new BSTable();
 *  t.addHeader(["#", "First", "Last"]);
 *  t.addRow(["1", "Mark", "Otto"]);`
 */
class BSTable extends VBox {
    /* Body row counter, drives the striped (odd/even) alternation */
    private var _bodyRows:Int = 0;

    public function new() {
        super();
        styleNames = "table";
        percentWidth = 100;
        verticalSpacing = 0;
    }

    /** Adds the header row (bold text on a muted background). */
    public function addHeader(cols:Array<String>):Void {
        addRowImpl(cols, "table-row table-head");
    }

    /** Adds a body row; odd rows get the `table-striped` background. */
    public function addRow(cols:Array<String>):Void {
        var cls = "table-row";
        if (_bodyRows % 2 == 1) cls += " table-striped";
        _bodyRows++;
        addRowImpl(cols, cls);
    }

    /* Builds one row: equal-width cells (100% / column count) */
    private function addRowImpl(cols:Array<String>, rowClass:String):Void {
        var row = new HBox();
        row.styleNames = rowClass;
        row.percentWidth = 100;
        var w:Float = 100 / cols.length;
        for (c in cols) {
            var l = new Label();
            l.text = c;
            l.styleNames = "table-cell";
            l.percentWidth = w;
            row.addComponent(l);
        }
        addComponent(row);
    }
}