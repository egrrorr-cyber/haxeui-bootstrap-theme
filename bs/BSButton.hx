package bs;

import haxe.ui.components.Button;

class BSButton extends Button {
    public var variant(default, set):String = "primary";
    public var outline(default, set):Bool = false;
    public var size(default, set):String = "";

    public function new() {
        super();
        apply();
    }

    private function set_variant(v:String):String { variant = v; apply(); return v; }
    private function set_outline(v:Bool):Bool { outline = v; apply(); return v; }
    private function set_size(v:String):String { size = v; apply(); return v; }

    private function apply():Void {
        var cls = (outline ? "btn-outline-" : "btn-") + variant;
        if (size != "") cls += " btn-" + size;
        styleNames = cls;
    }
}