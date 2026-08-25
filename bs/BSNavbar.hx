package bs;

import haxe.ui.containers.HBox;
import haxe.ui.core.Screen;
import haxe.ui.events.UIEvent;
import haxe.ui.layouts.HorizontalLayout;
import haxe.ui.layouts.VerticalLayout;

/**
 * Bootstrap responsive navbar.
 *
 * Mirrors Bootstrap's `navbar-expand-*` behavior in code (CSS media queries
 * cannot swap layouts): above the breakpoint the navbar is a horizontal bar
 * with the collapse shown inline; below it the navbar stacks vertically,
 * the collapse is hidden and a `BSNavbarToggler` (burger) toggles it.
 *
 * Usage:
 * `<bsnavbar expand="md">
 *     <hbox style="spacing: 8; vertical-align: center">
 *         <bsnavbarbrand text="Album" />
 *         <bsnavbartoggler />
 *     </hbox>
 *     <bsnavbarcollapse>
 *         <bsnavitem text="Home" active="true" />
 *     </bsnavbarcollapse>
 * </bsnavbar>`
 */
class BSNavbar extends HBox {
    /* Burger button and collapsible section, discovered among children */
    private var _toggler:BSNavbarToggler;
    private var _collapse:BSNavbarCollapse;

    /** never | always | sm | md | lg | xl | xxl */
    public var expand(default, set):String = "md";

    public function new() {
        super();
        styleNames = "navbar";
        percentWidth = 100;
    }

    private function set_expand(v:String):String {
        expand = v;
        applyBreakpoint();
        return v;
    }

    /* Wire the toggler to the collapse and react to screen resizes */
    private override function onReady() {
        super.onReady();
        _toggler = findComponent(null, BSNavbarToggler, true, "css");
        _collapse = findComponent(null, BSNavbarCollapse, true, "css");

        if (_toggler != null && _collapse != null) {
            _toggler.onClick = function(_) {
                _collapse.expanded = !_collapse.expanded;
                applyBreakpoint();
            };
        }

        applyBreakpoint();
        // re-evaluate on live resize so the bar collapses/expands on the fly
        Screen.instance.registerEvent(UIEvent.RESIZE, function(_) applyBreakpoint());
    }

    /**
     * Applies the current breakpoint state:
     * desktop → horizontal bar, collapse inline, toggler hidden;
     * mobile  → vertical stack, collapse hidden unless expanded.
     */
    private function applyBreakpoint():Void {
        var w:Float = Screen.instance.actualWidth;
        var desktop:Bool = switch (expand) {
            case "always": true;
            case "never":  false;
            case "sm":  w >= 576;
            case "lg":  w >= 992;
            case "xl":  w >= 1200;
            case "xxl": w >= 1400;
            default:    w >= 768;   // md
        };

        if (_toggler != null) {
            _toggler.hidden = desktop;
        }

        // the bar itself stacks when collapsed
        this.layout = desktop ? new HorizontalLayout() : new VerticalLayout();

        if (_collapse != null) {
            _collapse.layout = desktop ? new HorizontalLayout() : new VerticalLayout();
            _collapse.hidden = desktop ? false : !_collapse.expanded;
        }

        syncComponentValidation();
    }
}