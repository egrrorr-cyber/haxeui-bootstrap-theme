package bs;

import haxe.ui.components.Button;
import haxe.ui.containers.Box;
import haxe.ui.containers.HBox;
import haxe.ui.core.Component;
import haxe.ui.events.MouseEvent;

/**
 * Bootstrap-style carousel (slideshow).
 *
 * Children added in XML become slides; exactly one slide is visible at a
 * time. Navigation is provided by `‹` / `›` side controls and clickable
 * indicator dots at the bottom. Slide switching wraps around cyclically.
 *
 * Usage:
 * `<bscarousel>
 *     <vbox styleNames="bg-primary">...</vbox>
 *     <vbox styleNames="bg-success">...</vbox>
 * </bscarousel>`
 */
class BSCarousel extends Box {
    /* Full-size overlay container holding the slides (stacked, one visible) */
    private var _slideBox:Box;
    /* Bottom row of indicator dots */
    private var _indicators:HBox;
    /* Registered slides, in declaration order */
    private var _slides:Array<Component> = [];
    /* One dot per slide, same order as _slides */
    private var _dots:Array<Box> = [];
    /* Currently visible slide */
    private var _index:Int = 0;

    public function new() {
        super();
        styleNames = "carousel";
        percentWidth = 100;
        height = 240;
        clip = true;

        // slides layer: children stack on top of each other, visibility toggled
        _slideBox = new Box();
        _slideBox.percentWidth = 100;
        _slideBox.percentHeight = 100;
        super.addComponent(_slideBox);

        // side navigation controls (overlay the slide layer)
        var prev = new Button();
        prev.text = "‹";
        prev.styleNames = "carousel-control prev";
        prev.percentHeight = 100;
        prev.onClick = function(_) showSlide(_index - 1);
        super.addComponent(prev);

        var next = new Button();
        next.text = "›";
        next.styleNames = "carousel-control next";
        next.percentHeight = 100;
        next.onClick = function(_) showSlide(_index + 1);
        super.addComponent(next);

        // indicator dots are populated in onReady(), once slides are known
        _indicators = new HBox();
        _indicators.styleNames = "carousel-indicators";
        super.addComponent(_indicators);
    }

    /**
     * Adds a slide. Slides are stretched to fill the carousel and routed
     * into the internal slide layer instead of the component tree.
     */
    public override function addComponent(child:Component):Component {
        if (_slideBox == null) return super.addComponent(child);
        child.percentWidth = 100;
        child.percentHeight = 100;
        return _slideBox.addComponent(child);
    }

    /* Collect slides and build one clickable dot per slide */
    private override function onReady() {
        super.onReady();
        for (i in 0..._slideBox.numComponents) {
            _slides.push(_slideBox.getComponentAt(i));
        }
        for (i in 0..._slides.length) {
            var dot = new Box();
            dot.styleNames = "carousel-dot";
            var idx = i;
            // dots are plain boxes: need pointer-events + MOUSE_DOWN (see CSS)
            dot.registerEvent(MouseEvent.MOUSE_DOWN, function(_) showSlide(idx));
            _indicators.addComponent(dot);
            _dots.push(dot);
        }
        showSlide(0);
    }

    /**
     * Shows slide `i` with cyclic wrap-around (negative and
     * out-of-range indices wrap modulo slide count).
     */
    public function showSlide(i:Int):Void {
        var n = _slides.length;
        if (n == 0) return;
        _index = (i % n + n) % n;
        for (s in 0...n) {
            _slides[s].hidden = (s != _index);
        }
        for (d in 0..._dots.length) {
            if (d == _index) _dots[d].addClass("active");
            else _dots[d].removeClass("active");
        }
    }
}