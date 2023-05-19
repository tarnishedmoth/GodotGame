extends Node3D

# For now this is just for animating the character. Could also allow emotes and
# inventory management, other stuff, who knows

var left_hand
var right_hand

var hand_return_speed = 1.3

# Called when the node enters the scene tree for the first time.
func _ready():
	left_hand = $LeftHandPath/PathFollower
	right_hand = $RightHandPath/PathFollower
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func animate_hand(hand, distance):
	# bool hand, false = left, true = right
	# float distance
	var move_me
	
	if not hand: # Left
		move_me = left_hand
	else: # Right
		move_me = right_hand
	
	move_me.progress -= distance

func idle_hand(hand, delta):
	var move_me
	if not hand: # Left
		move_me = left_hand
	else: # Right
		move_me = right_hand
	
	#move_me.progress_ratio *= 0.965
	move_me.progress_ratio = lerpBias(move_me.progress_ratio, 0.5, hand_return_speed, delta)
	pass
	
	
# if above threshold, lerps to 1.0, otherwise lerps to 0.0	
func lerpBias(value: float, threshold: float, interpolationSpeed: float, delta: float) -> float:
	if value > threshold:
		return lerp(value, 1.0, interpolationSpeed * delta)
	else:
		return lerp(value, 0.0, interpolationSpeed * delta)

