/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

showDebugMessages = !showDebugMessages;
var onOffString = showDebugMessages ? "ON" : "OFF";
MFLog("Turning debug mode " + onOffString + " for balloon " + string(self.id));

// Create falling present where box was before
// Micha TODO


//instance_destroy();