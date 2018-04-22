package scene;

enum InputAction {
    InputUp;
    InputLeft;
    InputDown;
    InputRight;
    InputNone;
}

class Game extends Scene
{
    var level:TileMap;
    var hero:fauna.Hero;

    var input:InputAction = InputNone;

    inline static var MOVESPEED:Float = 8.0;

    override public function init()
    {
        hxd.Stage.getInstance().addEventTarget(onEvent);

        // Render our level
        level = new TileMap(hxd.Res.maps.level1, hxd.Res.tiles.darkSet, 32, 0, this);

        // Create the hero character
        hero = new fauna.Hero(this);
        hero.x = 32; hero.y = 32;
        hero.collisionMap = hxd.Res.maps.level1.toMap();
        hero.collideWith = [1];
        hero.init();
    }

    function onEvent(event:hxd.Event)
    {
        switch (event.kind) {
            case EKeyDown: {
                if (event.keyCode == hxd.Key.W) input = InputUp;
                if (event.keyCode == hxd.Key.A) input = InputLeft;
                if (event.keyCode == hxd.Key.S) input = InputDown;
                if (event.keyCode == hxd.Key.D) input = InputRight;
                if (event.keyCode == hxd.Key.ESCAPE) complete = true;
            };

            case EKeyUp: {
                if (event.keyCode == hxd.Key.W && input == InputUp) input = InputNone;
                if (event.keyCode == hxd.Key.A && input == InputLeft) input = InputNone;
                if (event.keyCode == hxd.Key.S && input == InputDown) input = InputNone;
                if (event.keyCode == hxd.Key.D && input == InputRight) input = InputNone;
            };

            default:
        }

        // Update the hero travel direction
        switch (input) {
            case InputUp: hero.travel(Up);
            case InputLeft: hero.travel(Left);
            case InputDown: hero.travel(Down);
            case InputRight: hero.travel(Right);
            case InputNone:
        }
    }

    override public function update(dt:Float)
    {
        hero.update(dt);
    }

    override public function shutdown()
    {
        hxd.Stage.getInstance().removeEventTarget(onEvent);

        hero.destroy();
    }
}