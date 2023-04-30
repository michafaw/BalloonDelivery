/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;


if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace)) {
	// Do nothing
} else if (keyboard_check_pressed(ord("1"))) {
	global.numPlayers = 1;
	room_goto(roomMain);
} else if (keyboard_check_pressed(ord("2"))) {
	global.numPlayers = 2;
	room_goto(roomMain);
} else if (keyboard_check_pressed(vk_anykey)) {
	room_goto(roomMain);
}