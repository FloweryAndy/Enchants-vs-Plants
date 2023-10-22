extends Node2D


func _ready():
	add_user_signal("entered_battle")
	add_user_signal("exited_battle")
	visible = false


func enter_battle():
	emit_signal("entered_battle")
	visible = true


func exit_battle():
	emit_signal("exited_battle")
	visible = false


#Player Turn true or false. True player turn. False enemy turn
#Player basic candy bomb does 5 damage
#Enemy has a random chance of a critical hit increasing Pump kid's chance of dying


func _on_enemy_body_entered(body: Node2D):
	enter_battle()
