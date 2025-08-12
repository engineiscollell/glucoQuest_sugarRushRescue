extends Node2D  # or Control

@onready var menu_button = $MenuButton

var base_y = 0.0

func _ready():
	base_y = menu_button.position.y
	menu_button.pressed.connect(_on_menu_pressed)

func _process(delta):
	var t = Time.get_ticks_msec() / 1000.0
	menu_button.position.y = base_y + sin(t * 2.0) * 5

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Choose a level.tscn")
