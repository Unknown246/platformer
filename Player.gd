extends KinematicBody2D
var gravity = Vector2(0,980)
var vel = Vector2()
var OAT = 0
var on_floor = false
var speed = 200
var jump = 400
var grav_forse = 980
var grav_dir = Vector2(0,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	OAT += delta
	vel += gravity * delta 
	if is_on_floor():
		OAT = 0
	on_floor = OAT < 0.1 
	vel = move_and_slide(vel,Vector2(0, -1),25.0)
	var target_vel = 0 
	if Input.is_action_pressed("ui_left"):
		target_vel -= 1
	if Input.is_action_pressed("ui_right"):
		target_vel += 1
	target_vel *= speed
	vel.x = lerp(vel.x,target_vel,0.3)
	if Input.is_action_just_pressed("ui_grav_u"):
		gravity = Vector2(0,-980)
	if Input.is_action_just_pressed("ui_grav_d"):
		gravity = Vector2(0,980)
	
	
	
	
	
	if Input.is_action_pressed("ui_up") and is_on_floor() and gravity == Vector2(0,980):
		vel.y = -jump
	
	if Input.is_action_pressed("ui_up") and is_on_floor() and gravity == Vector2(0,-980):
		vel.y = jump
	
	

