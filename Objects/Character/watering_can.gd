extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var water_scene = preload("res://Objects/Character/water.tscn")
@onready var water_spawner = $WaterSpawner

func pour():
	animation_player.play("pivot")

func spawn_water():
	var newwater = water_scene.instantiate()
	water_spawner.add_child(newwater)
	newwater.global_position = water_spawner.global_position
