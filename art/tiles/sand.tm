Tilemancer 0.2.1

Color 0 0 0
PaletteSave1 
PaletteSave2 
FileSave1 /Users/justinwalsh/Projects/Haxe/LD41/art/tiles
FileSave2 sand.tm
Indexed 0
Size 32
Camera -605.143 -136.277
Node {
Name cells.lua
Position 223 139.5
Parameter -396 -1 -1 0
Parameter 3 2 -1 0
Parameter 30 0 100 0
Parameter 40 0 -1 0
}
Node {
Name invert.lua
Position 363 166.5
Connection 0 0 0
}
Node {
Name directional_blur.lua
Position 463 148.5
Parameter 202 -1 -1 0
Parameter 30 0 100 0
Connection 0 1 0
}
Node {
Name blur.lua
Position 623 157.5
Parameter 40 0 100 0
Connection 0 2 0
}
Node {
Name perlin_noise.lua
Position 613 309.5
Parameter -730 -1 -1 0
Parameter 2 2 -1 0
Parameter 8 1 -1 0
Parameter 200 100 -1 0
Parameter 100 0 100 0
Parameter 8 0 -1 0
}
Node {
Name blend.lua
Position 774.009 213.501
Parameter 0 0 5 0
Parameter 100 0 100 0
Connection 0 3 0
Connection 1 4 0
}
Node {
Name lighting.lua
Position 913.25 199.95
Parameter -22 -1 -1 0
Parameter 10 0 100 0
Connection 0 5 0
}
Node {
Name colorizer.lua
Position 1032.31 428.431
Ramp {
Point 0 0 0 1
}
Parameter 0 0 0 0
Parameter 0 0 0 0
Parameter 0 0 1 0
}
Node {
Name blend.lua
Position 1194.1 224.36
Parameter 0 0 5 0
Parameter 100 0 100 0
Connection 0 6 0
Connection 1 7 0
}
