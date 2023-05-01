/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;


if (isMovingUp) {
	draw_self();
	bounceFrame = 0;
} else {

	
	var index = floor(bounceFrame);
	//MFLog("bounceFrame = " + string(bounceFrame) + ", index = " + string(index));
	var offsetXY = [0, bounceOffsetsY[index]];

	draw_sprite(sprite_index, image_index, x + offsetXY[0], y + offsetXY[1]);

	bounceFrame += bounceFrameSpeed;
	if (bounceFrame >= bounceFrameCount) {
		bounceFrame -= bounceFrameCount;
		if (bounceFrame <= 0) {
			bounceFrame = 0.0;	
		}
	}

}
