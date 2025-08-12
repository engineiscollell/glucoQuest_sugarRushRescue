extends CharacterBody2D

@export var speed := 250.0
@export var jump_velocity := -900.0
var glucose_level := 50

const GRAVITY = 2000.0

@onready var glucose_meter = $"../CanvasLayer/ProgressBar"

func _ready():
	add_to_group("player")

func _physics_process(delta):
	var direction := Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_velocity
	else:
		velocity.y += GRAVITY * delta

	velocity.x = direction.x * speed
	move_and_slide()

	glucose_meter.value = glucose_level

	# Manual scene change (R key)
	if Input.is_action_just_pressed("r"):
		get_tree().change_scene_to_file("res://Game result.tscn")


func _on_body_entered(body):
	if not body:
		return

	match body.name:
		"Fruit":
			glucose_level += 25
		"Insulin":
			glucose_level -= 20
		"Brocoli":
			glucose_level += 5
		"Candy":
			glucose_level += 40
		"Game Over":
			get_tree().change_scene_to_file("res://Game result.tscn")
			return
		_:
			return

	glucose_level = clamp(glucose_level, 0, 100)
	glucose_meter.value = glucose_level
	body.queue_free()
