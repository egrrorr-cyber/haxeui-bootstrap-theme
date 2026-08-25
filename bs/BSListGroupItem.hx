package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.VBox;

/**
 * Bootstrap list group item.
 *
 * A single row of a `BSListGroup`. `active` highlights the current item;
 * `action` enables interactive (hover) styling for clickable rows.
 *
 * Usage:
 * `<bslistgroupitem text="Clickable" action="true" />
 * <bslistgroupitem text="Current" active="true" />`
 */
class BSListGroupItem extends Label {
    /** Highlights the item as current (blue background, white text). */
    public var active(default, set):Bool = false;
    /** Adds hover styling for interactive items (`list-group-item-action`). */
    public var action(default, set):Bool = false;

    public function new() {
        super();
        styleNames = "list-group-item";
        percentWidth = 100;
    }

    private function set_action(v:Bool):Bool {
        action = v;
        if (v) addClass("list-group-item-action");
        else removeClass("list-group-item-action");
        return v;
    }
    private function set_active(v:Bool):Bool {
        active = v;
        if (v) addClass("active"); else removeClass("active");
        return v;
    }
}