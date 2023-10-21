extends Control

@onready var main_menu_music = $MainMenuMusic
@onready var tab_container = $"MarginContainer/PanelContainer/TabContainer"

func start_game():
	visible = false
	$"..".process_mode = Node.PROCESS_MODE_INHERIT

func exit_game():
	get_tree().quit()

func _on_sound_volume_slider_value_changed(value:float):
	AudioServer.set_bus_volume_db(2, value)

func _on_music_volume_slider_value_changed(value:float):
	AudioServer.set_bus_volume_db(1, value)

func _on_quit_game_button_pressed():
	exit_game()

func _on_options_button_pressed():
	tab_container.current_tab = 1

func _on_play_game_button_pressed():
	start_game()

func _on_back_button_pressed():
	tab_container.current_tab = 0
