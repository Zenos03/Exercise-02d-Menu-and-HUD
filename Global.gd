extends Node

var score = 0
var time = 0
var lives = 0

func _ready():
	randomize()
	reset()

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()

func update_score(s):
	score += 5
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()

func update_lives(l):
	lives += 1
	if lives < 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	else:
		var HUD = get_node_or_null("/root/Game/UI/HUD")
		if HUD != null:
			HUD.update_lives()

func reset():
	get_tree().paused = false
	score = 0 
	time = 30
	lives = 5
	
func _physics_process(_delta):
	var Asteroid_Container = get_node_or_null("/root/Game/Asteroid_Container")
	var Enemy_Container = get_node_or_null("/root/Game/Enemy_Container")
	if Asteroid_Container != null and Enemy_Container != null:
		if Asteroid_Container.get_child_count() == 0 and Enemy_Container.get_child_count() == 0:
			var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
