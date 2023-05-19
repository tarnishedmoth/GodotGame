extends RigidBody3D

# Variables
@export var Strength : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var localTorque = Vector3.ZERO
	var angularVel = get_angular_velocity()
	var volume = clamp(angularVel.length_squared() - 30, -30.0, -18.0)
	
	if $AudioRatchet3D.playing:
		$AudioRatchet3D.volume_db = volume;
	
	if angularVel.length_squared() < 1.0:
		if $AudioRatchet3D.playing:
			$AudioRatchet3D.stop()
	else:
		if not $AudioRatchet3D.playing:
			$AudioRatchet3D.play()
	
	if Input.is_action_pressed("Push Left"):
		#apply_torque(Vector3(Strength, 0.0, 0.0))
		localTorque.x += Strength
		
	if Input.is_action_pressed("Brake Left"):
		#apply_torque(Vector3(-Strength, 0.0, 0.0))
		localTorque.x -= Strength
	
	var globalTorque = global_transform.basis * localTorque
	apply_torque(globalTorque)
	
	pass
