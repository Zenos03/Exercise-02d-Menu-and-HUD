extends Node

func _ready():
	Global.time = 30
	update_score()
	update_time()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_time():
	$Time.text = "Time: " + str(Global.time)

func update_lives():
	pass

func _on_Timer_timeout():
	Global.time -= 1
	if Global.time <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	else:
		update_time()
