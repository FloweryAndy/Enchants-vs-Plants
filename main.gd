extends Node

@onready var camera_2d = $Camera2D
@onready var opening_cutscene = $OpeningCutscene
@onready var battle_level = $BattleLevel

func _ready():
	opening_cutscene.connect("finished_cutscene", _on_finished_cutscene)
	battle_level.connect("entered_battle", _on_entered_battle)
	battle_level.connect("exited_battle", _on_exited_battle)


func _input(event):
	if event.is_action_pressed("escape"):
		$MainMenu.visible = true
		process_mode = Node.PROCESS_MODE_DISABLED
		camera_2d.zoom = Vector2(.25, .25)
		camera_2d.position = Vector2.ZERO
		zoom_in()


func zoom_in():
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(1, 1), 1.0)


func zoom_out():
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(.25, .25), 1.0)


func _on_finished_cutscene():
	zoom_in()


func _on_entered_battle():
	zoom_out()


func _on_exited_battle():
	zoom_in()
