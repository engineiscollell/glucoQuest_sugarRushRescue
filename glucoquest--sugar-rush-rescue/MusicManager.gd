extends Node

@onready var player = $MusicPlayer
var current_track : String = "OutGame"

func _ready():
	if not player.playing:
		player.play()

func play_outgame_music():
	if current_track != "OutGame":
		player.stream = preload("res://OutGame music.ogg")
		player.play()
		current_track = "OutGame"

func play_ingame_music():
	if current_track != "InGame":
		player.stream = preload("res://InGame music.mp3")
		player.play()
		current_track = "InGame"
