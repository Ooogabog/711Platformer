extends CharacterBody2D

@export var speed: float = 250.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector(
		"Left",
		"Right",
		"Space",
		"Down"
	)

	velocity = direction * speed
	move_and_slide()
