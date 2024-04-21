extends Button

var booklist
var this_ID
var title
var contents
var times_read
var times_studied
var spine_y
var spine_color
var inside_texture

var THEMES = {
	"👨": ["🌱", "🌼", "🌿", "🍅", "🌷", "🏡", "👒"],  # Farmer
	"👵": ["🥘", "🍲", "🥧", "🍳", "🍴", "🔪"],  # Chef
	"🧳": ["🌍", "🚢", "✈️", "🚂", "🏖️", "🗺️", "🧳"],  # Travel
	"💬": ["📚", "🔖", "👂", "👴", "🧒", "🔥", "🌙"],  # Conversation
	"🐕": ["🐶", "🐱", "🐟", "🦜", "🐾", "🪴", "🍖"],  # Dog
	"🎼": ["🎵", "🎶", "🎻", "🎹", "🎷", "📻"],  # Music
	"🏫": ["📖", "📐", "🖍️", "🧮", "👨‍🏫", "🎓"],  # School
	"🌾": ["🚜", "🌻", "🏡", "🐔", "👨‍🌾", "🌿", "🍞"],  # Rural Life
	"📚": ["🔍", "📖", "🕯️", "👓", "🧐", "📜", "🔖"],  # Library and Reading
	"👻": ["🌌", "🕯️", "🌑", "👣", "💀", "🔮", "🕳️"],  # Ghosts and Supernatural
	"🧙": ["🔮", "📜", "🕯️", "🪄", "🍯", "📿", "🌟"],  # Magic and Witchcraft
	"🔍": ["🕵️", "🧩", "🗺️", "📜", "📦", "🖋️", "📑", "📜", "🕵️", "📑", "📁", "🔎", "🗂️", "🧾"],  # Mystery and Investigation
	"🌲": ["🏞️", "🌲", "🌳", "🦌", "🐦", "🛤️", "🍄"],  # Forest and Nature
	"👴": ["🕰️", "🎩", "🚬", "🛋️", "👔", "🖼️", "☕", "🩸"],  # The Old Man Himself
	"🏡": ["🏠", "🌳", "🏘️", "🏚️", "🏠", "🏰", "🏥"],  # Home and Residence
	"🏚": ["🚪", "🏚️", "🌑", "🍂", "🕸️", "🔪", "🧱"],  # Abandoned Places
	"👩": ["🍳", "🥘", "🍲", "🔪", "🍴", "🥧"],  # Female Chef
	"🐶": ["🦴", "🐾", "🐕", "🛁", "🐱", "🥩", "🩸", "🎾"],  # Pet Dog
	"👓": ["📚", "🔍", "👀", "🧐", "🕶", "📖", "👴"],  # Glasses
	"🕯": ["👻", "🔮", "🌌", "🕳️", "🌑", "📚", "💡"],  # Candle
	"🌻": ["🌾", "🌼", "🌞", "🏞️", "🐝", "🌱", "🌸"],  # Sunflower
	"🔪": ["👨‍🍳", "👩‍🍳", "🍴", "🍖", "🥩", "🍲", "💀", "🩸", "🥘"],  # Knife
	"📖": ["📚", "🔖", "📑", "📒", "📕", "🔍", "🧐"],  # Book
	"🔖": ["📖", "📚", "📒", "📕", "📔", "📑", "📘"],  # Bookmark
	"🎻": ["🎼", "🎵", "🎶", "🎹", "🎸", "📻", "🎷"],  # Violin
	"👣": ["🔍", "👻", "🌑", "🕳️", "👥", "🏞️", "🌲"],  # Footprints
	"🕳": ["👻", "🌑", "🕯️", "👣", "💀", "🔮", "🏚️"],   # Hole
	"🎉": ["🎊", "🥳", "🎈", "🍰", "🎂", "🎁", "🎠"],  # Celebrations and Parties
	"🔦": ["🕯️", "💡", "🌙", "⛺", "🌌", "🌒", "🏕️"],  # Light and Exploration
	"🎤": ["🎧", "🎼", "🎵", "🎶", "📻", "🎹", "🎷"],  # Music and Performance
	"👹": ["👺", "🎭", "👻", "🔮", "🧙", "💀", "🩸", "🕷️"],  # Demons and Monsters
	"🎠": ["🎡", "🎢", "🏰", "🌉", "🗽", "🎪", "🌆"],  # Carnivals and Fairs
	"👾": ["🕳️", "🌌", "🚀", "👹", "🔮", "💀", "🌏", "🌑"],  # Eldritch Horror and Alien Mystery
	"🕵": ["🔍", "👣", "🔦", "🕶", "🧥", "🎩", "🩸", "🔫"],  # Hero/Sleuth and Mystery Solver
	"💀": ["👻", "🕸️", "🕷️", "👾", "👹", "🩸", "🔪"],  # Symbols of Death and the Macabre
	"✨": ["🌟", "🔮", "💫", "🎇", "🎆", "🧚", "🪄"],  # Magic and Sparkle
	"📜": ["📃", "📄", "🔍", "🖋", "📑", "📚", "🔖", "✨"],  # Ancient Documents and Scrolls
	"🌑": ["🌒", "🕛", "🌘"],  # midnight, darkness
	"🔒": ["🔐", "🔑", "🚪", "🗝️", "🔓", "🔏", "🛅"],  # Locks and Security
	"🔐": ["🔒", "🔓", "🔑", "🚪", "🗝️", "🔏", "🛅"],  # Secured Locks and Privacy
	"🔑": ["🔐", "🔒", "🗝️", "🔓", "🚪", "🏡", "🛅"],  # Keys and Unlocking
	"🏕": ["🔥", "🌲", "🌳", "🏞️", "🌙", "🛶", "🚣"],  # Camping and Outdoor Adventures
	"✈": ["🌏", "🏞️", "🏝️", "🏜️", "🗺️", "🌍"],  # Global Exploration and World Cultures
	"🌧": ["💧", "☔", "🌦️", "🌊", "🌬️", "🌀", "💨", "❄️", "🌨️", "☃️", "⛄", "🌈"],  # Weather Conditions and Water Elements
	"🚗": ["🚙", "🏎️", "🚓", "🚕", "🚜", "🛺", "🚚", "🚛", "🚌", "🚍", "🚐", "🚑", "🚒", "🛵", "🏍️", "🚲", "🚨", "🛑", "🚦", "🚥"],  # Various Modes of Road Transport
	"🐮": ["🐕", "🐩", "🦮", "🐕‍🦺", "🐾", "🦴", "🐈", "🐱", "🐹", "🐭", "🐰", "🐇", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"],  # Domestic and Wild Animals
	"🖊": ["📖", "📗", "📘", "📙", "📔", "📒", "📕", "📓", "📃", "📜", "📄", "📰", "🗞", "🔖", "🏷️", "✏️", "🖋", "🖊", "🖌️"],  # Items Related to Reading, Writing, and Publishing
	"🍕": ["🍔", "🍟", "🌭", "🌮", "🌯", "🥪", "🥙", "🧆", "🍝", "🍜", "🍣", "🍤", "🍦", "🍰", "🧁", "🍩", "🍪", "🍫", "🍬", "🍭"],  # Variety of Foods and Sweets
	"🏥": ["🚑", "💉", "💊", "🔬", "🩺", "🩹", "🩼", "🦽", "🦼", "🚽", "🚿", "🛁", "🛋️", "🛏️", "🖼️", "🏨", "🏬", "🏢", "🏛️"],  # Medical and Healthcare Facilities and Tools
	"🏞": ["🌳", "🌲", "🌴", "🌵", "🌾", "🌿", "☘️", "🍀", "🍁", "🍂", "🍃", "🌺", "🌻", "🌹", "🌷", "🌼", "🌸", "💐", "🍄"],  # Natural Landscapes and Flora
	"🎓": ["🏫", "📚", "📖", "📘", "🖋️", "🖊️", "🔬", "📐", "📏", "✏️", "👩‍🎓", "👨‍🎓", "👩‍🏫", "👨‍🏫", "📒", "📔", "📓", "📗", "🚸"],  # Education, Graduation, and School Activities
	"🌍": ["✈️", "🚢", "🌏", "🌎", "🌐", "🗺️", "🧭", "⛰️", "🏝️", "🏖️", "🗿", "🗽", "🗼", "🏰", "🏯", "🏟️", "🕌", "🕍", "⛪"],  # Worldwide Travel and Global Landmarks
	"⏰": ["🕰️", "🕛", "🕧", "🕐", "🕜", "🕑", "🕝", "🕒", "🕞", "🕓", "🕟", "🕔", "🕠", "🕕", "🕡", "🕖", "🕢", "🕗", "🕣", "🕘"],  # Timekeeping Devices and Times of Day
	"🎭": ["🎨", "🎬", "🎤", "🎻", "🎹", "🎶", "🎷", "🎨", "🖼️", "🎬", "📽️", "🎥", "🎤", "🎧", "🎼", "🎹", "🎷", "🎺", "🎸", "🪕", "🥁", "🎻", "🎲", "🎮", "🎰", "🃏"],  # The Arts, Entertainment, and Creative Expression
}

func title_gen():
	var num_chars = [1,1,2,2,2,2,2,3,3,4,5].pick_random()
	var gtitle = ""
	for i in num_chars:
		gtitle = gtitle + THEMES.keys().pick_random()
	return gtitle


func content_gen():
	var num_chaps = [1,3,3,3,4,4,5,5,6].pick_random()
	var content = ""
	var titlechars = []
	for c in title:
		titlechars.append(c)
	for i in num_chaps:
		var num_chars = [2,2,3,3,4,4,4,5,5,5,5,6,6,6,6,7,7,8,8,9,10].pick_random()
		for j in num_chars:
			content = content + THEMES[titlechars.pick_random()].pick_random()
		content = content + "\n"
	return content


# Called when the node enters the scene tree for the first time.
func _ready():
	booklist = %Library.all_books
	this_ID = len(booklist)
	booklist.append($".")
	title = ""
	contents = ""
	times_read = 0
	times_studied = 0
	$".".visible = false
	modulate[3] = 0.4
	inside_texture = 0
	if len(booklist) == 394:
		%Library._set_book_visibility(394)
	"""for s in THEMES.keys():
		if len(s) != 1:
			for c in s:
				print(c)"""

func _read_the_book():
	if times_read == 0:
		%"book count label"._update_count(1)
	modulate = Color(0,1,0,.8)
	if times_studied == 0:
		contents = content_gen()
	%BookOpener._open_book(contents)
	times_read += 1

func _study_book_contents():
	times_studied += 1
	

func _on_pressed():
	if %BookSpines.book_bind == $".":
		_read_the_book()
	elif times_read == 0:
		spine_y = %BookSpines.yvals.pick_random()
		spine_color = Color(randf_range(.5,1),randf_range(.5,1),randf_range(.5,1))
		title = title_gen()
		%BookSpines._set_spine(spine_y, spine_color, title, $".")
	else:
		%BookSpines._set_spine(spine_y, spine_color, title, $".")
	
	
