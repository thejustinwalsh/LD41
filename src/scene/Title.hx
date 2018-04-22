package scene;

class Title extends Scene
{
    var title:h2d.Text;
    var author:h2d.Text;

    var cAlpha:Float = 0.0;
    var cStart:Int = 0x29adff;
    var cEnd:Int = 0xff004d;

    override public function init()
    {
        hxd.Stage.getInstance().addEventTarget(onEvent);

        title = new h2d.Text(hxd.Res.fonts.blueman10.toFont(), this);
        title.text = "Ludum Dare 41";
        title.textAlign = Center;
        title.x = hxd.Stage.getInstance().width / 2;
        title.y = hxd.Stage.getInstance().height / 2 - 24;

        author = new h2d.Text(hxd.Res.fonts.tinyunicode12.toFont(), this);
        author.text = "justin walsh";
        author.textAlign = Center;
        author.x = hxd.Stage.getInstance().width / 2;
        author.y = title.y + 28;
    }

    function onEvent(event:hxd.Event)
    {
        var keys = [hxd.Key.SPACE, hxd.Key.LEFT, hxd.Key.RIGHT, hxd.Key.DOWN, hxd.Key.UP];
        if (event.kind == EKeyDown && keys.indexOf(event.keyCode) >= 0)
        {
            complete = true;
        }
    }

    override public function update(dt:Float)
    {
        cAlpha += 0.001 * dt;
        if (cAlpha >= 1.0) {
            cAlpha = 1.0 - cAlpha;
            var end = cStart;
            cStart = cEnd;
            cEnd = end;
        }

        var start = h3d.Vector.fromColor(cStart, 1.0);
        var end = h3d.Vector.fromColor(cEnd, 1.0);
        var color = new h3d.Vector(1.0, 1.0, 1.0, 1.0);
        color.lerp(start, end, cAlpha);
        author.textColor = color.toColor();
    }

    override public function shutdown()
    {
        hxd.Stage.getInstance().removeEventTarget(onEvent);
    }
}