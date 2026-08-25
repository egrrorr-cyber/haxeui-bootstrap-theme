package bs;

import haxe.ui.containers.VBox;

/**
 * Bootstrap jumbotron.
 *
 * Large padded hero block for headline content (`.jumbotron` class):
 * a lightweight showcase panel with rounded corners and muted background.
 *
 * Usage:
 * `<bsjumbotron>
 *     <label text="Hello, world!" styleNames="h1" />
 *     <label text="This is a simple hero unit." styleNames="lead" />
 * </bsjumbotron>`
 */
class BSJumbotron extends VBox {
    public function new() {
        super();
        styleNames = "jumbotron";
        percentWidth = 100;
    }
}