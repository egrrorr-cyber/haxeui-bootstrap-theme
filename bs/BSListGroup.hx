package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.VBox;

/**
 * Bootstrap list group.
 *
 * Vertical bordered list of `BSListGroupItem`s (`.list-group` class).
 * Items can be added in XML or programmatically via `addItem()`.
 *
 * Usage:
 * `<bslistgroup>
 *     <bslistgroupitem text="Current" active="true" />
 *     <bslistgroupitem text="Disabled" disabled="true" />
 * </bslistgroup>`
 */
class BSListGroup extends VBox {
    public function new() {
        super();
        styleNames = "list-group";
        percentWidth = 100;
    }

    /**
     * Programmatic shortcut for adding an item.
     *
     * @param text     item label
     * @param active   highlight as the current item
     * @param disabled grey out and make non-interactive
     * @return the created item (for event wiring, etc.)
     */
    public function addItem(text:String, active:Bool = false, disabled:Bool = false):BSListGroupItem {
        var item = new BSListGroupItem();
        item.text = text;
        item.active = active;
        item.disabled = disabled;
        addComponent(item);
        return item;
    }
}