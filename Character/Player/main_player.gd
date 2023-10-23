extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var animation_player = $AnimationPlayer
@onready var watering_can = $WateringCan
@onready var partner_path_remote = $PartnerPathRemote

var speed = 64
var can_water = true
var rolling = false
var can_roll = true


func _ready():
	watering_can.animation_player.connect(
		"animation_finished", _on_animation_player_animation_finished
	)


func _process(_delta):
	handle_movement()
	partner_path_remote.look_at(global_position + Vector2(0, -8) + velocity)
	handle_animation()
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
		pour_water()
	if Input.is_action_just_pressed("roll"):
		if can_roll:
			can_roll = false
			rolling = true
			speed = 256


func handle_animation():
	if rolling == true:
		animation_player.current_animation = "roll"
	elif velocity == Vector2.ZERO:
		animation_player.current_animation = "idle"
	else:
		animation_player.current_animation = "walk"


func pour_water():
	if can_water:
		can_water = false
		watering_can.pour()


func _on_animation_player_animation_finished(anim_name: StringName):
	match anim_name:
		"pivot":
			can_water = true
		"roll":
			can_roll = true
			rolling = false
			speed = 64
