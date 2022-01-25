extends KinematicBody2D

const gravidade = 4000
const ACCEL = 0.4
var velocidade = Vector2.ZERO
var speed = 200

func _ready():
	pass

func _physics_process(delta):
	var dir = 0
	dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if dir > 0:
		$Sprite.flip_h = false
	if dir < 0:
		$Sprite.flip_h = true
		
	velocidade.y += gravidade * delta
	
	if dir != 0:
		velocidade.x = lerp(velocidade.x,speed*dir,ACCEL)
	else:
		if is_on_floor():
			velocidade.x = lerp(velocidade.x,0,ACCEL/2)

	
	velocidade = move_and_slide(velocidade,Vector2.UP)

