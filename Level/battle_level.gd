extends Node2D


func _ready():
	add_user_signal("entered_battle")
	add_user_signal("exited_battle")


func enter_battle():
	emit_signal("entered_battle")
	visible = true


func exit_battle():
	emit_signal("exited_battle")
	visible = false
