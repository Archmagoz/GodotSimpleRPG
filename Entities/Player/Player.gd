extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var speed: SpeedComponent = $SpeedComponent

var is_attacking: bool = false

func _physics_process(_delta: float) -> void:
	_handle_attack()
	if not is_attacking:
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

func _handle_attack() -> void:
	if Input.is_action_pressed("attack"):
		is_attacking = true
		animation.play("attack")
	else:
		is_attacking = false
