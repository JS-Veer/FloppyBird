extends PanelContainer
# @onready var Pause_Panel = $PausePanel
var death: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	death = false
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Escape") and death == false:
		pause_Game_Check()  

func pause_Game_Check() -> void:
	if get_tree().paused == true:
		hide()
		get_tree().paused = false
	elif get_tree().paused == false:
		show()
		get_tree().paused = true
	


func _on_floor_area_entered(area: Area2D) -> void:
	if area.name == "Bird":
		death = true
