class_name Countdown extends Timer

@export var Duration : float
@export var PreWait : float # To Do
@export var PostWait : float # To Do

# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = Duration
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_stopped():
		$Control.Announcer.text = str(time_left)
