extends CharacterBody3D

@export var verticalForce : float
@export var maxVerticalForce : float
@export var rotateForce : float
@export var maxRotateForce : float
@export var horizontalForce : float
@export var maxHorizontalForce : float
@export var incrementalForce : float

func _physics_process(delta: float) -> void:
	#p raises drone
	#w/s forward + back
	#a/d rotate left/right
	if Input.is_key_pressed(KEY_P): # LIFT DRONE
		if verticalForce < maxVerticalForce:
			verticalForce += incrementalForce * delta
		elif verticalForce > maxVerticalForce:
			verticalForce = maxVerticalForce
		#move_toward(global_position.y, global_position.y+1, verticalForce * delta)
		print(verticalForce)
		
	
	if Input.is_key_pressed(KEY_W): # MOVE FORWARD
		if horizontalForce < maxHorizontalForce:
			horizontalForce += incrementalForce * delta
		elif horizontalForce > maxHorizontalForce:
			horizontalForce = maxHorizontalForce
		
		#print("KEY PRESSED W")
		print(horizontalForce)
	
	elif Input.is_key_pressed(KEY_S): # MOVE BACKWARDS
		if horizontalForce * -1 > maxHorizontalForce * -1:
			horizontalForce -= incrementalForce * delta
		elif horizontalForce * -1 < maxHorizontalForce * -1:
			horizontalForce = maxHorizontalForce * -1
	
	velocity = Vector3(horizontalForce, verticalForce, 0)
	move_and_slide()
	if Input.is_key_pressed(KEY_A): # ROTATE LEFT
		if rotateForce < maxRotateForce:
			rotateForce += incrementalForce * delta
		elif rotateForce > maxRotateForce:
			rotateForce = maxRotateForce
	elif Input.is_key_pressed(KEY_D): # ROTATE RIGHT
		if rotateForce < maxRotateForce:
			rotateForce += incrementalForce * delta
		elif rotateForce > maxRotateForce:
			rotateForce = maxRotateForce
	else:
		if rotateForce > 0:
			rotateForce -= incrementalForce * delta
		elif rotateForce < 0:
			rotateForce = 0
	rotate_y(rotateForce)
