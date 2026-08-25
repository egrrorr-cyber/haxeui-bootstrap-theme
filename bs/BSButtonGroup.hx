package bs;

import haxe.ui.containers.HBox;

/**
 * Bootstrap button group.
 *
 * Joins a row of buttons into a single visual unit: squared-off inner
 * corners and rounded outer ends are handled by the `.btn-group` CSS
 * (`.first` / `.last` classes are assigned by the container logic).
 *
 * Usage:
 * `<bsbuttongroup>
 *     <bsbutton text="Left" />
 *     <bsbutton text="Middle" />
 *     <bsbutton text="Right" />
 * </bsbuttongroup>`
 */
class BSButtonGroup extends HBox {
    public function new() {
        super();
        styleNames = "btn-group";
    }
}