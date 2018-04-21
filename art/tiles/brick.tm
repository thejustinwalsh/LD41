Tilemancer 0.2.1

Color 178 178 178
PaletteSave1 
PaletteSave2 
FileSave1 /Users/justinwalsh/Projects/Haxe/LD41/art/tiles
FileSave2 brick.tm
Indexed 0
Size 32
Camera -366.531 -17.0079
Node {
Name bricks.lua
Position 333 85.5
Parameter 856 -1 -1 0
Parameter 1 1 -1 0
Parameter 1 1 -1 0
Parameter 1 1 -1 0
Parameter 43 0 100 0
Parameter 100 0 -1 0
}
Node {
Name perlin_noise.lua
Position 183 309.5
Parameter -889 -1 -1 0
Parameter 6 2 -1 0
Parameter 4 1 -1 0
Parameter 200 100 -1 0
Parameter 80 0 100 0
Parameter 100 0 -1 0
}
Node {
Name perlin_noise.lua
Position 323 309.5
Parameter -201 -1 -1 0
Parameter 4 2 -1 0
Parameter 3 1 -1 0
Parameter 200 100 -1 0
Parameter 80 0 100 0
Parameter 6 0 -1 0
}
Node {
Name directional_blur.lua
Position 463 224.5
Parameter 0 -1 -1 0
Parameter 10 0 100 0
Connection 0 0 0
Connection 1 1 0
Connection 2 2 0
}
Node {
Name blend.lua
Position 623 215.5
Parameter 4 0 5 0
Parameter 100 0 100 0
Connection 0 0 0
Connection 1 3 0
}
Node {
Name lighting.lua
Position 784.231 186.411
Parameter 115 -1 -1 0
Parameter 38 0 100 0
Connection 0 4 0
}
Node {
Name colorizer.lua
Position 777.916 -6.48004
Ramp {
Point 67 42.8789 0 1
Point 83.5 0 0 1
}
Parameter 0 0 0 0
Parameter 0 0 0 0
Parameter 0 0 1 0
}
Node {
Name blend.lua
Position 1033.79 198.52
Parameter 2 0 5 0
Parameter 100 0 100 0
Connection 0 5 0
Connection 1 6 0
}
