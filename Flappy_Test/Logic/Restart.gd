extends PanelContainer
var death = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	death = false
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if death == true and Input.is_action_just_pressed("Enter"):
		get_tree().paused = false 
		get_tree().reload_current_scene() 

func _on_floor_area_entered(area: Area2D) -> void:
	if area.name == "Bird":
		show()
		get_tree().paused = true
		death = true
		
