// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// if (live_call()) return live_result;
// if (live_call(argument0)) return live_result; // For 1 arg scripts
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts

function MFLog(logString){
	// Add conditional for debug mode being on -- Micha TODO
	show_debug_message(logString);
	//if (live_call(argument0)) return live_result; // For 1 arg scripts
}