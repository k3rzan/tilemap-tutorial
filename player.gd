extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var hdirection = Input.get_axis("ui_left", "ui_right")
	var vdirection = Input.get_axis("ui_up", "ui_down")
	
	if hdirection == 0 and vdirection == 0:
		$AnimationTree.set("parameters/conditions/idle", true)
		$AnimationTree.set("parameters/conditions/walk", false)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		$AnimationTree.set("parameters/conditions/walk", true)
		$AnimationTree.set("parameters/conditions/idle", false)
		
		if hdirection < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
			
		if vdirection and hdirection:
			velocity.x = hdirection /1.5 * SPEED
			velocity.y = vdirection /1.5 * SPEED
		else:
			velocity.x = hdirection * SPEED
			velocity.y = vdirection * SPEED
	

		
	move_and_slide()
