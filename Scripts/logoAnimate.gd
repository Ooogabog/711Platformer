extends TextureRect

@export var float_distance: float = 8.0
@export var float_duration: float = 1.8

var starting_y: float

func _ready() -> void:
	starting_y = position.y

	var tween := create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(
		self,
		"position:y",
		starting_y - float_distance,
		float_duration
	)

	tween.tween_property(
		self,
		"position:y",
		starting_y,
		float_duration
	)
