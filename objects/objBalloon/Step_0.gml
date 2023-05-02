/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;


if (keyboard_check_pressed(vk_right)) {
	shouldTryToAdjustPositionBy++;	
} else if (keyboard_check_pressed(vk_left)) {
	shouldTryToAdjustPositionBy--;	
}


if (!isMovingLeft && !isMovingRight) {
	if (shouldTryToAdjustPositionBy > 0) {
		isMovingRight = true;
		destinationPosition = [myPosition[0]+shouldTryToAdjustPositionBy, myPosition[1]];
		// Set the new position as my own position so I can still be hit by fans/lift
		myPosition = destinationPosition;
		
		shouldTryToAdjustPositionBy += -1; // Go one step closer to 0
		
	} else if (shouldTryToAdjustPositionBy < 0) {
		isMovingLeft = true;
		destinationPosition = [myPosition[0]+shouldTryToAdjustPositionBy, myPosition[1]];
		// Set the new position as my own position so I can still be hit by fans/lift
		myPosition = destinationPosition;
		
		shouldTryToAdjustPositionBy += 1; // Go one step closer to 0
	}
}


if (isMovingRight) {
	if (destinationPosition == noone) {
		// We've halted movement somewhere else so bail out here
		isMovingRight = false;
	} else {
		var hasReachedDestinationColumn = false;
		var destinationOrigin = cellOriginXY(myPlayfield, destinationPosition);
		if (x >= destinationOrigin[0]) {
			hasReachedDestinationColumn = true;
		}
	
	
		if (hasReachedDestinationColumn) {
			myPosition = destinationPosition;
			destinationPosition = noone;
			isMovingRight = false;
		} else {
			// Move it right
			x += sidewaysBaseSpeed;
		}
	}
}

if (isMovingLeft) {
	if (destinationPosition == noone) {
		// We've halted movement somewhere else so bail out here
		isMovingLeft = false;
	} else {
		var destinationOrigin = cellOriginXY(myPlayfield, destinationPosition);
		if (x <= destinationOrigin[0]) {
			hasReachedDestinationColumn = true;
		}
	
	
		if (hasReachedDestinationColumn) {
			myPosition = destinationPosition;
			destinationPosition = noone;
			isMovingLeft = false;
		} else {
			// Move it left
			x += -sidewaysBaseSpeed;
		}
	}
}

// Upward Movement (Lift)
var liftEnabled = true; // Balloon lift is disabled here -- Micha TODO
if (!isMovingUp && liftEnabled) {
	if (canBalloonMoveUp(self)) {
		isMovingUp = true;
		destinationPosition = [myPosition[0], myPosition[1]-1];
		// Set the new position as my own position so I can still be hit by fans/lift
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
		// Doublecheck there isn't a balloon in that spot already somehow
		//if (!canBalloonMoveUp(self)) {
			
		//}
		
		// Move it upward
		upwardSpeed -= 1;
		y += upwardSpeed;
	}
}


// Re-align the balloon if we're not moving up or sideways
if (!isMovingUp && !isMovingLeft && !isMovingRight) {
	alignBalloonInCurrentPosition(self);	
}