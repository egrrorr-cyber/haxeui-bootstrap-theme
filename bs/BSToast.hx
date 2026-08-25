package bs;

import haxe.Timer;
import haxe.ui.components.Button;
import haxe.ui.components.Label;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;

/**
 * Bootstrap toast notification.
 *
 * A small auto-hiding message card. All toasts share a single screen-level
 * container (top-anchored, right-aligned via CSS), so calling `show()`
 * stacks them without any manual placement.
 *
 * Usage:
 * `var t = new BSToast();
 *  t.title = "Saved";
 *  t.text = "Changes stored.";
 *  t.show();`
 */
class BSToast extends VBox {
    /* Shared screen-level stack for all toasts */
    private static var _container:VBox = null;

    /* Header row: title + spacer + close button (hidden until a title is set) */
    private var _header:HBox;
    private var _titleLabel:Label;
    /* Body area for message content */
    private var _body:VBox;

    /** Optional bold header title; empty title hides the header row. */
    public var title(default, set):String = "";
    /** Dismiss automatically after `delay` ms. */
    public var autoHide:Bool = true;
    /** Auto-hide timeout in milliseconds. */
    public var delay:Int = 5000;

    public function new() {
        super();
        styleNames = "toast";
        width = 320;

        // header: title + stretch spacer + close button
        _header = new HBox();
        _header.styleNames = "toast-header";
        _titleLabel = new Label();
        _titleLabel.styleNames = "toast-title";
        _header.addComponent(_titleLabel);
        var spacer = new VBox();
        spacer.percentWidth = 100;
        _header.addComponent(spacer);
        var close = new Button();
        close.text = "×";
        close.styleNames = "btn-close";
        close.onClick = function(_) close_();
        _header.addComponent(close);
        super.addComponent(_header);
        _header.hidden = true;

        // body: message content
        _body = new VBox();
        _body.styleNames = "toast-body";
        super.addComponent(_body);
    }

    private function set_title(v:String):String {
        title = v;
        if (_titleLabel != null) {
            _titleLabel.text = v;
            _header.hidden = (v == null || v.length == 0);
        }
        return v;
    }

    /**
     * `text` acts as a convenience message setter:
     * each assignment appends a label row to the body.
     */
    private override function set_text(v:String):String {
        if (_body == null) return super.set_text(v);
        var l = new Label();
        l.text = v;
        _body.addComponent(l);
        return v;
    }

    /** Routes user-added children into the body. */
    public override function addComponent(child:Component):Component {
        if (_body == null) return super.addComponent(child);
        return _body.addComponent(child);
    }

    /** Mounts the toast into the shared container and starts auto-hide. */
    public override function show():Void {
        container().addComponent(this);
        if (autoHide && delay > 0) {
            Timer.delay(close_, delay);
        }
    }

    /** Dismisses the toast (destroys it). Safe to call twice. */
    public function close_():Void {
        if (parentComponent != null) {
            parentComponent.removeComponent(this, true);
        }
    }

    /* Lazily creates the shared screen-level toast stack */
    private static function container():VBox {
        if (_container == null) {
            _container = new VBox();
            _container.styleNames = "toast-container";
            _container.percentWidth = 100;
            _container.verticalAlign = "top";
            Screen.instance.addComponent(_container);
        }
        return _container;
    }
}