package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.Box;

/**
 * Bootstrap progress bar.
 *
 * A track with a colored fill bar; the fill width follows the inherited
 * `value` property (0–100). Optionally shows the percentage as centered
 * white text.
 *
 * Usage:
 * `<bsprogress value="60" variant="success" showValue="true" />`
 */
class BSProgress extends Box {
    /* Colored fill bar (width = value %) */
    private var _bar:Box;
    /* Optional centered percentage label */
    private var _label:Label;

    /** Fill color: primary | success | danger | warning | info */
    public var variant(default, set):String = "primary";
    /** Shows the percentage text inside the bar. */
    public var showValue(default, set):Bool = false;

    public function new() {
        super();
        styleNames = "progress";
        percentWidth = 100;
        height = 16;

        // fill layer
        _bar = new Box();
        _bar.styleNames = "progress-bar bg-primary";
        _bar.percentHeight = 100;
        addComponent(_bar);

        // percentage overlay, hidden unless showValue
        _label = new Label();
        _label.styleNames = "progress-label";
        _label.hidden = true;
        addComponent(_label);
    }

    /**
     * Overrides the inherited `value` setter: clamps to 0–100,
     * resizes the fill bar and refreshes the percentage label.
     */
    private override function set_value(v:Dynamic):Dynamic {
        var f:Float = Std.parseFloat(Std.string(v));
        if (Math.isNaN(f)) f = 0;
        f = Math.max(0, Math.min(100, f));

        super.set_value(f);
        if (_bar != null) _bar.percentWidth = f;
        if (_label != null) _label.text = Std.int(f) + "%";
        return f;
    }

    /* Swap the bg-* class on the fill bar */
    private function set_variant(v:String):String {
        if (_bar != null) {
            _bar.removeClass("bg-" + variant);
            _bar.addClass("bg-" + v);
        }
        variant = v;
        return v;
    }

    private function set_showValue(v:Bool):Bool {
        showValue = v;
        if (_label != null) _label.hidden = !v;
        return v;
    }
}