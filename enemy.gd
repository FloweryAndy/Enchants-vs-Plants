extends Area2D

@export var enemy_number: int = 1
@export var is_moving = false
@onready var sprite_2d = $Sprite2D


func _ready():
	sprite_2d.region_rect.position.y = enemy_number * 32


func _process(_delta):
	if not is_moving:
		$AnimationPlayer.current_animation = "walk"
	else:
		$AnimationPlayer.current_animation = "idle"


func _on_body_entered(_body: Node2D):
	queue_free()
