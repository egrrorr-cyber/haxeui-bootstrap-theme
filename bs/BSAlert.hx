package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap alert component.
 *
 * A vertical container styled as a Bootstrap alert. Children (labels, etc.)
 * are laid out top-to-bottom; colors come from the `alert alert-{variant}`
 * CSS classes (see `_components.css`).
 *
 * Usage:
 * `<bsalert variant="success"><label text="Saved!" /></bsalert>`
 */
class BSAlert extends VBox {
    /**
     * Alert color variant: `primary`, `success`, `danger`, `warning`, `info`.
     * Re-applies style classes on change.
     */
    public var variant(default, set):String = "primary";

    public function new() {
        super();
        apply();
    }

    private function set_variant(v:String):String {
        variant = v;
        apply();
        return v;
    }

    /* Swap style classes to match the current variant */
    private function apply():Void {
        styleNames = "alert alert-" + variant;
    }
}