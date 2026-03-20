extends Label

const DEFAULT_HOR_SPEED : int = -30
const pipe_spacing : int = 106
var hor_speed : int = DEFAULT_HOR_SPEED
var pipe_scored_1: bool = false
var pipe_scored_2: bool = false
var pipe_scored_3: bool = false
var pipe_scored_4: bool = false
var x_1 : float = 351
var x_2 : float = x_1 + pipe_spacing
var x_3 : float = x_2 + pipe_spacing
var x_4 : float = x_3 + pipe_spacing
var score : int = 0

func _ready() -> void:
	# self.text = str(score)
	pass
	
func _process(delta: float) -> void:
	self.text = str(x_1)
	x_1 += hor_speed * delta
	x_2 += hor_speed * delta
	x_3 += hor_speed * delta
	x_4 += hor_speed * delta
	set_Back(x_1, pipe_scored_1)
	set_Back(x_2, pipe_scored_2)
	set_Back(x_3, pipe_scored_3)
	set_Back(x_4, pipe_scored_4)
	score_Increase(x_1, pipe_scored_1, score)
	score_Increase(x_2, pipe_scored_2, score)
	score_Increase(x_3, pipe_scored_3, score)
	score_Increase(x_4, pipe_scored_4, score)
		
func set_Back(x:float, pipe_scored : bool) -> void:
	if x < -26 :  
		x = 400
		pipe_scored = false
		
func score_Increase(x:float, pipe_scored: bool, score) -> void:
	if x < 40 and pipe_scored == false:
		score += 1
		#self.text = str(score)
		pipe_scored = true
		
