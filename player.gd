extends RigidBody3D

@export var WheelRadius : float
@export var MaxHandSpeed : float

# Initialized references
var _wheelLeft
var _wheelRight

var audio_fromWheelSpeed
var scoreLabel

var _character

# @onready var _cargo : Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Register everything you would look up as children
	_wheelLeft = $WheelLeft
	_wheelRight = $WheelRight
	
	audio_fromWheelSpeed = $AudioSpeed3D
	scoreLabel = get_node("%ScoreLabel")
	
	_character = $Chair/Character


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var linearVel = get_linear_velocity()
	var volume = clamp(linearVel.length_squared() - 30.0, -40.0, -14.0)
	
	# Wheel speed audio; sound that comes from going faster, of dirt beneath the wheels.
	if audio_fromWheelSpeed.playing:
		audio_fromWheelSpeed.volume_db = volume
	
	if linearVel.length_squared() < 3.0:
		if audio_fromWheelSpeed.playing:
			audio_fromWheelSpeed.stop()
	else:
		if not audio_fromWheelSpeed.playing:
			audio_fromWheelSpeed.play()
			
	
	# Hands Animation
	var left_angular_velocity = _wheelLeft.get_angular_velocity()
	var right_angular_velocity = _wheelRight.get_angular_velocity()
	
	var left_speed = clampf(left_angular_velocity.x * WheelRadius * delta, -MaxHandSpeed, MaxHandSpeed)
	var right_speed = clampf(right_angular_velocity.x * WheelRadius * delta, -MaxHandSpeed, MaxHandSpeed)
	
	if Input.is_action_pressed("Push Left") or Input.is_action_pressed("Brake Left"):
		_character.animate_hand(false, left_speed)
		
	else:
		_character.idle_hand(false, delta)
		
	if Input.is_action_pressed("Push Right") or Input.is_action_pressed("Brake Right"):
		_character.animate_hand(true, right_speed)
		
	else:
		_character.idle_hand(true, delta)
	


func on_win():
	Linker.UI.on_win()
	pass # Replace with function body.
	
func on_checkpoint(area:Area3D):
	print("on_checkpoint ", area.name)
	pass # Replace with function body.
	
func on_collectible(area:Area3D):
	print("on_collectible ", area.name)
	# Store the collectible
	pass # Replace with function body.


func _on_area_3d_area_entered(area:Area3D):
	print(area.name, " entered")
	#if area.name == "Win_Area":
	#	on_win()
		
	if area.get_collision_layer_value(Area3DLibrary.FINISH):
		on_win()
		
	if area.get_collision_layer_value(Area3DLibrary.COLLECTIBLES): # Collectibles layer
		on_collectible(area)


func _on_area_3d_area_exited(area:Area3D):
	print(area.name, " exited")
