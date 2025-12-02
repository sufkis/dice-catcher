extends Area2D

class_name Dice

signal game_over

const SPEED: float = 80.0
const ROTATION_SPEED: float = 5.0

@onready var sprite_2d: Sprite2D = $Sprite2D

var rotation_dir: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randf() < 0.5:
		rotation_dir *= -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += SPEED * delta
	sprite_2d.rotate(ROTATION_SPEED * rotation_dir * delta)
	check_game_over()


func check_game_over() -> void:
	if get_viewport_rect().end.y < position.y:
		game_over.emit()
		queue_free()
