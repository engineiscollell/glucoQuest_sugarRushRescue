extends ProgressBar

func _ready():
	update_bar_color()

func _process(_delta):
	update_bar_color()

func update_bar_color():
	var fill_color: Color

	if value <= 40:
		fill_color = Color.RED
	elif value <= 60:
		fill_color = Color.GREEN
	else:
		fill_color = Color.RED

	var style = get_theme_stylebox("fill").duplicate()
	style.bg_color = fill_color
	add_theme_stylebox_override("fill", style)
