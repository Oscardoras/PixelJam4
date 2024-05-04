class_name CustomBody extends RigidBody3D


func _physics_process(delta):
	var gravity_acceleration: float = ProjectSettings.get_setting("physics/3d/default_gravity")
	apply_force(-get_node("/root/Level/Top").transform.basis.y * gravity_acceleration * mass * gravity_scale)
