extends Camera2D

# Thanks ChatGPT <3
# my original code was very jittery

@onready var globals_manager = %GlobalsManager

# Variable to store the initial position of the drag
var drag_start_position : Vector2
# Variable to check if dragging is happening
var dragging : bool = false

func _input(event):
	# Check if the left mouse button is pressed
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				# Start dragging and store the initial position
				dragging = true
				drag_start_position = event.position
			else:
				# Stop dragging when the mouse button is released
				dragging = false

	# If dragging is happening, update the camera position
	if event is InputEventMouseMotion and dragging and globals_manager.blockMouseFromMovingCamera == false:
		var drag_current_position = event.position
		var drag_delta = drag_start_position - drag_current_position
		# Move the camera by the drag delta
		position += drag_delta
		# Update the drag start position to the current position
		drag_start_position = drag_current_position
