extends Area2D

const DAMAGE = 1
@onready var lyre_sound = $"../LyreSound"

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$AnimationPlayer.play("player_onstart_weapon")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func attack():
	show()
	$AnimationPlayer.play("player_attack_animation")


func _on_player_attack_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(DAMAGE)
