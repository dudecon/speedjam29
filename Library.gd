extends Sprite2D

var THEMES = {
	"👨": ["🌱", "🌼", "🌿", "🍅", "🌷", "🏡", "👒"],  # Farmer
	"👵": ["🥘", "🍲", "🥧", "🍳", "🍴", "🔪"],  # Chef
	"🧳": ["🌍", "🚢", "✈", "🚂", "🏖", "🗺", "🧳"],  # Travel
	"💬": ["📚", "🔖", "👂", "👴", "🧒", "🔥", "🌙"],  # Conversation
	"🐕": ["🐶", "🐱", "🐟", "🦜", "🐾", "🪴", "🍖"],  # Dog
	"🎼": ["🎵", "🎶", "🎻", "🎹", "🎷", "📻"],  # Music
	"🏫": ["📖", "📐", "🖍", "🧮", "👨", "🎓"],  # School
	"🌾": ["🚜", "🌻", "🏡", "🐔", "👨", "🌿", "🍞"],  # Rural Life
	"📚": ["🔍", "📖", "🕯", "👓", "🧐", "📜", "🔖"],  # Library and Reading
	"👻": ["🌌", "🕯", "🌑", "👣", "💀", "🔮", "🕳"],  # Ghosts and Supernatural
	"🧙": ["🔮", "📜", "🕯", "🪄", "🍯", "📿", "🌟"],  # Magic and Witchcraft
	"🔍": ["🕵", "🧩", "🗺", "📜", "📦", "🖋", "📑", "📜", "🕵", "📑", "📁", "🔎", "🗂", "🧾"],  # Mystery and Investigation
	"🌲": ["🏞", "🌲", "🌳", "🦌", "🐦", "🛤", "🍄"],  # Forest and Nature
	"👴": ["🕰", "🎩", "🚬", "🛋", "👔", "🖼", "☕", "🩸"],  # The Old Man Himself
	"🏡": ["🏠", "🌳", "🏘", "🏚", "🏠", "🏰", "🏥"],  # Home and Residence
	"🏚": ["🚪", "🏚", "🌑", "🍂", "🕸", "🔪", "🧱"],  # Abandoned Places
	"👩": ["🍳", "🥘", "🍲", "🔪", "🍴", "🥧"],  # Female Chef
	"🐶": ["🦴", "🐾", "🐕", "🛁", "🐱", "🥩", "🩸", "🎾"],  # Pet Dog
	"👓": ["📚", "🔍", "👀", "🧐", "🕶", "📖", "👴"],  # Glasses
	"🕯": ["👻", "🔮", "🌌", "🕳", "🌑", "📚", "💡"],  # Candle
	"🌻": ["🌾", "🌼", "🌞", "🏞", "🐝", "🌱", "🌸"],  # Sunflower
	"🔪": ["👨", "👩", "🍴", "🍖", "🥩", "🍲", "💀", "🩸", "🥘"],  # Knife
	"📖": ["📚", "🔖", "📑", "📒", "📕", "🔍", "🧐"],  # Book
	"🔖": ["📖", "📚", "📒", "📕", "📔", "📑", "📘"],  # Bookmark
	"🎻": ["🎼", "🎵", "🎶", "🎹", "🎸", "📻", "🎷"],  # Violin
	"👣": ["🔍", "👻", "🌑", "🕳", "👥", "🏞", "🌲"],  # Footprints
	"🕳": ["👻", "🌑", "🕯", "👣", "💀", "🔮", "🏚"],   # Hole
	"🎉": ["🎊", "🥳", "🎈", "🍰", "🎂", "🎁", "🎠"],  # Celebrations and Parties
	"🔦": ["🕯", "💡", "🌙", "⛺", "🌌", "🌒", "🏕"],  # Light and Exploration
	"🎤": ["🎧", "🎼", "🎵", "🎶", "📻", "🎹", "🎷"],  # Music and Performance
	"👹": ["👺", "🎭", "👻", "🔮", "🧙", "💀", "🩸", "🕷"],  # Demons and Monsters
	"🎠": ["🎡", "🎢", "🏰", "🌉", "🗽", "🎪", "🌆"],  # Carnivals and Fairs
	"👾": ["🕳", "🌌", "🚀", "👹", "🔮", "💀", "🌏", "🌑"],  # Eldritch Horror and Alien Mystery
	"🕵": ["🔍", "👣", "🔦", "🕶", "🧥", "🎩", "🩸", "🔫"],  # Hero/Sleuth and Mystery Solver
	"💀": ["👻", "🕸", "🕷", "👾", "👹", "🩸", "🔪"],  # Symbols of Death and the Macabre
	"✨": ["🌟", "🔮", "💫", "🎇", "🎆", "🧚", "🪄"],  # Magic and Sparkle
	"📜": ["📃", "📄", "🔍", "🖋", "📑", "📚", "🔖", "✨"],  # Ancient Documents and Scrolls
	"🌑": ["🌒", "🕛", "🌘"],  # midnight, darkness
	"🔒": ["🔐", "🔑", "🚪", "🗝", "🔓", "🔏", "🛅"],  # Locks and Security
	"🔐": ["🔒", "🔓", "🔑", "🚪", "🗝", "🔏", "🛅"],  # Secured Locks and Privacy
	"🔑": ["🔐", "🔒", "🗝", "🔓", "🚪", "🏡", "🛅"],  # Keys and Unlocking
	"🏕": ["🔥", "🌲", "🌳", "🏞", "🌙", "🛶", "🚣"],  # Camping and Outdoor Adventures
	"✈": ["🌏", "🏞", "🏝", "🏜", "🗺", "🌍"],  # Global Exploration and World Cultures
	"🌧": ["💧", "☔", "🌦", "🌊", "🌬", "🌀", "💨", "❄", "🌨", "☃", "⛄", "🌈"],  # Weather Conditions and Water Elements
	"🚗": ["🚙", "🏎", "🚓", "🚕", "🚜", "🛺", "🚚", "🚛", "🚌", "🚍", "🚐", "🚑", "🚒", "🛵", "🏍", "🚲", "🚨", "🛑", "🚦", "🚥"],  # Various Modes of Road Transport
	"🐮": ["🐕", "🐩", "🦮", "🐕", "🐾", "🦴", "🐈", "🐱", "🐹", "🐭", "🐰", "🐇", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"],  # Domestic and Wild Animals
	"🖊": ["📖", "📗", "📘", "📙", "📔", "📒", "📕", "📓", "📃", "📜", "📄", "📰", "🗞", "🔖", "🏷", "✏", "🖋", "🖊", "🖌"],  # Items Related to Reading, Writing, and Publishing
	"🍕": ["🍔", "🍟", "🌭", "🌮", "🌯", "🥪", "🥙", "🧆", "🍝", "🍜", "🍣", "🍤", "🍦", "🍰", "🧁", "🍩", "🍪", "🍫", "🍬", "🍭"],  # Variety of Foods and Sweets
	"🏥": ["🚑", "💉", "💊", "🔬", "🩺", "🩹", "🩼", "🦽", "🦼", "🚽", "🚿", "🛁", "🛋", "🛏", "🖼", "🏨", "🏬", "🏢", "🏛"],  # Medical and Healthcare Facilities and Tools
	"🏞": ["🌳", "🌲", "🌴", "🌵", "🌾", "🌿", "☘", "🍀", "🍁", "🍂", "🍃", "🌺", "🌻", "🌹", "🌷", "🌼", "🌸", "💐", "🍄"],  # Natural Landscapes and Flora
	"🎓": ["🏫", "📚", "📖", "📘", "🖋", "🖊", "🔬", "📐", "📏", "✏", "👩", "👨", "👩", "👨", "📒", "📔", "📓", "📗", "🚸"],  # Education, Graduation, and School Activities
	"🌍": ["✈", "🚢", "🌏", "🌎", "🌐", "🗺", "🧭", "⛰", "🏝", "🏖", "🗿", "🗽", "🗼", "🏰", "🏯", "🏟", "🕌", "🕍", "⛪"],  # Worldwide Travel and Global Landmarks
	"⏰": ["🕰", "🕛", "🕧", "🕐", "🕜", "🕑", "🕝", "🕒", "🕞", "🕓", "🕟", "🕔", "🕠", "🕕", "🕡", "🕖", "🕢", "🕗", "🕣", "🕘"],  # Timekeeping Devices and Times of Day
	"🎭": ["🎨", "🎬", "🎤", "🎻", "🎹", "🎶", "🎷", "🎨", "🖼", "🎬", "📽", "🎥", "🎤", "🎧", "🎼", "🎹", "🎷", "🎺", "🎸", "🪕", "🥁", "🎻", "🎲", "🎮", "🎰", "🃏"],  # The Arts, Entertainment, and Creative Expression
}

var total_books
var all_books = []
var visible_books = []
var invisible_books = []
var used_themes = []
var available_themes = []


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("library ready")
	total_books = 0
	for shelf in get_children():
		total_books += shelf.get_child_count()
	#_set_book_visibility()
	#print("num available ",len(available_themes))
	#print("num used ",len(used_themes))
	# 54 themes print(len(THEMES))
	"""for s in THEMES.keys():
		if len(s) != 1:
			print("invalid key")
			for c in s:
				print(c)
		for e in THEMES[s]:
			if len(e) != 1:
				print("invalid value for key", s)
				for c in e:
					print(c)"""

func _set_book_visibility(books_modifier):
	var num_books = len(all_books)
	var target_visible = num_books + books_modifier
	if num_books != len(visible_books) + len(invisible_books):
		visible_books = all_books.duplicate()
	if target_visible < 0:
		target_visible = 0#randi_range(100,200)
	elif target_visible > num_books:
		target_visible = num_books
	var num_books_visible = len(visible_books)
	var book
	if target_visible > num_books_visible:
		for i in range(target_visible - num_books_visible):
			var j = randi_range(0,len(invisible_books)-1)
			book = invisible_books.pop_at(j)
			book.visible = true
			visible_books.append(book)
	elif target_visible < num_books_visible:
		for i in range( num_books_visible - target_visible):
			var j = randi_range(0,len(visible_books)-1)
			book = visible_books.pop_at(j)
			book.visible = false
			invisible_books.append(book)
	#print(len(visible_books))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

