package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap fluid container.
 *
 * Full-width wrapper with side gutters (`.container-fluid`).
 * Width is fully CSS-driven (`width: 100%` in _grid.css) —
 * no code-side width/percent management, no sync calls.
 *
 * Usage:
 * `<bscontainerfluid>
 *     <bsrow>...</bsrow>
 * </bscontainerfluid>`
 */
class BSContainerFluid extends VBox {
    public function new() {
        super();
        styleNames = "container-fluid";
        percentWidth = 100;   // set before first style application — stable pattern
    }
}