package bs;

import haxe.ui.components.Label;
import haxe.ui.containers.Box;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.events.MouseEvent;

/**
 * Bootstrap offcanvas panel.
 *
 * A slide-in side panel over a dimmed backdrop, mounted at screen level
 * (like a native dialog). Clicking the backdrop or the close button
 * dismisses it. Children added in XML are routed into the panel body.
 *
 * Usage:
 * `<bsoffcanvas id="menu" title="Menu">
 *     <label text="Panel content" />
 * </bsoffcanvas>
 * <bsbutton text="Open" onClick="menu.open()" />`
 */
class BSOffcanvas extends Box {
    /* Full-screen dimmed backdrop; click closes the panel */
    private var _overlay:Box;
    /* Right-anchored panel body */
    private var _panel:VBox;
    /* Header title label */
    private var _titleLabel:Label;

    /** Panel header title. */
    public var title(default, set):String = "";

    public function new() {
        super();
        percentWidth = 100;
        percentHeight = 100;

        // backdrop layer: covers the screen, closes on click
        _overlay = new Box();
        _overlay.styleNames = "offcanvas-backdrop";
        _overlay.percentWidth = 100;
        _overlay.percentHeight = 100;
        _overlay.registerEvent(MouseEvent.MOUSE_DOWN, function(_) close_());
        super.addComponent(_overlay);

        // panel layer: fixed-width column anchored right (see CSS)
        _panel = new VBox();
        _panel.styleNames = "offcanvas-panel";
        _panel.percentHeight = 100;
        super.addComponent(_panel);

        // header: title + stretch spacer + close button
        var header = new HBox();
        header.styleNames = "offcanvas-header";
        _titleLabel = new Label();
        _titleLabel.styleNames = "h5";
        header.addComponent(_titleLabel);
        var spacer = new Box();
        spacer.percentWidth = 100;
        header.addComponent(spacer);
        var close = new BSCloseButton();
        close.onClick = function(_) close_();
        header.addComponent(close);
        addComponentToPanel(header);
    }

    private function set_title(v:String):String {
        title = v;
        if (_titleLabel != null) _titleLabel.text = v;
        return v;
    }

    /** Shows the offcanvas by mounting it at screen level. */
    public function open():Void {
        Screen.instance.addComponent(this);
    }

    /** Dismisses the offcanvas (destroyed, like native dialogs). */
    public function close_():Void {
        Screen.instance.removeComponent(this, true);
    }

    /**
     * Routes user-added children into the panel body
     * (internal chrome is added via super/addComponentToPanel).
     */
    public override function addComponent(child:Component):Component {
        if (_panel == null) return super.addComponent(child);
        return _panel.addComponent(child);
    }

    /* Internal helper: add chrome (header) directly to the panel */
    private function addComponentToPanel(child:Component):Component {
        return _panel.addComponent(child);
    }
}