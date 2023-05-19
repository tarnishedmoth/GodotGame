extends Node

@export var speed : float
@export var buffer : float
var target : Node3D

@onready var Self : Node3D = get_parent()
@onready var Scene : Node3D = Self.get_parent()
@onready var Player : RigidBody3D = Scene.get_node("Player")

func _ready():
	set_target(Player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta:float) -> void:
	Self.look_at(target.position)
	Self.position += (target.position - Self.position).normalized() * speed * delta

func set_target(newTarget:Node3D) -> void:
	target = newTarget
	pass
