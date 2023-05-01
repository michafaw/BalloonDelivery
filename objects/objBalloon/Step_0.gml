/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

if (!isMovingUp) {
	if (canBalloonMoveUp(self)) {
		isMovingUp = true;
		destinationPosition = [myPosition[0], myPosition[1]-1];
		// Set the new position as my own position so I can still be hit by fans
		myPosition = destinationPosition;
	}
}

if (isMovingUp) {
	var hasReachedDestinationHeight = false;
	var destinationOrigin = cellOriginXY(myPlayfield, destinationPosition);
	if (y <= destinationOrigin[1]) {
		hasReachedDestinationHeight = true;
	}
	
	if (hasReachedDestinationHeight) {
		myPosition = destinationPosition;
		destinationPosition = noone;
		isMovingUp = false;
		upwardSpeed = 0;
	} else {
		// Move it upward
		upwardSpeed -= 1;
		y += upwardSpeed;
	}
}

if (shouldTryToAdjustPositionBy != 0) {
	
	//isMovingSideways
	
}



// Re-align the balloon if we're not moving up or sideways
if (!isMovingUp && !isMovingSideways) {
	alignBalloonInCurrentPosition(self);	
}