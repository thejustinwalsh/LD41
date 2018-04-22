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
    var music:hxd.snd.Channel;
    var input:InputAction = InputNone;

    var hero:fauna.Hero;
    var enemies:Array<Fauna> = [];

    inline static var TILE_SIZE:Int = 32;
    inline static var MOVESPEED:Float = 8.0;

    override public function init()
    {
        hxd.Stage.getInstance().addEventTarget(onEvent);

        // Render our level
        level = new TileMap(hxd.Res.maps.level1, hxd.Res.tiles.darkSet, TILE_SIZE, 0, this);
        
        // Load collision
        var collision = hxd.Res.maps.level1.toMap();
        var collides = [1];

        // Create the hero character
        hero = new fauna.Hero(this);
        hero.x = 32; hero.y = 32;
        hero.collisionMap = collision;
        hero.collideWith = collides;
        hero.init();

        // Create some enemies
        var creepers = [{x: 23, y: 1}, {x: 23, y: 17}, {x: 12, y: 15}, {x: 1, y: 17}];
        for (creeperPos in creepers) {
            var creeper = new fauna.Creeper(this);
            creeper.collisionMap = collision;
            creeper.collideWith = collides;
            creeper.x = creeperPos.x * TILE_SIZE;
            creeper.y = creeperPos.y * TILE_SIZE;
            creeper.init();
            enemies.push(creeper);
        }

        // Cue the music
        music = hxd.Res.music.LD41Vibe.play(true, 10);
    }

    function onEvent(event:hxd.Event)
    {
        switch (event.kind) {
            case EKeyDown: {
                if (event.keyCode == hxd.Key.W || event.keyCode == hxd.Key.UP) input = InputUp;
                if (event.keyCode == hxd.Key.A || event.keyCode == hxd.Key.LEFT) input = InputLeft;
                if (event.keyCode == hxd.Key.S || event.keyCode == hxd.Key.DOWN) input = InputDown;
                if (event.keyCode == hxd.Key.D || event.keyCode == hxd.Key.RIGHT) input = InputRight;
                if (event.keyCode == hxd.Key.ESCAPE) complete = true;
            };

            case EKeyUp: {
                if ((event.keyCode == hxd.Key.W || event.keyCode == hxd.Key.UP) && input == InputUp) input = InputNone;
                if ((event.keyCode == hxd.Key.A || event.keyCode == hxd.Key.LEFT) && input == InputLeft) input = InputNone;
                if ((event.keyCode == hxd.Key.S || event.keyCode == hxd.Key.RIGHT) && input == InputDown) input = InputNone;
                if ((event.keyCode == hxd.Key.D || event.keyCode == hxd.Key.DOWN) && input == InputRight) input = InputNone;
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
        for (enemy in enemies) enemy.update(dt);
    }

    override public function shutdown()
    {
        hxd.Stage.getInstance().removeEventTarget(onEvent);

        hero.destroy();

        if (music != null) {
            music.fadeTo(0, 1.0, () -> {
                music.stop();
            });
        }
    }
}