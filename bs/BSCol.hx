package bs;

import haxe.ui.containers.VBox;
import haxe.ui.core.Component;

/**
 * Bootstrap grid column.
 *
 * Maps to the theme's mobile-first grid classes (`_grid.css`); the row
 * wrapping is provided by `BSRow` (`horizontal-continuous` layout).
 * Widths per breakpoint: base (xs) → sm (≥576) → md (≥768) → lg (≥992).
 *
 * Usage:
 * `<bsrow>
 *     <bscol sm="6" md="3"><bscard>...</bscard></bscol>
 * </bsrow>`
 */
class BSCol extends VBox {
    /** Constant span (1–12) on ALL breakpoints (`col-N`). */
    public var cols(default, set):Int = 0;
    /** Span from sm (≥576) up; below it the column is full-width (`col-sm-N`). */
    public var sm(default, set):Int = 0;
    /** Span from md (≥768) up; below it the column is full-width (`col-md-N`). */
    public var md(default, set):Int = 0;
    /** Span from lg (≥992) up; below it the column is full-width (`col-lg-N`). */
    public var lg(default, set):Int = 0;

    public function new() {
        super();
        apply();
    }

    private function set_cols(v:Int):Int { cols = v; apply(); return v; }
    private function set_sm(v:Int):Int { sm = v; apply(); return v; }
    private function set_md(v:Int):Int { md = v; apply(); return v; }
    private function set_lg(v:Int):Int { lg = v; apply(); return v; }

    /**
     * Columns behave as block elements: stretch every child
     * to the full column width.
     */
    public override function addComponent(child:Component):Component {
        child.percentWidth = 100;
        return super.addComponent(child);
    }

    /* Rebuild grid classes from the current spans; default is col-12 */
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