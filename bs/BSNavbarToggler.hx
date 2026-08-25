package bs;

import haxe.ui.containers.Box;
import haxe.ui.containers.VBox;

/**
 * Bootstrap navbar toggler (burger button).
 *
 * Three horizontal bars drawn as styled `Box`es; shown only below the
 * navbar's expand breakpoint. Click handling lives in `BSNavbar`, which
 * toggles the paired `BSNavbarCollapse`.
 *
 * Usage:
 * `<bsnavbartoggler />`
 */
class BSNavbarToggler extends VBox {
    public function new() {
        super();
        styleNames = "navbar-toggler";
        // the classic three-bar burger icon
        for (i in 0...3) {
            var bar = new Box();
            bar.styleNames = "navbar-toggler-bar";
            addComponent(bar);
        }
    }
}