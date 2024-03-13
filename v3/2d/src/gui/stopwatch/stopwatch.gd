extends Node2D


var time = 0
var timer_on = false


func _process(delta):
	if timer_on:
		time += delta
	
	var mils = fmod(time, 1) * 1000
	var secs = fmod(time, 60)
	var mins = fmod(time, 3600) / 60
	var hour = fmod(fmod(time, 3600 * 60) / 3600, 24)
	var days = fmod(time, 12960000) / 86400
	
	var time_passed = "%02d : %02d : %02d : %02d : %03d" % [days, hour, mins, secs, mils]
	$Label.text = time_passed


func _on_StartButton_pressed():
	timer_on = true
	$ResetButton.disabled = true


func _on_StopButton_pressed():
	timer_on = false
	$ResetButton.disabled = false


func _on_ResetButton_pressed():
	time = 0
	timer_on = false
