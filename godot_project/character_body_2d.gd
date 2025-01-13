extends CharacterBody2D

var platforma = 1
const SPEED = 300.0
var JUMP_VELOCITY = -700.0
var nove_pocitadlo_zmenseni = 0.0016
var objekty_na_platformach
var zachyceno = 0
var probehlo_2 = 0
var probehlo_3 = 0
var probehlo_4 = 0
var probehlo_5 = 0


func _physics_process(_delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

		
	var direction := Input.get_axis("ui_left", "ui_right")
	#Input.get_axis == "ui_left"
	#	
		
	if direction:
		print (platforma)
		print (maxik)
		$"../CharacterBody2D".scale.x=$"../CharacterBody2D".scale.x-nove_pocitadlo_zmenseni
		$"../CharacterBody2D".scale.y=$"../CharacterBody2D".scale.y-nove_pocitadlo_zmenseni
		if $"../CharacterBody2D".scale.x > 1.4 and $"../CharacterBody2D".platforma == 1 and zachyceno == 0:
			$"../StaticBody2D/CollisionShape2D_P2".set_rotation_degrees(0) # je to prostupné po otočení
			platforma = 2
		if $"../CharacterBody2D".scale.x > 1.4 and $"../CharacterBody2D".platforma == 2 and zachyceno == 1:
			$"../StaticBody2D/CollisionShape2D_P3".set_rotation_degrees(0) # je to prostupné po otočení
			platforma = 3	
		if $"../CharacterBody2D".scale.x > 1.4 and $"../CharacterBody2D".platforma == 3 and zachyceno == 2:
			$"../StaticBody2D/CollisionShape2D_P4".set_rotation_degrees(0) # je to prostupné po otočení
			platforma = 4	
		if $"../CharacterBody2D".scale.x > 1.4 and $"../CharacterBody2D".platforma == 4 and zachyceno == 3:
			$"../StaticBody2D/CollisionShape2D_P5".set_rotation_degrees(0) # je to prostupné po otočení
			platforma = 5	

		if platforma == 5:	
			$"../Area2D_platform_2".position.x = 50000
			$"../Area2D_platform_3".position.x = 50000
			$"../Area2D_platform_4".position.x = 50000
			$"../Area2D_platform_5".position.x = 50000
			
			
			if $"../CharacterBody2D".scale.x > 6:
				$"../CharacterBody2D/zravila_win".visible = true

		if $"../CharacterBody2D".scale.x < 0.05:
			get_tree().quit()
			
			#nove_pocitadlo_zmenseni = 0
		
		velocity.x = direction * SPEED
		
		
		# otáčení postavičky
		if velocity.x < 0 and $Sprite2D.scale.x > 0:
			$Sprite2D.scale.x *= -1.0
			
		if velocity.x > 0 and $Sprite2D.scale.x < 0:
			$Sprite2D.scale.x *= -1.0
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	var koefik = 175
	objekty_na_platformach = 240 - koefik * platforma
	
	
var pocitadlo = 0
var maxik = 0
	
func _process(_delta: float) -> void:
	
	if zvetsit_plynule == 1:
		if pocitadlo < maxik:
			$"../CharacterBody2D".scale=$"../CharacterBody2D".scale * 1.01
		pocitadlo += 1
		if pocitadlo >= maxik:
			zvetsit_plynule = 0
		
	if zmensit_plynule == 1:
		if pocitadlo < maxik:
			$"../CharacterBody2D".scale=$"../CharacterBody2D".scale * 0.95
		pocitadlo += 1
		if pocitadlo >= maxik:
		#if $"../CharacterBody2D".scale.x < 1
			zmensit_plynule = 0	
		
var zvetsit_plynule = 0
var zmensit_plynule = 0
func _zobraz_food_1():
		$"../Area2D_food_01".position.x=randf_range(-800, 150)
		$"../Area2D_food_01".position.y=randf_range(objekty_na_platformach, objekty_na_platformach-80)
		zvetsit_plynule = 1
		pocitadlo = 0
		maxik = 10

func _zobraz_food_2():
		$"../Area2D_food_02".position.x=randf_range(-800, 150)
		$"../Area2D_food_02".position.y=randf_range(objekty_na_platformach, objekty_na_platformach-80)
		zvetsit_plynule = 1
		pocitadlo = 0
		maxik = 10

func _on_area_2d_food_01_body_entered(_body: Node2D) -> void:
	_zobraz_food_1()

func _on_area_2d_food_02_body_entered(_body: Node2D) -> void:
	_zobraz_food_2()





func _on_area_2d_platform_2radsinova_body_entered(_body: Node2D) -> void:
		
		if probehlo_2 == 0:
			zmensit_plynule = 1
			pocitadlo = 0
			maxik = 10
			probehlo_2 = 1
		zachyceno = 1
		_zobraz_food_1()
		_zobraz_food_2()
		#$"../Area2D_platform_2".position.x = 50000



func _on_area_2d_platform_3_body_entered(_body: Node2D) -> void:
		
		if probehlo_3 == 0:
			zmensit_plynule = 1
			pocitadlo = 0
			maxik = 15
			probehlo_3 = 1
		zachyceno = 2	
		_zobraz_food_1()
		_zobraz_food_2()
		#$"../Area2D_platform_3".position.x = 50000

func _on_area_2d_platform_4_body_entered(_body: Node2D) -> void:
		
		if probehlo_4 == 0:
			zmensit_plynule = 1
			pocitadlo = 0
			maxik = 20
			probehlo_4 = 1
		zachyceno = 3
		_zobraz_food_1()
		_zobraz_food_2()
		#$"../Area2D_platform_4".position.x = 50000

func _on_area_2d_platform_5_body_entered(_body: Node2D) -> void:
		
		if probehlo_5 == 0:
			zmensit_plynule = 1
			pocitadlo = 0
			maxik = 25
			probehlo_5 = 1
		zachyceno = 4
		_zobraz_food_1()
		_zobraz_food_2()
		#$"../Area2D_platform_5".position.x = 50000
