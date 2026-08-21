package bs;

import haxe.ui.containers.VBox;

class BSAlert extends VBox {
    public var variant(default, set):String = "primary";

    public function new() {
        super();
        apply();
    }

    private function set_variant(v:String):String { variant = v; apply(); return v; }

    private function apply():Void {
        styleNames = "alert alert-" + variant;
    }
}