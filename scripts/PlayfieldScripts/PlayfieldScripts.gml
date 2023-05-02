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
	// Defined layouts
	//var initialBalloonLayout = [[0,0], [1,0], [2,0], [1,1], [2,1], [4,1], [1,3], [4,2], [4,3], [3,3]];
	//var initialBalloonLayout = [[2,1], [1,2], [2,2], [3,2], [0,3], [1,3], [2,3], [3,3], [4,3], ]; // Pyramid
	var initialBalloonLayout = [[2,2],[2,3],];
	//var initialBalloonLayout = [[2,3],[3,3],];
	
	
	for (var i = 0; i < array_length(initialBalloonLayout); i++) {
		var balloon = createNewBalloonInPlayfieldAtCellXY(playfieldInst, initialBalloonLayout[i]);
		// Give balloons a slight wave
		balloon.bounceFrame = balloon.myPosition[1];
		if (balloon.bounceFrame >= array_length(balloon.bounceOffsetsY)) {
			balloon.bounceFrame = 0;
		}
		
	}
}

function createNewBalloonInPlayfieldAtCellXY(playfieldInst, cellXY) {
	if (live_call(argument0, argument1)) return live_result;
	
	var originXY = cellOriginXY(playfieldInst, cellXY);
	var balloon = instance_create_layer(originXY[0], originXY[1], "Playfield", objBalloon);
	balloon.myPlayfield = playfieldInst;
	balloon.myPosition = cellXY;
	alignBalloonInCurrentPosition(balloon);
	
	return balloon;	
}

function canBalloonMoveUp(balloonInst) {
	if (live_call(argument0)) return live_result;
	
	// Balloons already moving up are exempt
	if (balloonInst.isMovingUp)
		return false;
		
	// Already at the top
	if (balloonInst.myPosition[1] == 0)
		return false;
		
	// Find a balloon in the cell above, above+left, above+right
	with (objBalloon) {
		if (myPlayfield == other.myPlayfield && self != other) {
			if (myPosition[0] == other.myPosition[0] && myPosition[1] == other.myPosition[1]-1) {
				// This is the balloon above us
				if (!isMovingUp) {
					// It's not moving up, so we're stuck here
					return false;
				}
			} else if (myPosition[0] == other.myPosition[0]-1 && myPosition[1] == other.myPosition[1]-1) {
				// This is the balloon above us and to the left
				if (isMovingRight && !isMovingUp) {
					// It's moving into the spot above us and not moving up, so we're stuck here
					return false;
				}
			} else if (myPosition[0] == other.myPosition[0]+1 && myPosition[1] == other.myPosition[1]-1) {
				// This is the balloon above us and to the right
				if (isMovingLeft && !isMovingUp) {
					// It's moving into the spot above us and not moving up, so we're stuck here
					return false;
				}
			}
		}
	}
	
	// No balloon was found in the space above us, so we're free to move
	return true;
}

function canBalloonMoveRight(balloonInst) {
	if (live_call(argument0)) return live_result;
	
	// Balloons already moving up are exempt
	if (balloonInst.isMovingUp)
		return false;
		
	// Already at the top
	if (balloonInst.myPosition[1] == 0)
		return false;
		
	// Find a balloon in the cell above
	with (objBalloon) {
		if (myPlayfield == other.myPlayfield) {
			if (myPosition[0] == other.myPosition[0] && myPosition[1] == other.myPosition[1]-1) {
				// This is the balloon right above us
				if (isMovingUp) {
					// It's moving up, so we can take its spot
					return true;
				} else {
					// It's not moving up, so we're stuck here
					return false;
				}
			}
		}
	}
	
	// No balloon was found in the space above us, so we're free to move
	return true;
}

function alignBalloonInCurrentPosition(balloonInst) {
	if (live_call(argument0)) return live_result;
	
	var originXY = cellOriginXY(balloonInst.myPlayfield, balloonInst.myPosition);
	balloonInst.x = originXY[0];
	balloonInst.y = originXY[1];
}
	