package bs;

import haxe.ui.components.Button;

/**
 * Bootstrap button.
 *
 * Wraps the standard `Button` with Bootstrap's variant / outline / size
 * class system: `btn-{variant}`, `btn-outline-{variant}` and `btn-{size}`.
 *
 * Usage:
 * `<bsbutton text="Save" variant="success" />`
 * `<bsbutton text="Delete" variant="danger" outline="true" size="sm" />`
 */
class BSButton extends Button {
    /**
     * Color variant: `primary`, `secondary`, `success`, `danger`,
     * `warning`, `info`, `light`, `dark`, `link`.
     */
    public var variant(default, set):String = "primary";

    /**
     * Outline style: transparent background with colored border/text
     * (`btn-outline-{variant}` instead of `btn-{variant}`).
     */
    public var outline(default, set):Bool = false;

    /**
     * Size modifier: `""` (default), `sm` or `lg`.
     */
    public var size(default, set):String = "";

    public function new() {
        super();
        apply();
    }

    private function set_variant(v:String):String { variant = v; apply(); return v; }
    private function set_outline(v:Bool):Bool { outline = v; apply(); return v; }
    private function set_size(v:String):String { size = v; apply(); return v; }

    /* Rebuild style classes from the current variant/outline/size state */
    private function apply():Void {
        var cls = (outline ? "btn-outline-" : "btn-") + variant;
        if (size != "") cls += " btn-" + size;
        styleNames = cls;
    }
}