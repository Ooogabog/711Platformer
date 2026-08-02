extends Node2D

@onready var grocery_list_label: Label = $GroceryListLabel
@onready var stopwatch_label: Label = $StopwatchLabel


func _ready() -> void:
	GameManager.grocery_list_updated.connect(update_grocery_list_label)
	update_grocery_list_label()


func _process(_delta: float) -> void:
	stopwatch_label.text = GameManager.get_formatted_time()


func update_grocery_list_label() -> void:
	var display_text := "Shopping List:\n"

	for item in GameManager.grocery_list:
		if item["collected"]:
			display_text += "✓ " + item["name"] + "\n"
		else:
			display_text += "□ " + item["name"] + "\n"

	grocery_list_label.text = display_text
