extends CanvasLayer

# Use this game API key if you want to test it with a functioning leaderboard
# "987dbd0b9e5eb3749072acc47a210996eea9feb0"
var game_API_key = "dev_24ca5c7259174be2b695689fc9a233e4"
var development_mode = false
var leaderboard_key = "21583"
var session_token = ""
var player_ID = ""

# HTTP Request node can only handle one call per node
var auth_http = HTTPRequest.new()
var leaderboard_http = HTTPRequest.new()
var submit_score_http = HTTPRequest.new()
var set_name_http = HTTPRequest.new()
var get_name_http = HTTPRequest.new()

func _ready():
	_authentication_request()

func change_player_name():
	#print("Changing player name")
	
	# use this variable for setting the name of the player
	var player_name = $"Leaderboard Text/Name Entry".text
	
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
	
func _on_player_set_name_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	#print(json)
	set_name_http.queue_free()

func _get_player_name():
	#print("Getting player name")
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

	
func _on_player_get_name_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	#print(json)
	# Print player name
	#print(json.name)

func _authentication_request():
	# Check if a player session has been saved
	var player_session_exists = false
	var player_identifier = player_ID
	"""var file = FileAccess.open("user://LootLocker.data", FileAccess.READ)
	player_identifier = file.get_as_text()
	file.close()"""
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
	auth_http.request_completed.connect(self._on_authentication_request_completed)
	# Send request
	#auth_http.request("https://api.lootlocker.io/game/v2/session/guest", headers, true, HTTPClient.METHOD_POST, to_json(data))
	var error = auth_http.request("https://api.lootlocker.io/game/v2/session/guest", headers, HTTPClient.METHOD_POST, JSON.stringify(data))
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	# Print what we're sending, for debugging purposes:
	#print(data)


func _on_authentication_request_completed(result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if json == null:
		pass
	elif json.success:
		player_ID = json.player_identifier
		session_token = json.session_token
	
	"""var json = JSON.parse_string(body.get_string_from_utf8())
	if json.success:
		# Save player_identifier to file
		var file = FileAccess.open("user://LootLocker.data", FileAccess.WRITE)
		file.store_string(json.player_identifier)
		file.close()
	
		# Save session_token to memory
		session_token = json.session_token
	
	# Print server response
	print(json)"""
	
	# Clear node
	auth_http.queue_free()
	# Get leaderboards
	_get_leaderboards()
	#_get_player_name()


func _get_leaderboards():
	#print("Getting leaderboards")
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


func _on_leaderboard_request_completed(result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	#print(json)
	
	if "items" in json:
		# Formatting as a leaderboard
		var leaderboardFormatted = ""
		for n in json.items.size():
			leaderboardFormatted += str(json.items[n].rank)+str(". ")
			if json.items[n].player.name == "":
				leaderboardFormatted += str(json.items[n].player.id)+str(" - ")
			else:
				leaderboardFormatted += str(json.items[n].player.name)+str(" - ")
			leaderboardFormatted += str(json.items[n].score)+str("\n")
		
		# Print the formatted leaderboard to the console
		#print(leaderboardFormatted)
		$"Leaderboard Text".text = leaderboardFormatted
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
	#print(data)


func _on_upload_score_request_completed(result, _response_code, _headers, body) :
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Print data
	#print(json)
	
	# Clear node
	submit_score_http.queue_free()
