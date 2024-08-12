extends Node2D

@onready var cerberus_boss_bar = $Player/CerberusBossBar

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.lyre_pickup = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cerberus_boss_trigger_body_entered(body):
	cerberus_boss_bar.visible = true
	pass # Replace with function body.
