extends AudioStreamPlayer

var started = false
var crescendo = 0
@export var crescendo_rate : float


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing and not started:
		started = true
	
	if started:
		crescendo += crescendo_rate * delta
		
		if playing:
			var wet = clamp(crescendo, 0.0, 1.0)
			var knob = AudioServer.get_bus_effect(2,1)
			knob.set_wet(wet)
		
	pass
