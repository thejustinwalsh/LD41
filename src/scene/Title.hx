package scene;

class Title extends Scene
{
    override public function init()
    {
        hxd.Stage.getInstance().addEventTarget(onEvent);

        var title = new h2d.Text(hxd.Res.fonts.blueman10.toFont(), this);
        title.text = "Ludum Dare 41";
        title.textAlign = Center;
        title.x = hxd.Stage.getInstance().width / 2;
        title.y = hxd.Stage.getInstance().height / 2 - 24;
    }

    function onEvent(event:hxd.Event)
    {
        if (event.kind == EKeyUp || event.kind == ERelease)
        {
            complete = true;
        }
    }

    override public function shutdown()
    {
        hxd.Stage.getInstance().removeEventTarget(onEvent);
    }
}