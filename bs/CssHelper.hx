package bs;

import haxe.ui.styles.Value;
import haxe.ui.styles.ValueTools;
import haxe.ui.util.Color;

class CssHelper {
    /**
        rgba(#000000, 0.175) — полупрозрачный цвет, premultiplied поверх белого
        (как предвычисленные цвета Bootstrap для card border / header bg).
    **/
    public static function rgba(vl:Array<Value>):Any {
        if (vl.length < 2) {
            return 0;
        }
        var c:Int = ValueTools.int(vl[0]);
        var alpha:Float = ValueTools.float(vl[1]);

        var r = (c >> 16) & 0xFF;
        var g = (c >> 8) & 0xFF;
        var b = c & 0xFF;

        var mr = Std.int(r * alpha + 255 * (1 - alpha));
        var mg = Std.int(g * alpha + 255 * (1 - alpha));
        var mb = Std.int(b * alpha + 255 * (1 - alpha));

        return Color.fromComponents(mr, mg, mb, 0).toInt();
    }
}