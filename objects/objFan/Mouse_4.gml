/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

MFLog("Fan tapped");


// Move balloons in this row
if (myDirection == "right") {
	moveBalloonsInRowToRight(myPlayfield, myRow);
} else if (myDirection == "left") {
	moveBalloonsInRowToLeft(myPlayfield, myRow);
}


