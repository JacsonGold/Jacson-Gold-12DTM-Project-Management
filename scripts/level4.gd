extends Node2D

@onready var dontlookback = $Player/Dontlookback
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player.animated_sprite.flip_h = true
	if Input.is_action_just_pressed("move_right"):
		Global.player_death = true
		dontlookback.visible = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
		dontlookback.visible = false
		Global.player_death = false


func _on_is_my_wife_there_body_entered(body):
	pass # Replace with function body.
