extends Node

@export var delay : float

@onready var player = $AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	delay_start(delay)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# a random timer between time and max time to start an audio
	
	pass

func delay_start(delay:float):
	await get_tree().create_timer(delay).timeout
	start_audio(player)

func start_audio(player:AudioStreamPlayer3D):
	player.play()
