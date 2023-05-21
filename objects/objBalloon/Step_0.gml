/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;


if (keyboard_check_pressed(vk_right)) {
	if (canBalloonMoveRight(self)) {
		shouldTryToAdjustPositionBy++;
	}
} else if (keyboard_check_pressed(vk_left)) {
	if (canBalloonMoveLeft(self)) {
		shouldTryToAdjustPositionBy--;
	}
}

// Totally Debug Code for teleporting a balloon down one row, not setup for live use
//if (keyboard_check_pressed(vk_down) && showDebugMessages) {
//	if(showDebugMessages) MFLog(string(self.id) + "isMovingDown"); // DEBUG Micha TODO	
	
//	// Teleport the balloon to the new location instantly
//	var balloonInst = self;
//	destinationPosition = [myPosition[0], myPosition[1]+1];
//	myPosition = destinationPosition;
//	var originXY = cellOriginXY(balloonInst.myPlayfield, balloonInst.myPosition);
//	balloonInst.y = originXY[1];
//}


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
	if(showDebugMessages) MFLog(string(self.id) + "isMovingRight"); // DEBUG Micha TODO
	 
	if (destinationPosition == noone) {
		// We've halted movement somewhere else so bail out here
		isMovingRight = false;
		MFLog("Unexpected: destinationPosition is empty in isMovingRight check"); // DEBUG Micha TODO}
	} else {
		var hasReachedDestinationColumn = false;
		var destinationOrigin = cellOriginXY(myPlayfield, destinationPosition);
		if (x >= destinationOrigin[0]) {
			hasReachedDestinationColumn = true;
		}
	
	
		if (hasReachedDestinationColumn) {
			if(showDebugMessages) MFLog("isMovingRight - hasReachedDestinationColumn"); // DEBUG Micha TODO
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
	if(showDebugMessages) MFLog(string(self.id) + "isMovingLeft"); // DEBUG Micha TODO
	
	if (destinationPosition == noone) {
		// We've halted movement somewhere else so bail out here
		isMovingLeft = false;
		MFLog("Unexpected: destinationPosition is empty in isMovingLeft check"); // DEBUG Micha TODO
	} else {
		var hasReachedDestinationColumn = false;
		var destinationOrigin = cellOriginXY(myPlayfield, destinationPosition);
		if (x <= destinationOrigin[0]) {
			hasReachedDestinationColumn = true;
		}
	
	
		if (hasReachedDestinationColumn) {
			if(showDebugMessages) MFLog("isMovingLeft - hasReachedDestinationColumn"); // DEBUG Micha TODO
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
		if(showDebugMessages) MFLog("canBalloonMoveUp: true"); // DEBUG Micha TODO
		isMovingUp = true;
		destinationPosition = [myPosition[0], myPosition[1]-1];
		// Set the new position as my own position so I can still be hit by fans/lift
		myPosition = destinationPosition;
	}
}

if (isMovingUp) {
	if(showDebugMessages) MFLog(string(self.id) + "isMovingUp"); // DEBUG Micha TODO
	
	if (destinationPosition == noone) {
		// We've halted movement somewhere else so bail out here
		isMovingUp = false;
		MFLog("Unexpected: destinationPosition is empty in isMovingUp check"); // DEBUG Micha TODO
	} else {
		var hasReachedDestinationHeight = false;
		var destinationOrigin = cellOriginXY(myPlayfield, destinationPosition);
		if (y <= destinationOrigin[1]) {
			hasReachedDestinationHeight = true;
		}
	
		if (hasReachedDestinationHeight) {
			if(showDebugMessages) MFLog("isMovingUp - hasReachedDestinationHeight"); // DEBUG Micha TODO
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
}


// Re-align the balloon if we're not moving up or sideways
if (!isMovingUp && !isMovingLeft && !isMovingRight) {
	alignBalloonInCurrentPosition(self);	
}