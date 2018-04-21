class LD41 extends hxd.App
{
    var scenes:Array<Scene> = [];

    override function init()
    {
        // Debug
        var debugInfo = new DebugInfo(16, s2d);
        debugInfo.x = hxd.Stage.getInstance().width - 80;

        // Init Scene Stack
        scenes = [new scene.GameOver(), new scene.Game(), new scene.Title()];

        var scene = scenes[scenes.length - 1];
        s2d.addChild(scene);
        scene.init();
    }

    function reset()
    {
        while (scenes.length > 0) {
            var scene = scenes[scenes.length - 1];
            scene.shutdown();
            s2d.removeChild(scene);
            scenes.remove(scene);
        }

        scenes = [new scene.GameOver(), new scene.Game()];

        var scene = scenes[scenes.length - 1];
        s2d.addChild(scene);
        scene.init();
    }

    override function update(dt:Float)
    {
        // Update loop
        if (scenes.length > 0) {
            var scene = scenes[scenes.length - 1];
            scene.update(dt);

            if (scene.complete) {
                scene.shutdown();
                s2d.removeChild(scene);
                scenes.remove(scene);

                if (scenes.length > 0) {
                    var newScene = scenes[scenes.length - 1];
                    s2d.addChild(newScene);
                    newScene.init();
                }
                else {
                    reset();
                }
            }
        }
    }

    static function main()
    {
        hxd.Res.initEmbed();
        new LD41();
    }
}