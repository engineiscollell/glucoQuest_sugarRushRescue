extends Node2D

@onready var label = $SpaceLabel

var bouncing = false
var bounce_time = 0.0
var base_scale = Vector2.ONE
var has_switched = false

func _ready():
	base_scale = label.scale

func _process(delta):
	if has_switched:
		return

	if Input.is_action_just_pressed("Acces game") and not bouncing:
		bouncing = true
		bounce_time = 0.0

	if bouncing:
		bounce_time += delta
		var scale_factor = 1.0 + sin(bounce_time * 20.0) * 0.2
		label.scale = base_scale * scale_factor

		# Let it bounce for 0.3 seconds before switching
		if bounce_time >= 0.3:
			has_switched = true
			get_tree().change_scene_to_file("res://Pancreas.tscn")
