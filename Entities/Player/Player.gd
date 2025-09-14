extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var speed: SpeedComponent = $SpeedComponent

func _physics_process(_delta: float) -> void:
	_handle_movement()
	
func _handle_movement() -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	if direction:
		if direction.x != 0:
			animation.flip_h = direction.x < 0
		animation.play("walk")
	else:
		animation.play("idle")

	velocity = direction * speed.get_speed()
	move_and_slide()
