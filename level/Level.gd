extends Node3D


@export var camera_distance: float = 10.
@export var camera_up: float = 5.
@export var input_sensibility: float = 1.

func _process(delta):
	set_top(delta)
	$Top/WorldEnvironment.environment.sky_rotation = $Top.rotation
	
	set_camera(delta)

func set_top(delta):
	if Input.is_action_pressed("move_up"):
		$Top.rotate($Camera3D.transform.basis.x, delta * input_sensibility)
	if Input.is_action_pressed("move_down"):
		$Top.rotate(-$Camera3D.transform.basis.x, delta * input_sensibility)
	if Input.is_action_pressed("move_right"):
		$Top.rotate($Camera3D.transform.basis.z, delta * input_sensibility)
	if Input.is_action_pressed("move_left"):
		$Top.rotate(-$Camera3D.transform.basis.z, delta * input_sensibility)

func set_camera(delta):
	var camera_direction: Vector3
	if $Player.linear_velocity.length_squared() > 0.1:
		camera_direction = -$Player.linear_velocity
	else:
		camera_direction = ($Camera3D.position - $Player.position)
	camera_direction -= ($Top.transform.basis.y * camera_direction) * $Top.transform.basis.y
	var camera_target = $Player.position + camera_distance * camera_direction.normalized() + camera_up * $Top.transform.basis.y
	$Camera3D.position += (camera_target - $Camera3D.position) * delta * 10

	$Camera3D.look_at($Player.position, $Top.transform.basis.y)
