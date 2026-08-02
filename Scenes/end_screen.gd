extends Control

@onready var stopwatch_label: Label = $StopwatchLabel


func _ready() -> void:
	stopwatch_label.text = GameManager.get_formatted_time()


func _on_home_button_pressed() -> void:
	GameManager.grocery_list.clear()
	GameManager.stop_stopwatch()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
