extends Node2D

@onready var globals_manager = %GlobalsManager
@onready var selfSprite: Sprite2D = $"."

@export var toSpawn: PackedScene

var rect: Rect2
var rectSize: Vector2
var positionOffset: Vector2
var didBlockMouse = false
var isBlockingMouse = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rectSize = selfSprite.get_rect().size
	positionOffset = -rectSize / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect = Rect2(position + positionOffset, rectSize)
	
	if not isBlockingMouse:
		if didBlockMouse:
			setMouseBlock(false)
			didBlockMouse = false

func setMouseBlock(value: bool):
	globals_manager.blockMouseFromMovingCamera = value

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == MOUSE_BUTTON_LEFT:
		event.position = get_global_mouse_position()
		
		if rect.has_point(event.position):
			isBlockingMouse = true
			didBlockMouse = true
			setMouseBlock(true)
			
			var child = toSpawn.instantiate()
			add_child(child)
		else:
			isBlockingMouse = false
