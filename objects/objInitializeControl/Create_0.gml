/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

MFLog("Initializing Game");

global.numPlayers = 1;
global.playerScore = [0, 0];



MFLog("Going to title screen");
room_goto(roomTitle);