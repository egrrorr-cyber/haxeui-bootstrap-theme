package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.HBox;
import haxe.ui.core.Component;

/**
 * Bootstrap breadcrumb trail.
 *
 * A horizontal row of navigation links. `›` separators are inserted
 * automatically between items, so callers only add the items themselves
 * (typically `Label`s styled as links, with `styleNames="active"` on the
 * last one).
 *
 * Usage:
 * `<bsbreadcrumb>
 *     <label text="Home" styleNames="link" />
 *     <label text="Section" styleNames="link" />
 *     <label text="Page" styleNames="active" />
 * </bsbreadcrumb>`
 */
class BSBreadcrumb extends HBox {
    public function new() {
        super();
        styleNames = "breadcrumb";
        verticalAlign = "center";
    }

    /**
     * Adds a breadcrumb item, prefixing it with a `›` separator
     * unless it is the first item in the trail.
     */
    public override function addComponent(child:Component):Component {
        if (numComponents > 0) {
            var sep = new Label();
            sep.text = "›";
            sep.styleNames = "separator";
            super.addComponent(sep);
        }
        return super.addComponent(child);
    }
}