// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// if (live_call()) return live_result;
// if (live_call(argument0)) return live_result; // For 1 arg scripts
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts

/// Returns the top left corner of the cell
function cellOriginXY(playfieldInst, cellXY) {
	if (live_call(argument0, argument1)) return live_result;
	
	var xx = playfieldInst.origin[0] + cellXY[0]*playfieldInst.cellSize[0];
	var yy = playfieldInst.origin[1] + cellXY[1]*playfieldInst.cellSize[1];	
	
	return [xx, yy];
}

function isCellEmpty(playfieldInst) {
	if (live_call(argument0)) return live_result;
	
	// Update logic -- Micha TODO
	return true;
}

function runInitialSetupForPlayfield(playfieldInst) {
	if (live_call(argument0)) return live_result;
	
	// Left Fans
	var originX = playfieldInst.origin[0] - playfieldInst.fanOffset[0];
	for (var i = 0; i < playfieldInst.numRows; i++) {
		var originY = playfieldInst.origin[1] + cellSize[1]*i + playfieldInst.fanOffset[1];
		var fan = instance_create_layer(originX, originY, "Playfield", objFan);
		fan.myPlayfield = playfieldInst;
		fan.myDirection = "right";
	}
	// Right Fans
	originX = playfieldInst.origin[0] + playfieldInst.numColumns*playfieldInst.cellSize[0] + playfieldInst.fanOffset[0];
	for (var i = 0; i < playfieldInst.numRows; i++) {
		var originY = playfieldInst.origin[1] + cellSize[1]*i + playfieldInst.fanOffset[1];
		var fan = instance_create_layer(originX, originY, "Playfield", objFan);
		fan.myPlayfield = playfieldInst;
		fan.myDirection = "left";
	}
	
	
	// Balloons
	var initialBalloonLayout = [[0,0], [1,0], [2,0], [4,0], [1,1], [2,1], [4,1], [1,2] ];
	for (var i = 0; i < array_length(initialBalloonLayout); i++) {
		var originXY = cellOriginXY(playfieldInst, initialBalloonLayout[i]);
		var balloon = instance_create_layer(originXY[0], originXY[1], "Playfield", objBalloon);
		balloon.myPlayfield = playfieldInst;
	}
}