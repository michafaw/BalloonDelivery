/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

MFLog("Creating new balloon");

myPlayfield = 0;
points = 1;

isMovingUp = false;
bounceFrame = 0.0;
bounceFrameSpeed = 6.0/room_speed; // FPS
bounceOffsetsY = [0, -1, -1, 0, 1, 1];
bounceFrameCount = array_length(bounceOffsetsY);

