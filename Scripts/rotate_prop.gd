extends Node3D

@export var rotate_speed : float

func rotate_toward():
	
	pass

func _physics_process(delta: float) -> void:
	rotate_object_local(Vector3.LEFT, rotate_speed)
	pass
