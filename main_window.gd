extends Control

var wishlist_text = ":foxwow:"
var demo_text = ":fox+1:"
var interesting_text = ":foxhmmm:"
var garbage_text = ":trash:"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_copy_to_clipboard_pressed():
	if len($Panel/MarginContainer/VBoxContainer/Name/LineEdit.text) <= 0:
		DisplayServer.clipboard_set("clipboard app: Invalid name")
		return
	if len($Panel/MarginContainer/VBoxContainer/Link/LineEdit.text) <= 0:
		DisplayServer.clipboard_set("clipboard app: Invalid link")
		return
	var string_lines = []
	string_lines.append("**"+$Panel/MarginContainer/VBoxContainer/Name/LineEdit.text+"**")
	var new_element = get_rating()
	if new_element != null:
		string_lines.append(new_element)
	if $Panel/MarginContainer/VBoxContainer/DemoAvailable/CheckBox.button_pressed:
		string_lines.append("Demo Available: "+ demo_text)
	string_lines.append($Panel/MarginContainer/VBoxContainer/Link/LineEdit.text)
	DisplayServer.clipboard_set('\n'.join(string_lines))

func get_rating():
	var menu :Label = $Panel/MarginContainer/VBoxContainer/RatingPanel/Label
	var text = menu.text
	print(text)
	var rating = null
	if text ==  "Garbage":
		rating = "Rating: " + text + " "+ garbage_text
	elif text == "Wishlisted":
		rating =  "Rating: " + text + " "+ wishlist_text
	elif text == "Interesting":
		rating =  "Rating: " + text + " "+ interesting_text
	return rating

func _on_rating_id_pressed(id):
	var menu = $Panel/MarginContainer/VBoxContainer/RatingPanel/MenuBar/Rating
	$Panel/MarginContainer/VBoxContainer/RatingPanel/Label.text = menu.get_item_text(id)
