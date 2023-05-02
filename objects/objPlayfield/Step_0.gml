/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

if (needsInitialSetup) {
	runInitialSetupForPlayfield(self);
	needsInitialSetup = false;
}


// Debug code, remove before release -- DEBUG Micha TODO 
if (keyboard_check_pressed(vk_space)) {
	createNewBalloonInPlayfieldAtCellXY(self, [2,3]);
}