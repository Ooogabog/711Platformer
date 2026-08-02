extends Area2D

@onready var prompt = $Prompt

@export_file("*.tscn") var destination_scene: String

var player_is_near := false


func _ready() -> void:
	prompt.hide()
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	


func _process(_delta: float) -> void:
	if player_is_near and Input.is_action_just_pressed("Interact"):
		if destination_scene.is_empty():
			push_warning("No destination scene assigned to " + name)
			return

		get_tree().change_scene_to_file(destination_scene)


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_is_near = true
		prompt.show()


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_is_near = false
		prompt.hide()
