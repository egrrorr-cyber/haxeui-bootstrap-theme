package bs;

import haxe.ui.components.Label;

class BSBreadcrumbItem extends Label {
	public var active(default, set):Bool = false;

	public function new() {
		super();
		styleNames = "link";
	}

	private function set_active(v:Bool):Bool {
		active = v;
		styleNames = v ? "active" : "link";
		return v;
	}
}
