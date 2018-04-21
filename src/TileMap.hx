import h2d.Sprite;
import h2d.Tile;
import h2d.TileGroup;
import hxd.res.TiledMap;
import hxd.res.Image;

class TileMap extends Sprite
{
    var content:TileGroup;

    public function new(map:TiledMap, tileSetImage:Image, tileSize:Int, tileLayer:Int, ?parent:Sprite)
    {
        super(parent);

        // Convert the image to a Tile
        var tileSet:Tile = tileSetImage.toTile();

        // Create a new TileGroup to hold our map tiles
        content = new TileGroup(tileSet, this);

        // Get the map data and generate the tile set lookup array
        var mapData = map.toMap();
        var tileSetArray = tileSet.gridFlatten(tileSize, 0, 0);
        if (mapData.layers.length > 0)
        {
            var tileX = 0;
            var tileY = 0;
            for (tileId in mapData.layers[tileLayer].data)
            {
                if (tileId != 0) content.add(tileX, tileY, tileSetArray[tileId - 1]);
                tileX += tileSize;
                if (tileX >= mapData.width * tileSize)
                {
                    tileX = 0; 
                    tileY += tileSize;
                }
            }
        }

        addChild(content);
    }
}