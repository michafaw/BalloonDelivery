/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

MFLog("Entering Main Screen");


var playfieldX1 = 312;
var playfieldX2A = 56;
var playfieldX2B = 568;
var playfieldY = 50;

var playfields;
if (global.numPlayers == 1) {
	// One Player
	playfields[0] = instance_create_layer(playfieldX1, playfieldY, "PlayfieldBackground", objPlayfield);
	playfields[0].playerNum = 0;
	playfields[0].origin = [playfieldX1, playfieldY];
	
} else {
	// Two Player
	playfields[0] = instance_create_layer(playfieldX2A, playfieldY, "PlayfieldBackground", objPlayfield);
	playfields[0].playerNum = 0;
	playfields[0].origin = [playfieldX2A, playfieldY];
	
	playfields[1] = instance_create_layer(playfieldX2A, playfieldY, "PlayfieldBackground", objPlayfield);
	playfields[1].playerNum = 1;
	playfields[1].origin = [playfieldX2B, playfieldY];
}