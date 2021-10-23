extends Node2D


# Declare member variables here. Examples: 
export var key = 0
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_key (new_key):
	key += new_key
	$Player/Camera2D/Label.text = str(key)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
