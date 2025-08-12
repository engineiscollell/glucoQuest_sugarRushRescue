extends Node2D

@onready var pancreas = $Pancreas
@onready var muscles = $Muscles
@onready var brain = $Brain
@onready var liver = $Liver
@onready var information_button = $Information
@onready var book_button = $Book

var base_positions = {}

func _ready():
	base_positions = {
		pancreas: pancreas.position.y,
		muscles: muscles.position.y,
		brain: brain.position.y,
		liver: liver.position.y
	}

	# Connect pressed signals
	pancreas.pressed.connect(_on_pancreas_pressed)
	muscles.pressed.connect(_on_muscles_pressed)
	brain.pressed.connect(_on_brain_pressed)
	liver.pressed.connect(_on_liver_pressed)
	information_button.pressed.connect(_on_information_pressed)
	book_button.pressed.connect(_on_book_pressed)

func _process(delta):
	var t = Time.get_ticks_msec() / 1000.0
	pancreas.position.y = base_positions[pancreas] + sin(t * 2.0) * 5
	muscles.position.y = base_positions[muscles] + sin(t * 2.1 + 1.5) * 5
	brain.position.y = base_positions[brain] + sin(t * 1.9 + 3.2) * 5
	liver.position.y = base_positions[liver] + sin(t * 2.3 + 2.5) * 5

# === BUTTON HANDLERS ===

func _on_pancreas_pressed():
	get_tree().change_scene_to_file("res://Instructions pancreas.tscn")

func _on_liver_pressed():
	get_tree().change_scene_to_file("res://Instructions liver.tscn")

func _on_brain_pressed():
	get_tree().change_scene_to_file("res://Instructions brain.tscn")

func _on_muscles_pressed():
	get_tree().change_scene_to_file("res://Instructions muscles.tscn")

func _on_information_pressed():
	get_tree().change_scene_to_file("res://Information.tscn")

func _on_book_pressed():
	get_tree().change_scene_to_file("res://Learn how to play.tscn")
