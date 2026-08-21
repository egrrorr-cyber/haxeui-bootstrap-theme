package bs;

using StringTools;
import haxe.ui.components.DropDown;
import haxe.ui.data.ArrayDataSource;

class BSDropdown extends DropDown {
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