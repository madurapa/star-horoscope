"""Report text translations (generated — do not hand-edit).

Source: src/locale_si.inc / src/locale_ta.inc (canonical). Regenerate
with /tmp/gen_i18n.py after translator updates. Keys are the exact
English literals emitted by render.py; values stay English (data).
Table headers, chart titles, prompts and the provenance line are
intentionally untranslated (technical vocabulary).
"""
STRINGS = {
    'Horoscope Profile': ('ජන්ම පත්\u200dර පැතිකඩ', 'ஜாதக விவரம்'),
    'Birth Profile': ('උපන් විස්තර', 'பிறப்பு விவரம்'),
    'Astronomical & Chart Reference': ('තාරකා විද්\u200dයා සහ සටහන් යොමුව', 'வானியல் மற்றும் கட்டக் குறிப்பு'),
    'Time & Solar Metrics': ('කාල සහ සූර්ය මිනුම්', 'நேரம் மற்றும் சூரிய அளவீடுகள்'),
    'Panchanga': ('පංචාංග', 'பஞ்சாங்கம்'),
    'Dasa Information': ('දශා තොරතුරු', 'தசை தகவல்'),
    'Hora': ('හෝරා', 'ஹோரை'),
    'Chakra': ('චක්\u200dර', 'சக்கரம்'),
    'Selected Options': ('තෝරාගත් විකල්ප', 'தேர்ந்தெடுத்த தெரிவுகள்'),
    'Nirayana Table of Houses': ('නිරයන භාව වගුව', 'நிராயன பாவ அட்டவணை'),
    'Shadvarga Charts': ('ෂඩ්වර්ග සටහන්', 'ஷட்வர்க்கக் கட்டங்கள்'),
    'Shadvarga Positions': ('ෂඩ්වර්ග පිහිටීම්', 'ஷட்வர்க்க நிலைகள்'),
    'Mahadasa and Antardasa Timeline': ('මහා දශා සහ අතුරු දශා කාල රේඛාව', 'மகாதசை மற்றும் அந்தர்தசை காலவரிசை'),
    'Name': ('නම', 'பெயர்'),
    'Born': ('උපන්', 'பிறப்பு'),
    'Place': ('ස්ථානය', 'இடம்'),
    'Birth Weekday': ('උපන් වාරය', 'பிறந்த கிழமை'),
    'District': ('දිස්ත්\u200dරික්කය', 'மாவட்டம்'),
    'Method': ('ක්\u200dරමය', 'முறை'),
    'Lagna': ('ලග්නය', 'இலக்கினம்'),
    'Lagna Degree': ('ලග්න අංශක', 'இலக்கின பாகை'),
    'Lagna Navamsa': ('ලග්න නවාංශය', 'இலக்கின நவாம்சம்'),
    'Birth Time': ('උපන් වේලාව', 'பிறந்த நேரம்'),
    'Sinhala Time': ('සිංහල වේලාව', 'சிங்கள நேரம்'),
    'Sunrise': ('හිරු උදාව', 'சூரிய உதயம்'),
    'Sunset': ('හිරු බැසීම', 'சூரிய அஸ்தமனம்'),
    'Universal Time (UT)': ('විශ්ව වේලාව (UT)', 'உலகளாவிய நேரம் (UT)'),
    'Local Mean Sidereal Time': ('ප්\u200dරාදේශීය මධ්\u200dයම නාක්ෂත්\u200dර කාලය', 'உள்ளூர் சராசரி நட்சத்திர நேரம்'),
    'Tithi': ('තිථි', 'திதி'),
    'Nakshatra': ('නැකත', 'நட்சத்திரம்'),
    'Nakshatra Pada': ('නැකත් පාදය', 'நட்சத்திரப் பாதம்'),
    'Yoga': ('යෝග', 'யோகம்'),
    'Karana': ('කරණ', 'கரணம்'),
    'Starting': ('ආරම්භය', 'ஆரம்பம்'),
    'Period': ('කාලය', 'காலம்'),
    'Reference': ('යොමුව', 'குறிப்பு'),
    'From birth': ('උපතේ සිට', 'பிறப்பிலிருந்து'),
    'Kala': ('කාල', 'கால'),
    'Panchama': ('පංචම', 'பஞ்சம'),
    'Sukshama': ('සූක්ෂ්ම', 'சூட்சும'),
    'Gana': ('ගණ', 'கணம்'),
    'Yoni': ('යෝනි', 'யோனி'),
    'Linga': ('ලිංග', 'லிங்கம்'),
    'Naadi': ('නාඩි', 'நாடி'),
    'Varna': ('වර්ණ', 'வர்ணம்'),
    'Ruxha': ('වෘක්ෂ', 'விருட்சம்'),
    'Paxhi': ('පක්ෂි', 'பட்சி'),
    'Gothra': ('ගෝත්\u200dර', 'கோத்திரம்'),
    'Rajju': ('රජ්ජු', 'ரஜ்ஜு'),
    'Bhutha': ('භූත', 'பூதம்'),
}

def tr(text, locale):
    """Localize a title/key; unknown locales and strings pass through."""
    if locale in ("si", "ta"):
        row = STRINGS.get(text)
        if row:
            return row[0] if locale == "si" else row[1]
    return text
