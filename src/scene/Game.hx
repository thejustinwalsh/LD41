package scene;

class Game extends Scene
{
    var background:TileMap;
    var foreground:TileMap;

    override public function init()
    {
        hxd.Stage.getInstance().addEventTarget(onEvent);

        // Render our level
        background = new TileMap(hxd.Res.maps.level1, hxd.Res.tiles.darkSet, 32, 0, this);
    }

    function onEvent(event:hxd.Event)
    {
        if (event.kind == EKeyUp || event.kind == ERelease)
        {
            complete = true;
        }
    }

    override public function update(dt:Float)
    {

    }

    override public function shutdown()
    {
        hxd.Stage.getInstance().removeEventTarget(onEvent);
    }
}