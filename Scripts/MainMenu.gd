extends Control

func _on_start_button_pressed() -> void:
	GameManager.start_new_run()
	get_tree().change_scene_to_file("res://Scenes/ToolTip.tscn")

func _on_option_button_pressed() -> void:
	print("Option pressed!")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
