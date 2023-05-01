/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;


playerNum = 0;


// Positioning Attributes
origin = [10, 10]; // This should be overridden on creation
numColumns = 5;
numRows = 4;

cellSize = [70, 100];
numInitialBalloons = 8;
fanWidth = 50;
fanOffset = [25+0,50+10]; //[25,50] is the distance to the origin



needsInitialSetup = true;