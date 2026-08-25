package bs;

using StringTools;
import haxe.ui.components.DropDown;
import haxe.ui.data.ArrayDataSource;

/**
 * Bootstrap-styled dropdown (select).
 *
 * Extends the standard `DropDown` with a convenience `items` attribute:
 * a comma-separated string that is expanded into a data source, so simple
 * option lists need no extra XML markup.
 *
 * Usage:
 * `<bsdropdown items="Developer, Designer, Manager" />`
 */
class BSDropdown extends DropDown {
    /**
     * Comma-separated option list, e.g. `"One, Two, Three"`.
     * Each entry is trimmed and added as a data source row.
     */
    public var items(default, set):String = "";

    private function set_items(v:String):String {
        items = v;
        var ds = new ArrayDataSource();
        for (s in v.split(",")) {
            ds.add({ text: StringTools.trim(s) });
        }
        dataSource = ds;
        return v;
    }
}