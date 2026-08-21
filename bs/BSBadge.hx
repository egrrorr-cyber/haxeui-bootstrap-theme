package bs;

import haxe.ui.components.Label;

class BSBadge extends Label {
    public var variant(default, set):String = "primary";
    public var pill(default, set):Bool = false;

    public function new() {
        super();
        apply();
    }

    private function set_variant(v:String):String { variant = v; apply(); return v; }
    private function set_pill(v:Bool):Bool { pill = v; apply(); return v; }

    private function apply():Void {
        styleNames = "badge bg-" + variant + (pill ? " rounded-pill" : "");
    }
}