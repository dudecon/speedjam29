import random

# Define potential themes and their corresponding emojis

themes = {
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
    "🔍": ["🕵️", "🧩", "🗺️", "📜", "📦", "🖋️", "📑"],  # Mystery and Investigation
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
    "🎓": ["🏫", "👨‍🏫", "📚", "🧮", "🖍️", "📖", "📐"],  # Graduation Cap
    "🎻": ["🎼", "🎵", "🎶", "🎹", "🎸", "📻", "🎷"],  # Violin
    "👣": ["🔍", "👻", "🌑", "🕳️", "👥", "🏞️", "🌲"],  # Footprints
    "🕳": ["👻", "🌑", "🕯️", "👣", "💀", "🔮", "🏚️"],   # Hole
    "🎉": ["🎊", "🥳", "🎈", "🍰", "🎂", "🎁", "🎠"],  # Celebrations and Parties
    "🔦": ["🕯️", "💡", "🌙", "⛺", "🌌", "🌒", "🏕️"],  # Light and Exploration
    "🎤": ["🎧", "🎼", "🎵", "🎶", "📻", "🎹", "🎷"],  # Music and Performance
    "👹": ["👺", "🎭", "👻", "🔮", "🧙", "💀", "🩸", "🕷️"],  # Demons and Monsters
    "🎠": ["🎡", "🎢", "🏰", "🌉", "🗽", "🎪", "🌆"],  # Carnivals and Fairs
    "🔍": ["📜", "🕵️", "📑", "📁", "🔎", "🗂️", "🧾"],  # Investigation and Discovery
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
    "🌍": ["🌏", "🏞️", "🏝️", "🏜️", "🗺️", "✈️"],  # Global Exploration and World Cultures
    "🌧": ["💧", "☔", "🌦️", "🌊", "🌬️", "🌀", "💨", "❄️", "🌨️", "☃️", "⛄", "🌈"],  # Weather Conditions and Water Elements
    "🚗": ["🚙", "🏎️", "🚓", "🚕", "🚜", "🛺", "🚚", "🚛", "🚌", "🚍", "🚐", "🚑", "🚒", "🛵", "🏍️", "🚲", "🚨", "🛑", "🚦", "🚥"],  # Various Modes of Road Transport
    "🐶": ["🐕", "🐩", "🦮", "🐕‍🦺", "🐾", "🦴", "🐈", "🐱", "🐹", "🐭", "🐰", "🐇", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"],  # Domestic and Wild Animals
    "📚": ["📖", "📗", "📘", "📙", "📔", "📒", "📕", "📓", "📃", "📜", "📄", "📰", "🗞️", "🔖", "🏷️", "✏️", "🖋️", "🖊️", "🖌️"],  # Items Related to Reading, Writing, and Publishing
    "🍕": ["🍔", "🍟", "🌭", "🌮", "🌯", "🥪", "🥙", "🧆", "🍝", "🍜", "🍣", "🍤", "🍦", "🍰", "🧁", "🍩", "🍪", "🍫", "🍬", "🍭"],  # Variety of Foods and Sweets
    "🏥": ["🚑", "💉", "💊", "🔬", "🩺", "🩹", "🩼", "🦽", "🦼", "🚽", "🚿", "🛁", "🛋️", "🛏️", "🖼️", "🏨", "🏬", "🏢", "🏛️"],  # Medical and Healthcare Facilities and Tools
    "🏞": ["🌳", "🌲", "🌴", "🌵", "🌾", "🌿", "☘️", "🍀", "🍁", "🍂", "🍃", "🌺", "🌻", "🌹", "🌷", "🌼", "🌸", "💐", "🍄"],  # Natural Landscapes and Flora
    "🎓": ["🏫", "📚", "📖", "📘", "🖋️", "🖊️", "🔬", "📐", "📏", "✏️", "👩‍🎓", "👨‍🎓", "👩‍🏫", "👨‍🏫", "📒", "📔", "📓", "📗", "🚸"],  # Education, Graduation, and School Activities
    "🌍": ["✈️", "🚢", "🌏", "🌎", "🌐", "🗺️", "🧭", "⛰️", "🏝️", "🏖️", "🗿", "🗽", "🗼", "🏰", "🏯", "🏟️", "🕌", "🕍", "⛪"],  # Worldwide Travel and Global Landmarks
    "⏰": ["🕰️", "🕛", "🕧", "🕐", "🕜", "🕑", "🕝", "🕒", "🕞", "🕓", "🕟", "🕔", "🕠", "🕕", "🕡", "🕖", "🕢", "🕗", "🕣", "🕘"],  # Timekeeping Devices and Times of Day
    "🎭": ["🎨", "🎬", "🎤", "🎻", "🎹", "🎶", "🎷", "🎨", "🖼️", "🎬", "📽️", "🎥", "🎤", "🎧", "🎼", "🎹", "🎷", "🎺", "🎸", "🪕", "🥁", "🎻", "🎲", "🎮", "🎰", "🃏"],  # The Arts, Entertainment, and Creative Expression
}

feels_people = {
    "😀": ["😃", "😄", "😁", "😆", "🙂", "😉", "😊"],  # General Happiness and Friendliness
    "😢": ["😭", "😿", "🥺", "😪", "😥", "😓", "😞"],  # Sadness and Comfort
    "😠": ["😡", "🤬", "😤", "👿", "💢", "🗯️", "🚫"],  # Anger and Frustration
    "😂": ["🤣", "😹", "😜", "😀", "😄", "😻", "😛"],  # Humor and Laughter
    "😍": ["😘", "😚", "🥰", "💑", "❤️", "💖", "💕"],  # Love and Affection
    "🙄": ["😒", "😑", "😐", "😬", "🤥", "😏", "😶"],  # Skepticism and Annoyance
    "😨": ["😱", "😰", "😳", "😥", "😓", "🥶", "😬"],  # Fear and Worry
    "🤔": ["😕", "😐", "🤨", "😑", "🧐", "🙄", "😶"],  # Curiosity and Confusion
}

class Book:
    def __init__(self, theme_keys=None):
        if theme_keys is None:
            theme_keys = random.choice(list(themes.keys()))

        self.book_themes = theme_keys  # List of emoji keys for the book's theme
        self.chapters = []  # List to hold the chapters
        self.chapter_len = [2,3,3,3,3,3,3,3,3,3,4,5]
        self.generate_book()  # Generate the book content upon initialization

    
    def generate_chapter(self, chapter_theme=None):
        """Generates a single thought/chapter based on the theme."""
        if chapter_theme is None:
            chapter_theme = random.choice(self.book_themes)
        # Select between 3 to 5 emojis from the chosen theme
        item_num = random.choice(self.chapter_len)
        max_num = len(themes[chapter_theme]) 
        if max_num <= item_num:
            item_num = max_num

        chapter = random.sample(themes[chapter_theme], item_num)
        return chapter
    
    def generate_book(self):        
        """Generates 3 to 7 thoughts/chapters for the book."""
        for _ in range(random.randint(3,7)):
            self.chapters.append(self.generate_chapter(random.choice(self.book_themes)))

    def print_book(self):
        print(''.join(self.book_themes) + '\n')
        """Prints all chapters of the book."""
        for chapter in self.chapters:
            print(' '.join(chapter))
        print('\n')

# Example usage
my_book_themes = ["🕳", "🌑"]  # Defining the themes for the book
my_book = Book(my_book_themes)
my_book.print_book()  # Printing the book's content

for i in range(20):
    this_book_theme = random.sample(list(themes.keys()), 2)
    Book(this_book_theme).print_book()



"""
🕳🌑

🌘 🌒 🕛
🌑 🕯️ 🔮
👻 🌑 🔮
🌑 💀 🕯️
🌒 🌘 🕛
🌑 🏚️ 🔮


🍕🌾

🍰 🍫 🧆
🌻 👨‍🌾 🐔 🍞
🌿 🌻 👨‍🌾 🍞
🚜 🌻 👨‍🌾 🏡
🍦 🍫 🧆


🎻🌻

🌼 🏞️ 🐝 🌞
🌾 🐝 🌞 🌱
🏞️ 🌼
📻 🎵 🎷


🌑🌧

🌦️ 🌈 💨
❄️ 🌬️ 🌦️ ☃️ ☔
🌦️ 🌈 💨 ❄️ 🌬️
🌒 🌘 🕛
🌊 ❄️ 💧
🌬️ 🌈 💨


🧙🎤

📻 🎶 🎷
🪄 📿 🔮 🌟
🎶 🎹 🎵


💬👹

🎭 👺 🩸
🧒 👴 🌙 👂
🧒 📚
🧒 🔖


🏕🐶

🐇 🐨 🐯
🌲 🚣 🌙
🐕 🐾 🐨


🎉🎻

🎵 🎷 🎼
🎠 🥳 🎊
🎠 🎂 🍰
🎹 🎼
🎈 🎊 🍰


👴🏥

🛋️ 🖼️ 🚬 👔
👔 🖼️ 🛋️
💉 🏢 🩺 🚽
🦼 🏛️ 🚑
🕰️ 🎩
🩸 🚬 🖼️ 🛋️


📜✨

🎆 💫
🔖 📄 📚 📃
🎆 🧚 🌟 🎇 💫
📑 📄
🧚 🌟 💫
📃 ✨
📃 🖋 🔍


👓🏥

📖 🧐 👀
🩺 🛋️ 🩼
👴 📚 👀
📚 👀 📖


⏰🌍

🕔 🕧 🕝
🕢 🕖
🕗 🕟 🕧


🕵🐶

🔫 🧥 👣
🔫 🕶 🎩 🧥
👣 🩸 🕶
🐯 🦮 🐕 🐻
🐨 🐻 🐩 🐼
🦊 🐮 🐰
🐈 🐾 🐰


🚗🌻

🌼 🌾 🏞️
🚍 🚚 🛺
🌾 🌞 🏞️
🚐 🏎️ 🛵
🌼 🌱 🐝


👣🌲

🏞️ 🦌 🌲 🍄 🐦
👥 🌲 🔍
🐦 🍄 🌳
🐦 🦌


🎭🏚

🍂 🕸️ 🧱
🏚️ 🌑 🔪
🌑 🕸️
🌑 🔪 🚪
🧱 🌑 🕸️


🎼🕵

🔦 🔫 👣
📻 🎵 🎶 🎹
📻 🎷 🎻
🔦 🔍


🌲🏡

🌳 🏠 🏥 🏰 🏘️
🏘️ 🏰 🏥
🌲 🌳 🐦
🏘️ 🏠 🌳
🏰 🏚️ 🏘️
🏠 🏥 🏰


🌧🌾

👨‍🌾 🍞 🌻
⛄ 💨 ☃️
🌊 ⛄ 🌈 ❄️
🌬️ ☃️
🌀 ⛄ ☔
🍞 🐔 👨‍🌾
👨‍🌾 🐔 🌻


🍕🚗

🛵 🚐 🏎️
🍫 🍣 🌯
🍝 🍜 🍣
🌯 🍝 🍤 🍔
🍫 🌮 🍟
🌭 🍝


💬👻

👂 📚 🔖
👴 👂
🔮 💀 🕳️ 🌑
🌙 🔖 📚
🔥 👴 🔖
👣 🕳️ 🕯️


🧳

🏖️ ✈️ 🧳
🏖️ 🚂 🌍
✈️ 🧳 🗺️


🔐

🔑 🛅 🔓 🗝️
🗝️ 🛅
🗝️ 🔒 🔓 🔏
🔏 🚪 🔓 🔒 🛅
🛅 🔏 🔒
🚪 🛅 🔒 🔏 🔓


🕳

🌑 👻 🏚️
🕯️ 👻 🔮 🌑
🕯️ 🌑 💀


🐶

🐕‍🦺 🐕 🦴
🐱 🐾 🐕‍🦺
🐕‍🦺 🐈 🐱
🐰 🐻 🐮 🦁
🐹 🐩 🐇
🐮 🐇 🐕‍🦺
🐕 🐾 🐰


🎼

🎹 🎵
🎹 🎻 🎷
🎷 🎵 📻
🎶 🎷 🎵


✨

🪄 🔮 🌟
🎇 🧚
🌟 🎆 🎇 💫
💫 🔮 🎇
🧚 🪄 🎇
🔮 🧚 🪄 🎆 🎇


🎠

🌉 🎪 🌆 🎡
🗽 🎪 🎢
🎡 🌆 🌉


🐕

🐶 🐱 🪴
🐟 🪴 🐶
🦜 🐱 🐾
🐾 🐶 🦜 🐟 🍖
🦜 🐱 🪴


🏥

🏛️ 🩼 🔬
🦼 🛁 🔬
🩼 🛁 🩹
🦼 🚽 🩹 🩼
🔬 🩹 🚑
🔬 🏬 🦽 🚑 🛁


🌑

🕛 🌘
🕛 🌘 🌒
🌒 🌘 🕛


🔖

📚 📒 📕 📔
📖 📚 📕 📑 📘
📘 📕
📑 📘


🏫

🖍️ 👨‍🏫 🧮 🎓 📐
👨‍🏫 🧮 🖍️
📖 🎓 🧮


📚

📗 🖌️ 🖋️
📔 📓 🏷️ 📰
🔖 📄 🖋️
🖌️ 🖊️ ✏️
📒 📃 📜
✏️ 📜


🔪

💀 🥩 🥘
🩸 💀 🥘
🍲 🩸 🥘 👨‍🍳 🍖
💀 🍴 🍖 🍲
👨‍🍳 💀
👩‍🍳 🍖 🍲 🥩 🍴
🥘 🥩 🍴


⏰

🕝 🕟 🕛 🕡 🕓
🕓 🕒 🕘
🕕 🕡


📖

📚 🔖 📕 📒
🧐 📒
🔍 📒 🧐 📚
🔍 📑 📒
🔍 📒 📑
📕 🔍 📚 📒


👻

🕳️ 💀 🔮
🕳️ 🕯️ 🌑
🕯️ 🕳️ 🌑
🕯️ 🌑 🌌
🌑 👣 🌌
💀 🕳️ 👣 🌑
🔮 💀 🕳️


💀

👻 🕷️ 👾
🕸️ 🩸
👻 🔪
🔪 👹 🩸
👹 🩸 🔪
👹 🔪 🕷️
👹 👻 🩸


🏞

🍁 🌴 🌷
🌳 🌹 🍂
🌵 🌴 🌿 🌼 🍃
🍁 🌻 🌼
🌴 🍃
🌾 🌹 ☘️ 🍂 🌺
🌼 🌵


🔒

🛅 🚪 🔑
🔑 🛅 🗝️ 🔓
🔏 🗝️ 🔓
🔓 🔐 🔏
🔏 🚪 🔓
🔏 🗝️ 🔐 🛅


dict_keys(['👨', '👵', '🧳', '💬', '🐕', '🎼', '🏫', '🌾', '📚', '👻', '🧙', '🔍', '🌲', '👴', '🏡',  '🏚️', '👩', '🐶',
'👓', '🕯️', '🌻', '🔪', '📖', '🔖', '🎓', '🎻', '👣', '🕳', '🎉', '🔦', '🎤', '👹', '🎠', '👾', '🕵   ️', '💀', '✨', '📜', '🌑', '🔒', '🔐', '🔑', '🏕️', '🌍', '🌧', '🚗', '🍕', '🏥', '🏞️', '⏰', '🎭'])

dict_keys(['👨', '👵', '🧳', '💬', '🐕', '🎼', '🏫', '🌾', '📚', '👻', '🧙', '🔍', '🌲', '👴', '🏡',  '🏚️', '👩\u200d',
'🐶', '👓', '🕯️', '🌻', '🔪', '📖', '🔖', '🎓', '🎻', '👣', '🕳', '🎉', '🔦', '🎤', '👹', '🎠', '👾  ', '🕵️', '💀', '✨',
 '📜', '🌑', '🔒', '🔐', '🔑', '🏕️', '🌍', '🌧️', '🚗', '🍕', '🏥', '🏞️', '⏰', '🎭'])
 '🏞'

👾

💀 🌑 🌌 🔮
🔮 👹 🌏 🌌
🌌 🌏 🌑 💀 🕳️



🕳🌑

👣 🔮 🕯️
💀 🏚️ 👻
🕯️ 👣 🌑
👣 🌑 🏚️ 👻 🔮
🕛 🌒 🌘


number to sample: 3
number to sample: 3
max num called and set item_num to 3
number to sample: 5
number to sample: 3
number to sample: 5
max num called and set item_num to 3
number to sample: 5
max num called and set item_num to 3
number to sample: 5
max num called and set item_num to 3
📜🌑

📄 📚 📑
🌘 🌒 🕛
✨ 🔍 🖋 📃 📄
🔍 📚 📄
🌒 🕛 🌘
🌘 🌒 🕛
🌘 🌒 🕛


number to sample: 4
max num called and set item_num to 3
number to sample: 5
max num called and set item_num to 3
number to sample: 5
max num called and set item_num to 3
number to sample: 5
max num called and set item_num to 3
number to sample: 4
max num called and set item_num to 3
number to sample: 4
max num called and set item_num to 3
number to sample: 4
max num called and set item_num to 3
🌑

🌘 🌒 🕛
🕛 🌘 🌒
🌒 🌘 🕛
🕛 🌒 🌘
🌒 🌘 🕛
🕛 🌒 🌘
🌘 🕛 🌒


number to sample: 5
number to sample: 4
number to sample: 4
number to sample: 5
number to sample: 3
number to sample: 4
📜

✨ 📚 📃 🔍 📄
📃 ✨ 📑 🖋
🖋 📑 🔖 ✨
📃 🔖 📄 📑 🖋
📚 📃 🖋
✨ 📑 🔖 🔍


number to sample: 5
number to sample: 3
number to sample: 4
number to sample: 5
number to sample: 3
number to sample: 4
number to sample: 3
🔒

🛅 🔐 🚪 🔏 🔑
🔏 🔐 🔑
🗝️ 🔏 🔑 🚪
🗝️ 🔑 🔓 🔐 🛅
🛅 🔓 🚪
🔏 🚪 🔐 🔓
🔓 🛅 🚪




📜🌑

🌒 🕛 🌘
📑 🔖 ✨
🕛 🌒 🌘


📜🌑

📑 🔖 🖋
🔖 📄 📚
🔖 🔍 🖋
🌒 🌘 🕛


number to sample: 5
number to sample: 4
number to sample: 4
number to sample: 3
🌾🏞️

🍄 🌿 🌹 🍁 🌸
🚜 🍞 🐔 👨‍🌾
🍀 🌳 🌵 🌺
🐔 🏡 👨‍🌾


number to sample: 3
number to sample: 3
number to sample: 5
number to sample: 4
✨

🔮 🪄 🎇
🌟 🪄 🎇
🪄 🧚 🌟 🎆 🔮
🎇 🎆 💫 🪄


number to sample: 4
number to sample: 5
number to sample: 4
👻

🔮 🌌 💀 🌑
🕯️ 🕳️ 🔮 👣 💀
🌌 🌑 🕯️ 🕳️


number to sample: 3
number to sample: 3
number to sample: 4
number to sample: 3
number to sample: 4
number to sample: 3
number to sample: 5
🎠

🏰 🎪 🌆
🎪 🗽 🌉
🎢 🏰 🎡 🗽
🗽 🎡 🌆
🌆 🌉 🎡 🏰
🎪 🎢 🌉
🌉 🌆 🏰 🎪 🎡


number to sample: 3


🎻

🎹 🎵 🎼 🎷 📻
🎷 🎹 📻 🎶
🎶 🎵 🎹 🎷 📻
🎸 🎷 🎹 🎶


🌾🏞️

💐 🍁 🌸 🍄 🍃
🚜 🏡 🐔 🌻 🍞
🌿 🌷 🌼 🌺 🌴
🍁 🍀 🌲 🍄
🌹 🌸 🍀 ☘️ 💐
🍄 🌹 🌲 🌾 🌿
🌿 🌻 👨‍🌾 🏡


👹

🧙 👻 🎭 🕷️ 👺
🧙 💀 👻
🔮 💀 👺 🧙 🩸
🎭 💀 👻
🎭 👺 🔮 👻
👻 👺 🩸 💀


🚗

🛵 🚥 🛺 🚓 🚲
🏍️ 🚚 🚑 🚦
🚙 🛺 🚕 🏎️ 🚥


💀

👹 🕸️ 🔪
🕸️ 👹 🕷️
🔪 👻 🕸️ 👹
🩸 👾 🔪 👹 🕸️
🕸️ 🔪 🩸
🩸 👻 🔪 🕷️ 👹
👹 🕸️ 🩸



🌾🏞️

🚜 👨‍🌾 🐔 🏡
🌾 🌺 🌲 🌳 🍀
🌻 🌲 🍄
🌿 🍁 🍀
🍞 🌻 🏡 👨‍🌾 🌿
🌷 🌸 🌴


🧙

🍯 📜 🔮
📿 🪄 🔮 🍯
🪄 🌟 📿
🍯 📜 📿 🔮
🪄 🌟 🔮
📿 🍯 📜 🕯️ 🔮


💀

🩸 🔪 👾 🕸️
👻 👾 🕷️ 👹
👹 👻 🕸️
👾 👹 🕷️ 🩸
👾 🩸 👹 🔪
🕸️ 👾 👹 👻


📖

📕 📒 📑
🔍 📒 📚 📑 📕
📚 📑 📒 🧐
📒 🔍 🧐 📕 📑
📑 🧐 📕
📕 🔖 📑 📚



🌾🏞️

🌿 🐔 🍞 🏡
🐔 🍞 🌿 🏡 🌻
🌵 🌹 🍃
🍞 👨‍🌾 🌻 🐔
🌷 🌼 🍁
🌻 🐔 🏡 👨‍🌾
👓

🔍 👀 📚
🧐 🔍 🕶
📖 🧐 👀
👴 👀 🕶 🧐 📖
🕶 👀 🔍 📚
🕶 👴 📖 👀 📚
🌾

👨‍🌾 🌻 🏡 🌿
🏡 🐔 👨‍🌾
👨‍🌾 🐔 🏡 🌻 🍞
🐔 🌿 🌻 🚜
🚜 🐔 👨‍🌾 🌿 🌻
👨‍🌾 🌿 🚜 🌻
🧳

✈️ 🚂 🚢
✈️ 🏖️ 🚢
🚢 🚂 🌍 🗺️
✈️ 🏖️ 🌍 🚢
🏖️ 🌍 🗺️ ✈️
🚂 ✈️ 🚢 🏖️



🐔 🌿 🍞 🌻
🍁 🌼 ☘️ 🍂
🏡 🌿 🚜 👨‍🌾 🐔
this book is about: 🌍
selected for theme:🌍
selected for theme:🌍
selected for theme:🌍
selected for theme:🌍
selected for theme:🌍
selected for theme:🌍
🌍

🏖️ 🚢 🌐 🗿 🧭
🗼 🏯 🌎
🏟️ 🗺️ 🧭
🌎 🕍 ⛰️ 🌐
✈️ 🏟️ 🕍 🏰
⛰️ 🗿 🕍 🏖️



random theme is 🌑
this book is about: ['🌒', '🕛', '🌘']


selected for theme:🏡
selected for theme:🍞


selected for theme:🏞️
selected for theme:🏞️
selected for theme:🌾
selected for theme:🏞️
selected for theme:🏞️
selected for theme:🌾
🌾🏞️

🍁 🍄 🌳
🍃 🌻 🌺 ☘️
🌻 👨‍🌾 🐔 🏡 🌿
☘️ 🍄 🍂 🌻 🌳
🌲 🍁 🍀
🐔 🌿 🍞
KeyError: '🚜'

selected for theme:👴
selected for theme:👴
selected for theme:🏫
selected for theme:🏫
selected for theme:🏫
selected for theme:👴
👴🏫

🚬 🎩 🕰️ 🖼️
🩸 🚬 🛋️ 🖼️ 🕰️
🧮 📖 📐 🖍️
🎓 📖 📐 🖍️
🖍️ 📖 📐 👨‍🏫 🎓
👔 🕰️ 🛋️ 🚬 ☕
selected for theme:🏫
selected for theme:👴
selected for theme:👴
selected for theme:👴
selected for theme:🏫
selected for theme:🏫
🐶🐱🐟🦜🐾🪴🍖

📖 📐 🧮
🕰️ ☕ 🩸 🛋️
🚬 🕰️ 🎩 🩸 👔
☕ 👔 🕰️ 🛋️
🖍️ 📐 🎓 📖 👨‍🏫
👨‍🏫 🧮 📐



selected for theme:🏫
selected for theme:🏫
selected for theme:🏫
selected for theme:🏫
selected for theme:🏫
selected for theme:👴
👴🏫

🧮 🎓 🖍️
🎓 📖 🧮 👨‍🏫
📐 🖍️ 📖
🖍️ 📖 📐 🧮
🎓 📐 🖍️ 👨‍🏫
🕰️ ☕ 🖼️
selected for theme:🏫
selected for theme:👴
selected for theme:🏫
selected for theme:🏫
selected for theme:👴
selected for theme:🏫
👨‍🌾

🖍️ 🧮 📐
🛋️ 🎩 🕰️ ☕
🖍️ 📐 📖
📖 📐 👨‍🏫 🖍️
🕰️ 👔 🚬
🎓 👨‍🏫 🖍️



👴🏫

🖍️ 🧮 📐 🎓
🖼️ 🩸 🕰️ 🚬 👔
📐 🎓 📖 👨‍🏫
📖 📐 👨‍🏫 🧮 🖍️
🧮 📐 📖 👨‍🏫 🖍️
🩸 🚬 👔


selected for theme:👴
selected for theme:🏫
selected for theme:👴
selected for theme:👴
selected for theme:👴
selected for theme:👴
👴🏫

🛋️ 🕰️ 🎩
👨‍🏫 🎓 📖
🎩 ☕ 🖼️
🖼️ ☕ 🩸 🛋️ 🚬
☕ 👔 🕰️ 🩸
🩸 🛋️ 🚬 👔



👨‍🌾👨‍🍳🧳💬🐕🎼🏫🌾📚👻🧙🔍🌲👴🏡🏚️👩‍🍳🐶👓🕯️🌻🔪📖🔖🎓🎻👣🕳️🎉🔦🎤👹🎠👾🕵️💀✨📜🌑🔒🔐🔑🏕️�      🌧️️🚗🍕🏥🏞️⏰🎭

🎓 🖍️ 📐 🧮 📖 👨‍🏫
🎓 👨‍🏫 📖 🧮 🖍️ 📐
📖 📐 🖍️ 🧮 🎓 👨‍🏫
📐 🧮 👨‍🏫 🖍️ 📖
👨‍🏫 📐 🧮 🖍️ 🎓
☕ 🩸 👔



🧮 🎓 👨‍🏫 📐 🖍️
🕰️ ☕ 🩸 🚬 👔
📖 📐 🎓 🧮
☕ 🕰️ 🚬
🛋️ 🕰️ 🚬
🧮 👨‍🏫 🎓 🖍️



def generate_thought(theme=None):
    if theme is None:
        theme = random.sample(themes.keys(), 1)
    thought = random.sample(themes[theme],3)
    return thought

def generate_book(emoji, theme, chapters=6):
    # Select a random list of emojis from the chosen theme
    book = f"Book: {emoji} + {theme}"
    content = []
    for i in range(chapters):
        #content.append(generate_thought(theme)) #generates a emoji sentence 3 characters long
        book = book + "\n" + "".join(generate_thought(theme), )
    # Create the book representation
    return book

# Generate a few different books about 🧓
books = []
for theme in random.sample(list(themes.keys()), 5):  # Generate five different books
    books.append(generate_book("🧓", theme))

# Print the generated books
for book in books:
    print(book, "\n")

"""