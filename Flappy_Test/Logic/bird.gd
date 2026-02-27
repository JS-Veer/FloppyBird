extends Area2D

const DEFAULT_HOR_SPEED = 20
const DEFAULT_VER_SPEED = -75
const g = 100

var hor_speed = DEFAULT_HOR_SPEED
var ver_speed = DEFAULT_VER_SPEED
var rot_Var = 0
var a = -45

@onready var _initial_pos = position
@onready var _initial_rot = rotation
@onready var _animated_sprite = $AnimatedSprite2D

func _process(delta):
	_animated_sprite.play("Flap")
	ver_speed += delta * g
	if Input.is_action_just_pressed("Space"):
		ver_speed = DEFAULT_VER_SPEED
	position.y += ver_speed * delta
	position.x += hor_speed * delta
	rotation_Update(ver_speed)
	
func rotation_Update(ver_speed):
	a = ver_speed 
	if a > 100:
		a = 100
	elif a < 0:
		a = 0
	a = -45 + a * 0.02
	rotation = a


func _on_floor_area_entered(area: Area2D) -> void:
	_animated_sprite.stop()
	ver_speed = 0
	hor_speed = 0
	rotation = 90
	get_tree().paused = true
