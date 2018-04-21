class LD41 extends hxd.App
{
    var background:TileMap;
    var foreground:TileMap;
    
    override function init()
    {
        background = new TileMap(hxd.Res.maps.level1, hxd.Res.tiles.darkSet, 32, 0, s2d);

        // Debug
        var debugInfo = new DebugInfo(16, s2d);
        debugInfo.x = hxd.Stage.getInstance().width - 80;
    }

    override function update(dt:Float)
    {

    }

    static function main()
    {
        hxd.Res.initEmbed();
        new LD41();
    }
}