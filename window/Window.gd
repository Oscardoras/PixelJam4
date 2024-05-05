extends Window


@export var speed: int = 100
var velocity: Vector2
var screen_size: Vector2i = Vector2i(1920, 1080)

func _ready():
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed

func _process(delta):
	if position.x <= 0 or position.x + size.x >= screen_size.x:
		velocity.x *= -1
	if position.y <= 0 or position.y + size.y >= screen_size.y:
		velocity.y *= -1
	
	position += Vector2i(velocity.x * delta, velocity.y * delta)

func _on_input_event(event):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		queue_free()
