package bs;

import haxe.ui.components.Label;

/**
 * Bootstrap badge component.
 *
 * A small count/label chip built on top of `Label`. Background color comes
 * from the theme's `bg-{variant}` utility classes; text is whitened by the
 * `.bg-* .label` CSS rule.
 *
 * Usage:
 * `<bsbadge text="New" variant="success" pill="true" />`
 */
class BSBadge extends Label {
    /**
     * Color variant: `primary`, `secondary`, `success`, `danger`,
     * `warning`, `info`, `light`, `dark`. Maps to `bg-{variant}`.
     */
    public var variant(default, set):String = "primary";

    /**
     * Fully rounded "pill" shape (`rounded-pill` class).
     */
    public var pill(default, set):Bool = false;

    public function new() {
        super();
        apply();
    }

    private function set_variant(v:String):String { variant = v; apply(); return v; }
    private function set_pill(v:Bool):Bool { pill = v; apply(); return v; }

    /* Rebuild style classes from the current variant/pill state */
    private function apply():Void {
        styleNames = "badge bg-" + variant + (pill ? " rounded-pill" : "");
    }
}