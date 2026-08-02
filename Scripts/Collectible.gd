extends Area2D

@export var item_name: String = ""
@export_file("*.tscn") var return_scene: String


func _ready() -> void:
	# If this requested item was already collected earlier,
	# keep it gone when the player revisits the aisle.
	if GameManager.is_item_collected(item_name):
		queue_free()
		return

	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return

	# All products remain visible, but only the requested one is collectible.
	if not GameManager.has_item(item_name):
		print(item_name, " is not on the shopping list.")
		return

	GameManager.collect_item(item_name)

	# Remove the item immediately.
	queue_free()

	# Optionally return to the store map.
	if not return_scene.is_empty():
		get_tree().change_scene_to_file(return_scene)
