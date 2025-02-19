extends Node3D

@onready var game_timer = $GameTimer
@onready var score_label = $UI/ScoreLabel
@onready var time_label = $UI/TimeLabel
@onready var game_over_label = $UI/GameOverLabel

var total_treasures = 10  
var collected_treasures = 0  

func _ready():
	game_timer.start()  
	update_ui()  
	game_over_label.hide()  

func _on_game_timer_timeout():
	end_game(false)

func collect_treasure():
	collected_treasures += 1
	update_ui()

	if collected_treasures >= total_treasures:
		end_game(true)

func update_ui():
	score_label.text = "Score: " + str(collected_treasures) + " / " + str(total_treasures)
	time_label.text = "Time: " + str(int(game_timer.time_left)) + "s"

func end_game(player_won: bool):
	game_timer.stop() 
	game_over_label.show() 

	if player_won:
		game_over_label.text = "You Won!"
	else:
		game_over_label.text = "Try Again!"
