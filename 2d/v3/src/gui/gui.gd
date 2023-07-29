extends MarginContainer


onready var number_label = $HBoxContainer/Bars/LifeBar/Count/Background/Number
onready var bar = $HBoxContainer/Bars/LifeBar/TextureProgress
onready var tween = $Tween

var animated_health = 0


func _ready():
	var player_max_health = $"../Characters/Player".max_health
	bar.max_value = player_max_health
	update_health(player_max_health)


func _process(delta):
	var round_value = round(animated_health)
	number_label.text = str(round_value)
	bar.value = round_value


func _on_Player_health_changed(player_health):
	update_health(player_health)


func _on_Player_died():
	pass # Replace with function body.


func update_health(new_value):
	tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6)
	if not tween.is_active():
		tween.start()
