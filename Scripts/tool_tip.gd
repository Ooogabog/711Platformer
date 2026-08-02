extends Control


func _on_continue_button_pressed() -> void:
	GameManager.start_stopwatch()
	get_tree().change_scene_to_file("res://Scenes/levelSelect.tscn")
