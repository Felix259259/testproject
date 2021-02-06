extends Control

# Kommentar
# Kommentar2
var stop_wuerfelpunkte_animieren	:= false

var wuerfelpos = 0
var letzte_wuerfelpos = 0

var wuerfel_anim_pos 			:= Vector2()


func _ready():
	pass
	

func _on_Button_button_up():
	wuerfelpos = randi()%3+1
	while wuerfelpos == letzte_wuerfelpos:
		wuerfelpos = randi()%3
	match wuerfelpos:
		1:
			$Wuerfel_Control.rect_rotation = -20.0
		2:
			$Wuerfel_Control.rect_rotation = -12.0
		3:
			$Wuerfel_Control.rect_rotation = -5.0
	
	print("wuerfelpos = ", wuerfelpos)
	letzte_wuerfelpos = wuerfelpos
	$AnimationPlayerWuerfel.play("WUERFELN")


func function_stop_wuerfelpunkte_animieren():
	stop_wuerfelpunkte_animieren = true

func wuerfelpunkte_animieren():
	var wuefelannzeige1	: String = ""
	var wuefelzahl1		: int = 1
	var wuefelannzeige2	: String = ""
	var wuefelzahl2		: int = 1
	
	while not stop_wuerfelpunkte_animieren:
		wuefelzahl1 = randi()%6+1
		wuefelannzeige1 = str(wuefelzahl1)
		wuefelzahl2 = randi()%6+1
		wuefelannzeige2 = str(wuefelzahl2)
		$Wuerfel_Control/Wuerfel/W1/W.play(wuefelannzeige1)
		$Wuerfel_Control/Wuerfel/W2/W.play(wuefelannzeige2)
		yield(get_tree().create_timer(0.5),"timeout")
	stop_wuerfelpunkte_animieren = false


