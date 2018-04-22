package fauna;

import hxd.res.TiledMap;

enum HeroMoveDirection {
    Up;
    Left;
    Down;
    Right;
    Stop;
}

class Hero extends Fauna
{
    static inline var TILE_SIZE:Int = 32;
    inline static var MOVESPEED:Float = 8.0;

    public var collisionMap:TiledMapData;
    public var collideWith:Array<Int> = [];

    var travelDir:HeroMoveDirection = Stop;

    var hitEffects:Array<hxd.res.Sound> = [];

    override public function init()
    {
        // Create placeholder hero art
        new h2d.Bitmap(h2d.Tile.fromColor(0xff004d, TILE_SIZE, TILE_SIZE), this);

        // Load Audio
        hitEffects = [hxd.Res.sfx.Hit_Hurt3, hxd.Res.sfx.Hit_Hurt4, hxd.Res.sfx.Hit_Hurt5, hxd.Res.sfx.Hit_Hurt6, hxd.Res.sfx.Hit_Hurt7];
    }

    override public function update(dt:Float)
    {
        switch (travelDir) {
            case Up: {
                var targetX = x;
                var targetY = Math.floor(y - MOVESPEED);
                if (check(targetX, targetY, 0, collideWith)) {
                    this.y = targetY;
                }
                else {
                    this.y = (Math.floor(targetY / TILE_SIZE) * TILE_SIZE) + TILE_SIZE;
                    hitEffects[Math.floor(Math.random() * hitEffects.length)].play();
                    travelDir = Stop;
                }
            };

            case Left: {
                var targetX = Math.floor(x - MOVESPEED);
                var targetY = y;
                if (check(targetX, targetY, 0, collideWith)) {
                    this.x = targetX; 
                }
                else {
                    this.x = (Math.floor(targetX / TILE_SIZE) * TILE_SIZE) + TILE_SIZE;
                    hitEffects[Math.floor(Math.random() * hitEffects.length)].play();
                    travelDir = Stop;
                }
            };

            case Down: {
                var targetX = x;
                var targetY = Math.floor(y + MOVESPEED);
                if (check(targetX, targetY + TILE_SIZE, 0, collideWith)) {
                    this.y = targetY; 
                }
                else {
                    this.y = (Math.floor((targetY + TILE_SIZE) / TILE_SIZE) * TILE_SIZE) - TILE_SIZE;
                    hitEffects[Math.floor(Math.random() * hitEffects.length)].play();
                    travelDir = Stop;
                }
            };

            case Right: {
                var targetX = Math.floor(x + MOVESPEED);
                var targetY = y;
                if (check(targetX + TILE_SIZE, targetY, 0, collideWith)) {
                    this.x = targetX;
                }
                else {
                    this.x = (Math.floor((targetX + TILE_SIZE) / TILE_SIZE) * TILE_SIZE) - TILE_SIZE;
                    hitEffects[Math.floor(Math.random() * hitEffects.length)].play();
                    travelDir = Stop;
                }
            };

            default:
        }
    }

    override public function destroy()
    {

    }

    public function travel(dir:HeroMoveDirection)
    {
        if (travelDir == Stop) travelDir = dir;
    }

    public function check(x:Float, y:Float, layer:Int, collide:Array<Int>):Bool
    {
        if (collisionMap != null && layer >= 0 && layer < collisionMap.layers.length) {
            var data = collisionMap.layers[layer].data;

            var row = Math.floor(x / TILE_SIZE);
            var col = Math.floor(y / TILE_SIZE);
            var index = (col * collisionMap.width) + row;

            if (index >= 0 && index < data.length) {
                var tile = collisionMap.layers[layer].data[index];
                return !(collide.indexOf(tile) >= 0);
            }
        }

        return true;
    }
}