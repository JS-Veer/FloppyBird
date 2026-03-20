extends Parallax2D

const DEFAULT_AUTOSCROLL_SPEED : Vector2 = Vector2(-30,0)
var speed : int = 0

@onready var autoscroll_var : Vector2 = autoscroll

func _on_pipe_area_entered(area: Area2D) -> void:
	pipe_area_entered(area)

func _on_pipe_2_area_entered(area: Area2D) -> void:
	pipe_area_entered(area)

func _on_pipe_3_area_entered(area: Area2D) -> void:
	pipe_area_entered(area)
	
func _on_pipe_4_area_entered(area: Area2D) -> void:
	pipe_area_entered(area)
	
func pipe_area_entered(area: Area2D) -> void:
	if area.name == "Bird":
		autoscroll_var = Vector2(0,0)
		autoscroll = autoscroll_var
