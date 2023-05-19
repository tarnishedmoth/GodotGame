extends Label

@export var label : String
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_win():
	score = "yes you fucking won"
	scale *= 3
	text = label % score
	$Win_AudioPlayer.play()
