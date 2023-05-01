/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

//MFLog("Creating new balloon");

points = 1;

bounceFrame = 0.0;
bounceFrameSpeed = 6.0/room_speed; // FPS
bounceOffsetsY = [0, -1, -1, 0, 1, 1];
bounceFrameCount = array_length(bounceOffsetsY);


myPlayfield = 0;
isMovingUp = false;
isMovingSideways = false;
shouldTryToAdjustPositionBy = 0; // -1 or +1 for left/right
destinationPosition = noone;
upwardSpeed = 0;
myPosition = [0,0]; // Overridden during creation, changes when balloon is halfway into a new cell