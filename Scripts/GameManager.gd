extends Node

signal grocery_list_updated

var stopwatch_running: bool = false
var elapsed_time: float = 0.0

func _process(delta: float) -> void:
	if stopwatch_running:
		elapsed_time += delta
		
func start_stopwatch() -> void:
	elapsed_time = 0.0
	stopwatch_running = true


func stop_stopwatch() -> void:
	stopwatch_running = false


func get_formatted_time() -> String:
	var total_seconds := int(elapsed_time)
	var minutes := total_seconds / 60
	var seconds := total_seconds % 60
	var milliseconds := int((elapsed_time - total_seconds) * 100)

	return "%02d:%02d.%02d" % [minutes, seconds, milliseconds]

var snack_items: Array[String] = [
	"Oreos",
	"Chips"
]

var drink_items: Array[String] = [
	"Coke",
	"Orange Juice",
	"Coffee"
]

var hot_food_items: Array[String] = [
	"Cookie"
]

# Each entry will look like:
# {
#     "name": "Oreos",
#     "collected": false
# }
var grocery_list: Array[Dictionary] = []


func start_new_run() -> void:
	grocery_list.clear()

	add_random_item(snack_items)
	add_random_item(drink_items)
	add_random_item(hot_food_items)

	grocery_list_updated.emit()

	print("New grocery list: ", grocery_list)


func add_random_item(category: Array[String]) -> void:
	var chosen_item: String = category.pick_random()

	grocery_list.append({
		"name": chosen_item,
		"collected": false
	})


func collect_item(item_name: String) -> void:
	for item in grocery_list:
		if item["name"] == item_name:
			if item["collected"]:
				return

			item["collected"] = true
			grocery_list_updated.emit()
			print("Collected: ", item_name)

			if is_list_complete():
				stop_stopwatch()
				print("Final time: ", get_formatted_time())
				get_tree().change_scene_to_file("res://Scenes/EndScreen.tscn")

			return

	push_warning(item_name + " is not on the current grocery list.")


func is_item_collected(item_name: String) -> bool:
	for item in grocery_list:
		if item["name"] == item_name:
			return item["collected"]

	return false


func is_list_complete() -> bool:
	for item in grocery_list:
		if not item["collected"]:
			return false

	return true

func has_item(item_name: String) -> bool:
	for item in grocery_list:
		if item["name"] == item_name:
			return true

	return false
