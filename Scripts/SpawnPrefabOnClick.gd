extends Node2D

@onready var globals_manager = %GlobalsManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == MOUSE_BUTTON_LEFT:
		get_viewport_rect()
		
		if get_viewport_rect().has_point(event.position):
			print('test')
			globals_manager.blockMouseFromMovingCamera = true

