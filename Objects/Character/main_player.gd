extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var animation_player = $AnimationPlayer
@onready var watering_can = $WateringCan

var speed = 64
var can_water = true

func _process(_delta):
    handle_movement()
    move_and_slide()

func handle_movement():
    if Input.is_action_pressed("up"):
        velocity.y = -speed
    if Input.is_action_pressed("down"):
        velocity.y = speed
    if Input.is_action_pressed("right"):
        velocity.x = speed
    if Input.is_action_pressed("left"):
        velocity.x = -speed
    if not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
        velocity.y = 0
    if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
        velocity.x = 0
    if Input.is_action_just_pressed("interact"):
        if can_water:
            pour_water()

func pour_water():
    can_water = false
    watering_can.pour()

func _on_animation_player_animation_finished(anim_name:StringName):
    can_water = true
