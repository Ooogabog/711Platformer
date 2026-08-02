extends Node2D

@onready var stopwatch_label: Label = $StopwatchLabel


func _process(_delta: float) -> void:
	stopwatch_label.text = GameManager.get_formatted_time()
