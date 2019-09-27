//color
function randomHexColor() {
    var color;
    color = Math.floor(Math.random() * 0x1000000); // integer between 0x0 and 0xFFFFFF
    color = color.toString(16); // convert to hex
    color = ("000000" + color).slice(-6); // pad with leading zeros
    color = "#" + color; // prepend #
    return color;
}
function invertColor(hexColor) {
    var color = String(hexColor);
    color = color.substring(1); // remove #
    color = parseInt(color, 16); // convert to integer
    color = 0xFFFFFF ^ color; // invert three bytes
    color = color.toString(16); // convert to hex
    color = ("000000" + color).slice(-6); // pad with leading zeros
    color = "#" + color; // prepend #
    return color;
}

function randomInt(max) {
    return parseInt(Math.random() * max)
}

//laucher helper
function getGridColumms(parent, grid) {
    var columms = Math.floor(Math.min(grid.count, parent.width / grid.cellWidth))
    return Math.max(columms, 1)
}
function getGridRows(parent, grid) {
    var rows = Math.floor(Math.min(grid.count / getGridColumms(parent, grid), parent.height / grid.cellHeight))
    return Math.max(rows, 1)
}
function getLeftMarginToCenter(parent, grid) {
    var leftMargin = (parent.width - grid.cellWidth * getGridColumms(parent, grid)) / 2
    print ("parent.width=", parent.width)
    print ("c=", grid.cellWidth * getGridColumms(parent, grid))
    return leftMargin
}
function getTopMarginToCenter(parent, grid) {
    var topMargin = (parent.height - grid.cellHeight * getGridRows(parent, grid)) / 2
    print(topMargin)
    return topMargin
}
