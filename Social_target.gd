extends Button

var npc_social_brain = {}
var npc_active_thought = ""
var rng = RandomNumberGenerator.new()

var thoughts_exposed = false


var countdown

var npc_social_content = {
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
	"🏡": ["🏠", "🌳", "🏘", "🏚", "🏠", "🏰", "🏥"],  # Home and Residence
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


# Called when the node enters the scene tree for the first time.
func _ready():
	# print(name)
	countdown = rng.randi_range(1,5)
	
	for i in range(3):
		var new_topic = npc_social_content.keys().pick_random()
		npc_social_brain[new_topic] = npc_social_content[new_topic]
	#print(npc_social_brain)
	
	# name is used as the key for the social dictionary
	pass # Replace with function body.
	
func generate_thought():
	return npc_social_brain[npc_social_brain.keys().pick_random()].pick_random()


func _toggled(toggled_on):
	thoughts_exposed = toggled_on


func _pressed():
	if len(npc_active_thought) and thoughts_exposed:
		_store_thought()


func _store_thought():
	$".".owner._add_to_conversation(npc_active_thought, $".", 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countdown -= delta
	if countdown < 0:
		countdown = rng.randi_range(1,5)
		npc_active_thought = generate_thought()
		if thoughts_exposed:
			_store_thought()
	if thoughts_exposed:
		text = npc_active_thought
	else:
		text = ''
	pass

