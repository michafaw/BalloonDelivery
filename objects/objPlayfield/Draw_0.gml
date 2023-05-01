/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

// Background
var bottomRight = [origin[0] + cellSize[0]*numColumns, origin[1] + cellSize[1]*numRows];
draw_rectangle_color(origin[0], origin[1], bottomRight[0], bottomRight[1], c_white, c_white, c_white, c_white, false);

var shouldDrawDebugLines = true;
var lineWidth = 1;
var lineColor = c_red;
var extraRows = 2;

var totalRows = numRows + extraRows;

if (shouldDrawDebugLines) {

	// Grid (Course)
	for (var i = 0; i <= numColumns; i++) {
		// Vertical Lines
		var topX = origin[0] + cellSize[0]*i;
		draw_line_width_color(topX, origin[1], topX, origin[1] + cellSize[1]*totalRows, lineWidth, lineColor, lineColor);
	}
	
	for (var j = 0; j <= numRows+extraRows; j++) {
		// Horizontal Lines
		var leftY = origin[1] + cellSize[1]*j;
		draw_line_width_color(origin[0], leftY, origin[0] + cellSize[0]*numColumns, leftY, lineWidth, lineColor, lineColor);
	}

}

// Draw Debug Fans

var fanColor = c_maroon;

// Left Side
var fanLeftX = origin[0] - fanWidth;
draw_rectangle_color(fanLeftX, origin[1], fanLeftX+fanWidth, origin[1] + cellSize[1]*numRows, fanColor, fanColor, fanColor, fanColor, false);

var fanRightX = origin[0] + cellSize[0]*numColumns;
draw_rectangle_color(fanRightX, origin[1], fanRightX+fanWidth, origin[1] + cellSize[1]*numRows, fanColor, fanColor, fanColor, fanColor, false);


// TODO - Recenter entire playfield, adjust balloon image to 70x100





