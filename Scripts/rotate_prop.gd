extends Node3D

@export var rotate_force : float
@export var rotate_increment : float
@export var max_rotate_force : float

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		if rotate_force < max_rotate_force:
			rotate_force += rotate_increment
		elif rotate_force > max_rotate_force:
			rotate_force = max_rotate_force
	else:
		if rotate_force > 0:
			rotate_force -= rotate_increment
		elif rotate_force < 0:
			rotate_force = 0
	rotate_y(rotate_force)
