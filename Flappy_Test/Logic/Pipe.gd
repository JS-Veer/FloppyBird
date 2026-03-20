extends Area2D

const DEFAULT_HOR_SPEED : int = -30

var hor_speed : int = DEFAULT_HOR_SPEED
var pipe_scored: bool = false

@onready var _initial_pos : Vector2 = position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:  
	randomVerticalPosition()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += hor_speed * delta
	if position.x < -26 :  
		position.x = 400
		pipe_scored = false
		randomVerticalPosition()
	if position.x < 40 and pipe_scored == false :
		pipe_scored = true
		

func randomVerticalPosition() -> void:
	position.y = randf_range(-20, 150)


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Bird":
		hor_speed = 0

func _on_pipe_area_entered(area: Area2D) -> void:
	_on_area_entered(area)

func _on_pipe_2_area_entered(area: Area2D) -> void:
	_on_area_entered(area)

func _on_pipe_3_area_entered(area: Area2D) -> void:
	_on_area_entered(area)

func _on_pipe_4_area_entered(area: Area2D) -> void:
	_on_area_entered(area)
