package bs;

import haxe.ui.components.Label;

/**
 * Single breadcrumb item.
 *
 * Renders as a clickable link by default; the last item of a trail is
 * marked `active="true"` and shown as plain muted text instead.
 *
 * Usage:
 * `<bsbreadcrumb>
 *     <bsbreadcrumbitem text="Home" />
 *     <bsbreadcrumbitem text="Section" />
 *     <bsbreadcrumbitem text="Page" active="true" />
 * </bsbreadcrumb>`
 */
class BSBreadcrumbItem extends Label {
    /**
     * Marks the current (last) page: link styling is replaced
     * by the muted `active` class.
     */
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