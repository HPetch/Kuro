///@description Check if position is below floor height of a given tile, and return how deep in the floor

///@arg tilemap
///@arg x
///@arg y

//If it's 0 or more we're in the floor

var pos = tilemap_get_at_pixel(argument0,argument1,argument2); //Return the index

if (pos > 0) { //If it's not an empty sprite
	//Solid tile!
	if (pos == 1) return (argument2 mod TILE_SIZE); //Return how deep into the floor we are?
	var thefloor = global.heights[(argument1 mod TILE_SIZE) + (pos * TILE_SIZE)] //Get column we are looking for (pos * TILE_SIZE is the tile, x mod TILE_SIZE is the pixel column)
	return ((argument2 mod TILE_SIZE) - thefloor); //returns negative number if we are above the floor, positive if we are under it, 0 if we are on it pixel perfect
} else return -(TILE_SIZE - (argument2 mod TILE_SIZE));