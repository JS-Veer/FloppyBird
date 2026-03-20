extends Area2D

const DEFAULT_HOR_SPEED : int = 0
const DEFAULT_VER_SPEED : int = -75

var g : int = 100
var hor_speed : int = DEFAULT_HOR_SPEED
var ver_speed : float = DEFAULT_VER_SPEED
var rot_Var : int = 0
var a : int = -45
var pipe_hit: bool = false

@onready var _initial_pos : Vector2 = position
@onready var _initial_rot : float = rotation
@onready var _animated_sprite = $AnimatedSprite2D


func _ready() -> void:
	_animated_sprite.play("Flap_Offset")
	
func _process(delta : float) -> void:
	ver_speed += delta * g
	if Input.is_action_just_pressed("Space") and pipe_hit == false:
		ver_speed = DEFAULT_VER_SPEED
	position.y += ver_speed * delta
	position.x += hor_speed * delta
	rotation_Update(ver_speed)
	if Input.is_action_just_pressed("God_Mode"):
		god_Mode()
	
func rotation_Update(ver_speed):
	a = ver_speed 
	if a > 100:
		a = 100
	elif a < 0:
		a = 0
	a = -45 + a * 0.02
	rotation = a
	
func god_Mode() -> void:
	if get_node("CollisionShape2D").disabled == true:
		get_node("CollisionShape2D").disabled = false
		_animated_sprite.play("Flap_Offset")
	elif get_node("CollisionShape2D").disabled == false:
		get_node("CollisionShape2D").disabled = true
		_animated_sprite.play("Flap_GodMode")


func _on_floor_area_entered(area: Area2D) -> void:
	if area.name == "Bird":
		_animated_sprite.stop()
		ver_speed = 0
		hor_speed = 0
		rotation = 90
		get_tree().paused = true


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
		_animated_sprite.stop()
		hor_speed = 0
		g = 250
		pipe_hit = true
