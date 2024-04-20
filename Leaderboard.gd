extends CanvasLayer

# intended use is to have the following objects as children
# name entry "line edit"     with the Name Entry script attached
# submit score "button"      with the Submit     script attached
# a visibility toggle button with the Display    script attached

# Use this game API key if you want to test it with a functioning leaderboard
# "987dbd0b9e5eb3749072acc47a210996eea9feb0"
var game_API_key = "dev_24ca5c7259174be2b695689fc9a233e4"
var development_mode = false
var leaderboard_key = "21583"
var session_token = ""
var player_identifier = ""
var usersettings

# HTTP Request node can only handle one call per node
var auth_http = HTTPRequest.new()
var leaderboard_http = HTTPRequest.new()
var submit_score_http = HTTPRequest.new()
var set_name_http = HTTPRequest.new()
var get_name_http = HTTPRequest.new()

func _ready():
	usersettings = get_node("/root/UserSettings")
	_authentication_request()

func change_player_name():
	if development_mode: print("Changing player name")
	
	# use this variable for setting the name of the player
	var player_name = %"Name Entry".text
	
	var data = { "name": str(player_name) }
	var url =  "https://api.lootlocker.io/game/player/name"
	var headers = ["Content-Type: application/json", "x-session-token:"+session_token]
	
	# Create a request node for getting the highscore
	set_name_http = HTTPRequest.new()
	add_child(set_name_http)
	set_name_http.request_completed.connect(self._on_player_set_name_request_completed)
	# Send request
	#set_name_http.request(url, headers, true, HTTPClient.METHOD_PATCH, to_json(data))
	var error = set_name_http.request(url, headers, HTTPClient.METHOD_PATCH, JSON.stringify(data))
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	
func _on_player_set_name_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	if development_mode: print("set name result: ", json)
	set_name_http.queue_free()

func _get_player_name():
	if development_mode: print("Getting player name")
	var url = "https://api.lootlocker.io/game/player/name"
	var headers = ["Content-Type: application/json", "x-session-token:"+session_token]
	
	# Create a request node for getting the highscore
	get_name_http = HTTPRequest.new()
	add_child(get_name_http)
	get_name_http.request_completed.connect(self._on_player_get_name_request_completed)
	# Send request
	#get_name_http.request(url, headers, true, HTTPClient.METHOD_GET, "")
	var error = get_name_http.request(url, headers, HTTPClient.METHOD_GET, "")
	if error != OK:
		push_error("An error occurred in the HTTP request.")

	
func _on_player_get_name_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	if development_mode: print("get name result: ", json)
	# Print player name
	if development_mode: print("got name: ", json.name)
	_get_leaderboards()

func _authentication_request():
	# Check if a player session has been saved
	var player_session_exists = false
	player_identifier = usersettings.player_leaderboard_ID
	if(player_identifier.length() > 1):
		player_session_exists = true
		
	## Convert data to json string:
	var data = { "game_key": game_API_key, "game_version": "0.0.0.1", "development_mode": development_mode }
	
	# If a player session already exists, send with the player identifier
	if(player_session_exists == true):
		data = { "game_key": game_API_key, "player_identifier":player_identifier, "game_version": "0.0.0.1", "development_mode": true }
	
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	
	# Create a HTTPRequest node for authentication
	auth_http = HTTPRequest.new()
	add_child(auth_http)
	#auth_http.connect("request_completed", self, "_on_authentication_request_completed")
	auth_http.request_completed.connect(_on_authentication_request_completed)
	# Send request
	#auth_http.request("https://api.lootlocker.io/game/v2/session/guest", headers, true, HTTPClient.METHOD_POST, to_json(data))
	var error = auth_http.request("https://api.lootlocker.io/game/v2/session/guest", headers, HTTPClient.METHOD_POST, JSON.stringify(data))
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	# Print what we're sending, for debugging purposes:
	if development_mode: print("auth sent data", data)


func _on_authentication_request_completed(_result, _response_code, _headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var unpacked_data = json.get_data()
	
	# Save the player_identifier
	usersettings.player_leaderboard_ID = unpacked_data.player_identifier
	
	# Save session_token to memory
	session_token = unpacked_data.session_token
	
	# Print server response
	if development_mode: print("auth complete data", unpacked_data)
	
	# Clear node
	auth_http.queue_free()
	# Get leaderboards
	#_get_leaderboards()


func _get_leaderboards():
	if development_mode: print("Getting leaderboards")
	var url = "https://api.lootlocker.io/game/leaderboards/"+leaderboard_key+"/list?count=10"
	var headers = ["Content-Type: application/json", "x-session-token:"+session_token]
	
	# Create a request node for getting the highscore
	leaderboard_http = HTTPRequest.new()
	add_child(leaderboard_http)
	leaderboard_http.request_completed.connect(self._on_leaderboard_request_completed)
	#leaderboard_http.connect("request_completed", self, "_on_leaderboard_request_completed")
	# Send request
	#leaderboard_http.request(url, headers, true, HTTPClient.METHOD_GET, "")
	var error = leaderboard_http.request(url, headers, HTTPClient.METHOD_GET, "")
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func _on_leaderboard_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	if development_mode: print("leaderboard data: ", json)
	
	if "items" in json:
		# Formatting as a leaderboard
		var leaderboardFormatted = ""
		if json.items != null:
			for n in json.items.size():
				leaderboardFormatted += str(json.items[n].rank)+str(". ")
				if json.items[n].player.name == "":
					leaderboardFormatted += str(json.items[n].player.id)+str(" - ")
				else:
					leaderboardFormatted += str(json.items[n].player.name)+str(" - ")
				leaderboardFormatted += str(json.items[n].score)+str("\n")
		
		# Print the formatted leaderboard to the console
		if development_mode: print("formatted leaderboard data\n", leaderboardFormatted)
		%"Leaderboard Text".text = leaderboardFormatted
	# Clear node
	leaderboard_http.queue_free()


func _upload_score(U_score):
	var data = { "score": str(U_score) }
	var headers = ["Content-Type: application/json", "x-session-token:"+session_token]
	submit_score_http = HTTPRequest.new()
	add_child(submit_score_http)
	#submit_score_http.connect("request_completed", self, "_on_upload_score_request_completed")
	submit_score_http.request_completed.connect(self._on_upload_score_request_completed)
	# Send request
	#submit_score_http.request("https://api.lootlocker.io/game/leaderboards/"+leaderboard_key+"/submit", headers, true, HTTPClient.METHOD_POST, to_json(data))
	var error = submit_score_http.request("https://api.lootlocker.io/game/leaderboards/"+leaderboard_key+"/submit", headers, HTTPClient.METHOD_POST, JSON.stringify(data))
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	# Print what we're sending, for debugging purposes:
	if development_mode: print("upload data: ", data)


func _on_upload_score_request_completed(_result, _response_code, _headers, body) :
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	if development_mode: print("score upload complete: ", json)
	
	# Clear node
	submit_score_http.queue_free()
	_get_leaderboards()
