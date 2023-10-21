extends Node2D

@onready var animation_player = $AnimationPlayer

func pour():
    animation_player.play("pivot")