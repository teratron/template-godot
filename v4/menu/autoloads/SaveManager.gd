# This scripts saves and loads the player's progress.
# This can be done when starting the game (as it is here),
# or later, e.g. when creating or choosing a profile.

extends Node

const file_path = "user://savegame.save"


func return_savefile_dictionary():
	var save_dict = {}
	# Fill this dictionary with all the data you want to save, e.g. player position, score, etc.
	# You can look into the SettingsManager to see an example on how this works
	return save_dict


func save_savefile():
	var savefile = FileAccess.open(file_path, FileAccess.WRITE)
	var save_data = return_savefile_dictionary()
	savefile.store_var(save_data)
	savefile = null


func load_savefile():
	if FileAccess.file_exists(file_path):
		var savefile = FileAccess.open(file_path, FileAccess.READ)
		# Load... 
		var _save_data = savefile.get_var()
	
		# ... and process the dictionary to use the data stored in the the savefile:
		# You can look into the SettingsManager to see an example on how this works
