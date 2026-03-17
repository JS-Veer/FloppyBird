extends Area2D

const DEFAULT_HOR_SPEED = -30

var hor_speed : int = DEFAULT_HOR_SPEED

@onready var _initial_pos : Vector2 = position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:  
	randomVerticalPosition()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += hor_speed * delta
	if position.x < 0 :  
		
		position.x = 400
		randomVerticalPosition()

func randomVerticalPosition() -> void:
	position.y = randf_range(-20, 150)
