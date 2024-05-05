extends Node2D


@export var max_windows: int = 3
@export var spawn_delay: float = 2.
var spawn_time: float = 0.
var window_resource

func _ready():
	window_resource = preload("res://window/Window.tscn")

func _process(delta):
	spawn_time += delta
	
	if spawn_time >= spawn_delay:
		spawn_time -= spawn_delay
		if get_child_count() < max_windows:
			var window = window_resource.instantiate()
			add_child(window)
			window.position = get_window().position + get_window().size / 2
