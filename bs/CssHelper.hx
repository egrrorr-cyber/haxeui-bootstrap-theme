package bs;

import haxe.ui.styles.Value;
import haxe.ui.styles.ValueTools;
import haxe.ui.util.Color;

/**
 * Custom CSS function helpers for the Bootstrap theme stylesheets.
 *
 * Registers callable functions usable directly in CSS rules, e.g.
 * `background-color: rgba(#000000, 0.03);`.
 * See `CssFunctions.registerCssFunction` wiring in the theme entry point.
 */
class CssHelper {
    /**
     * CSS `rgba(color, alpha)`.
     *
     * True alpha blending is rendered incorrectly on some backends (OpenFL/HL),
     * so the color is pre-blended against a white background at parse time:
     * `result = channel * alpha + 255 * (1 - alpha)`.
     * Dark theme rules avoid this function and use solid colors instead.
     *
     * @param vl function arguments: [0] base color as int, [1] alpha in 0..1
     * @return packed RGB int usable as a HaxeUI color value
     */
    public static function rgba(vl:Array<Value>):Any {
        if (vl.length < 2) {
            return 0;
        }
        var c:Int = ValueTools.int(vl[0]);
        var alpha:Float = ValueTools.float(vl[1]);

        // unpack source RGB channels
        var r = (c >> 16) & 0xFF;
        var g = (c >> 8) & 0xFF;
        var b = c & 0xFF;

        // blend each channel over white and repack
        var mr = Std.int(r * alpha + 255 * (1 - alpha));
        var mg = Std.int(g * alpha + 255 * (1 - alpha));
        var mb = Std.int(b * alpha + 255 * (1 - alpha));

        return Color.fromComponents(mr, mg, mb, 0).toInt();
    }
}