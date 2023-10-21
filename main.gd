extends Node

@onready var main_camera = $MainLevel/MainCamera
@onready var battle_camera = $BattleLevel/BattleCamera


func _input(event):
	if event.is_action_pressed("escape"):
		$MainMenu.visible = true
		process_mode = Node.PROCESS_MODE_DISABLED
