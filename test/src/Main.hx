package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.ComponentBuilder;
class Main {
    public static function main() {
        
        var app = new HaxeUIApp();
        app.ready(function() {
            Toolkit.init();
            Toolkit.theme = "dark";
            var mainView = ComponentBuilder.fromFile("assets/pricing-view.xml");
            app.addComponent(mainView);

            app.start();
        });
    }
}
