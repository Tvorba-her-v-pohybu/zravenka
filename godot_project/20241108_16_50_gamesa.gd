extends Node2D
@onready var my_timer = $Timer
@onready var pocitadlo_zmenseni = 0

#KOMENTAR
func _ready():
	my_timer.timeout.connect(_on_timer_timeout)
	my_timer.wait_time = 1000.0
	my_timer.start()
func _process(_delta: float):
	if my_timer.time_left > 0:
		#print(my_timer.time_left)
		
		pocitadlo_zmenseni=pocitadlo_zmenseni+0.1
		#if $"../CharacterBody2D".scale.x > 0:
			#$"../CharacterBody2D".scale.x=1-pocitadlo_zmenseni
			#$"../CharacterBody2D".scale.y=1-pocitadlo_zmenseni
func _on_timer_timeout():
	#print("Timer has timed out!")
	my_timer.stop()
