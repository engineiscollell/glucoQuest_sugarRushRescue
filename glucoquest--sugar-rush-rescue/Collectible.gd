extends Area2D

@export var type := "glucose" # or "insulin"

# Preload images (quickly set the paths)
var images := {
	"glucose": preload("res://Gathering/Collectibles/glucose.png"),
	"insulin": preload("res://Gathering/Collectibles/insulin.png")
}

func _ready():
	# Dynamically assign the sprite based on type
	$Sprite2D.texture = images[type]

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.collect_item(type)
		queue_free()
