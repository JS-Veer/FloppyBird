extends PanelContainer
# @onready var Pause_Panel = $PausePanel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		pause_Game_Check()

func pause_Game_Check():
	if get_tree().paused == true:
		hide()
		get_tree().paused = false
	elif get_tree().paused == false:
		show()
		get_tree().paused = true
