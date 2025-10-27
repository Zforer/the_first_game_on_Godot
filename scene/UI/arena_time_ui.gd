extends CanvasLayer


@export var arena_tipe_manager: Node
@onready var lable = %Label


func _process(delta):
	if arena_tipe_manager == null:
		return
	
	var time_elapsed = arena_tipe_manager.get_time_elapsed()
	lable.text = format_timer(time_elapsed)
	
	
	
func format_timer(seconds: float):
	var minuts = int(seconds/60)
	var remaining_seconds = seconds - (minuts * 60)
	return 'Time:wwww ' + str(minuts) + ":" + "%02d" % int(remaining_seconds)
