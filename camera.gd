extends Node3D

@export var rotationSensitivity : float


func _process(delta):
	get_input_keyboard(delta)
	$InnerGimbal.rotation.x = clamp($InnerGimbal.rotation.x, -1, 0.9)

func _unhandled_input(event):
	pass

func get_input_keyboard(delta):
	#Rotate outer gimbal around Y axis
	var y_rotation = 0
	if Input.is_action_pressed("Camera Left"):
		y_rotation -= 1
	if Input.is_action_pressed("Camera Right"):
		y_rotation += 1
		
	rotate_object_local(Vector3.UP, y_rotation * rotationSensitivity * delta)

	#Rotate inner gimbal along X axis
	var x_rotation = 0
	if Input.is_action_pressed("Camera Up"):
		x_rotation += 1
	if Input.is_action_pressed("Camera Down"):
		x_rotation -= 1
	
	$InnerGimbal.rotate_object_local(Vector3.RIGHT, x_rotation * rotationSensitivity * delta)
