extends CharacterBody2D

@export var partner_number: int = 0
@onready var sprite_2d = $Sprite2D
@onready var path_follow = $".."
var is_moving = false
var last_position = global_position.normalized()


func _ready():
	sprite_2d.region_rect.position.y = partner_number * 32


func _process(_delta):
	if global_position != last_position:
		is_moving = true
	last_position = global_position.normalized()
	if not is_moving:
		$AnimationPlayer.current_animation = "walk"
		path_follow.progress *= 1.01
	else:
		$AnimationPlayer.current_animation = "idle"
		path_follow.progress_ratio /= 1.01
