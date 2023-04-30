/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

var shouldDrawDebugLines = false;
var lineWidth = 2;
var lineColor = c_gray;
var lineColor2 = c_white;

if (shouldDrawDebugLines) {
	// Diagonals
	draw_line_width_color(0, 0, room_width, room_height, lineWidth, lineColor2, lineColor2);
	draw_line_width_color(0, room_height, room_width, 0, lineWidth, lineColor2, lineColor2);
	
	// Cross
	draw_line_width_color(room_width/2, 0, room_width/2, room_height, lineWidth, lineColor2, lineColor2);
	draw_line_width_color(0, room_height/2, room_width, room_height/2, lineWidth, lineColor2, lineColor2);

	// Grid (Course)
	var gridWidth = 100;
	var gridHeight = 100;
	for (var i = gridWidth; i < room_width; i += gridWidth) {
		draw_line_width_color(i, 0, i, room_height, lineWidth, lineColor, lineColor);
	}
	
	for (var j = gridHeight; j < room_height; j += gridHeight) {
		draw_line_width_color(0, j, room_width, j, lineWidth, lineColor, lineColor);
	}

}