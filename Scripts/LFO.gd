extends Node

## A brief description of my script.

## in Meters
@export var amplitude : float

## in who knows what
@export var frequency : int

## 
@export var wobble : float

## so it can be offset
@export var phase : float
var offset : Vector3
var elapsedTime : float

@export var xFactor : float
@export var yFactor : float
@export var zFactor : float


@onready var Self : Node3D = get_parent()
@onready var Scene : Node3D = Self.get_parent()
@onready var Player : RigidBody3D = Scene.get_node("Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	elapsedTime = 0.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta:float) -> void:
	elapsedTime += delta
	
	phase = sin(elapsedTime * frequency * (2*PI))
	offset = Vector3(phase*amplitude*xFactor, \
	phase*amplitude*yFactor, \
	phase*amplitude*zFactor)
	
	Self.translate(offset)
	pass
