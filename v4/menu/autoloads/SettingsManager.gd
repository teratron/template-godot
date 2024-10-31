# This script stores the settings of the game and executes changes to the settings.
#
# Settings values are stored in a config file to be loaded when the game starts.

extends Node

var fullscreen: bool = false

var master_volume:  int = 3
var music_volume:   int = 3
var effects_volume: int = 3
var voices_volume:  int = 3

var master_bus  = 0
var music_bus   = 1
var effects_bus = 2
var voices_bus  = 3

const config_path = "user://config.save"


func initialize_audio():
	for i in [[master_bus, master_volume], [music_bus, music_volume], [effects_bus, effects_volume], [voices_bus, voices_volume]]:
		if i[1] == 0:
			AudioServer.set_bus_mute(i[0], true)
		else:
			AudioServer.set_bus_mute(i[0], false)
			var expression = Expression.new()
			expression.parse("10 - 100 / " + str(i[1]))
			var result = expression.execute()
			AudioServer.set_bus_volume_db(i[0], result)


func initialize_video():
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func return_config_dictionary():
	var config_dict = {
		"fullscreen":     fullscreen,
		"master_volume":  master_volume,
		"music_volume":   music_volume,
		"effects_volume": effects_volume,
		"voices_volume":  voices_volume
	}
	return config_dict


func save_config():
	var config_file = FileAccess.open(config_path, FileAccess.WRITE)
	var config_data = return_config_dictionary()
	config_file.store_var(config_data)
	config_file = null


func load_config():
	if FileAccess.file_exists(config_path):
		# Load...
		var config_file = FileAccess.open(config_path, FileAccess.READ)
		var config_data = config_file.get_var()
		
		# ... and process the dictionary to use the data stored in the the config file:
		for i in config_data.keys():
			match i:
				"fullscreen":     fullscreen     = config_data[i]
				"master_volume":  master_volume  = config_data[i]
				"music_volume":   music_volume   = config_data[i]
				"effects_volume": effects_volume = config_data[i]
				"voices_volume":  voices_volume  = config_data[i]
		
		# close the config file
		config_file = null
		
		# initialize the values stored in the config
		initialize_audio()
		initialize_video()
