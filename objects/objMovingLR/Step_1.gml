var _targetX = endX, _targetY = endY;
if (goingToStart) {
	_targetX = startX;
	_targetY = startY;
}

//set movement
moveX = sign(_targetX - x) * currentSpeed;
moveY = sign(_targetY - y) * currentSpeed;

