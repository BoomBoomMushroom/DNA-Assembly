extends Node2D

var blockMouseFromMovingCamera: bool = false
var movingObject: Node2D = null

func _process(delta: float) -> void:
	blockMouseFromMovingCamera = blockMouseFromMovingCamera or movingObject != null
	
	var globalMousePos = get_global_mouse_position()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == false:
		movingObject = null
	
	if movingObject != null:
		movingObject.global_position = globalMousePos
