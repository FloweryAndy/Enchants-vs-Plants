extends CharacterBody2D

@export var partner_number: int = 1
@onready var sprite_2d = $Sprite2D


func _ready():
	sprite_2d.region_rect.position.y = partner_number * 32


func _process(_delta):
	if velocity != Vector2.ZERO:
		$AnimationPlayer.current_animation = "walk"
	else:
		$AnimationPlayer.current_animation = "idle"
