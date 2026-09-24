############################################################################
# languages.py - Multi-language translation support for JyotiChart
#
# Supported languages: "english" (default), "kannada", "hindi", "sinhala", "tamil"
############################################################################

# Supported language codes
SUPPORTED_LANGUAGES = ["english", "kannada", "hindi", "sinhala", "tamil"]

############################################################################
# Planet Abbreviations
# Keys match the planet name constants in jyotichart.py
############################################################################
planet_symbols = {
    "english": {
        "Sun"     : "Su",
        "Moon"    : "Mo",
        "Mars"    : "Ma",
        "Mercury" : "Me",
        "Jupiter" : "Ju",
        "Venus"   : "Ve",
        "Saturn"  : "Sa",
        "Rahu"    : "Ra",
        "Ketu"    : "Ke"
    },
    "kannada": {
        "Sun"     : "ಸೂ",
        "Moon"    : "ಚಂ",
        "Mars"    : "ಮಂ",
        "Mercury" : "ಬು",
        "Jupiter" : "ಗು",
        "Venus"   : "ಶು",
        "Saturn"  : "ಶ",
        "Rahu"    : "ರಾ",
        "Ketu"    : "ಕೇ"
    },
    "hindi": {
        "Sun"     : "सू",
        "Moon"    : "चं",
        "Mars"    : "मं",
        "Mercury" : "बु",
        "Jupiter" : "गु",
        "Venus"   : "शु",
        "Saturn"  : "श",
        "Rahu"    : "रा",
        "Ketu"    : "के"
    },
    "sinhala": {
        "Sun"     : "සූ",
        "Moon"    : "චං",
        "Mars"    : "කු",
        "Mercury" : "බු",
        "Jupiter" : "ගු",
        "Venus"   : "ශු",
        "Saturn"  : "ශ",
        "Rahu"    : "රා",
        "Ketu"    : "කේ"
    },
    "tamil": {
        "Sun"     : "சூ",
        "Moon"    : "சந்",
        "Mars"    : "செ",
        "Mercury" : "பு",
        "Jupiter" : "கு",
        "Venus"   : "சுக்",
        "Saturn"  : "ச",
        "Rahu"    : "ரா",
        "Ketu"    : "கே"
    }
}

############################################################################
# Sign Names
############################################################################
sign_names = {
    # STAR: transliterated sign names (match the app's modern rasi
    # spellings); keys stay classical for set_ascendantsign validation.
    "english": {
        "Aries"       : "Mesha",
        "Taurus"      : "Vrishabha",
        "Gemini"      : "Mithuna",
        "Cancer"      : "Kataka",
        "Leo"         : "Simha",
        "Virgo"       : "Kanya",
        "Libra"       : "Tula",
        "Scorpio"     : "Vrishchika",
        "Saggitarius" : "Dhanu",
        "Capricorn"   : "Makara",
        "Aquarius"    : "Kumbha",
        "Pisces"      : "Meena"
    },
    "kannada": {
        "Aries"       : "ಮೇಷ",
        "Taurus"      : "ವೃಷಭ",
        "Gemini"      : "ಮಿಥುನ",
        "Cancer"      : "ಕರ್ಕ",
        "Leo"         : "ಸಿಂಹ",
        "Virgo"       : "ಕನ್ಯಾ",
        "Libra"       : "ತುಲಾ",
        "Scorpio"     : "ವೃಶ್ಚಿಕ",
        "Saggitarius" : "ಧನು",
        "Capricorn"   : "ಮಕರ",
        "Aquarius"    : "ಕುಂಭ",
        "Pisces"      : "ಮೀನ"
    },
    "hindi": {
        "Aries"       : "मेष",
        "Taurus"      : "वृषभ",
        "Gemini"      : "मिथुन",
        "Cancer"      : "कर्क",
        "Leo"         : "सिंह",
        "Virgo"       : "कन्या",
        "Libra"       : "तुला",
        "Scorpio"     : "वृश्चिक",
        "Saggitarius" : "धनु",
        "Capricorn"   : "मकर",
        "Aquarius"    : "कुम्भ",
        "Pisces"      : "मीन"
    },
    "sinhala": {
# BEGIN GENERATED sign-names sinhala
        "Aries"         : "මේෂ",
        "Taurus"        : "වෘෂභ",
        "Gemini"        : "මිථුන",
        "Cancer"        : "කටක",
        "Leo"           : "සිංහ",
        "Virgo"         : "කන්‍යා",
        "Libra"         : "තුලා",
        "Scorpio"       : "වෘශ්චික",
        "Saggitarius"   : "ධනු",
        "Capricorn"     : "මකර",
        "Aquarius"      : "කුම්භ",
        "Pisces"        : "මීන",
    # END GENERATED sign-names sinhala
    },
    "tamil": {
# BEGIN GENERATED sign-names tamil
        "Aries"         : "மேஷம்",
        "Taurus"        : "ரிஷபம்",
        "Gemini"        : "மிதுனம்",
        "Cancer"        : "கடகம்",
        "Leo"           : "சிம்மம்",
        "Virgo"         : "கன்னி",
        "Libra"         : "துலாம்",
        "Scorpio"       : "விருச்சிகம்",
        "Saggitarius"   : "தனுசு",
        "Capricorn"     : "மகரம்",
        "Aquarius"      : "கும்பம்",
        "Pisces"        : "மீனம்",
    # END GENERATED sign-names tamil
    }
}

############################################################################
# UI Labels used in chart center text and Asc marker
############################################################################
ui_labels = {
    # STAR: the marker reads Lagna, not Asc.
    "english": {
        "asc"         : "Lagna",
        "birth"       : "Birth",
        "birthplace"  : "BirthPlace",
        "chart"       : "Chart",
        "inner"       : "Inner",
        "outer"       : "Outer",
        "transit"     : "Transit",
        "outerbirth"  : "Outer Birth",
        "outerbirthplace": "Outer BirthPlace"
    },
    "kannada": {
        "asc"         : "ಲಗ್ನ",
        "birth"       : "ಜನನ",
        "birthplace"  : "ಜನ್ಮಸ್ಥಳ",
        "chart"       : "ಕುಂಡಲಿ",
        "inner"       : "ಒಳ",
        "outer"       : "ಹೊರ",
        "transit"     : "ಗೋಚಾರ",
        "outerbirth"  : "ಹೊರ ಜನನ",
        "outerbirthplace": "ಹೊರ ಜನ್ಮಸ್ಥಳ"
    },
    "hindi": {
        "asc"         : "लग्न",
        "birth"       : "जन्म",
        "birthplace"  : "जन्मस्थान",
        "chart"       : "कुंडली",
        "inner"       : "आंतर",
        "outer"       : "बाहर",
        "transit"     : "गोचर",
        "outerbirth"  : "बाहर जन्म",
        "outerbirthplace": "बाहर जन्मस्थान"
    },
    "sinhala": {
        "asc"         : "ලග්න",
        "birth"       : "උපත",
        "birthplace"  : "උපන් ස්ථානය",
        "chart"       : "කේන්දරය",
        "inner"       : "ඇතුළු",
        "outer"       : "පිටත",
        "transit"     : "ගෝචර",
        "outerbirth"  : "පිටත උපත",
        "outerbirthplace": "පිටත උපන් ස්ථානය"
    },
    "tamil": {
        "asc"         : "லக்னம்",
        "birth"       : "பிறப்பு",
        "birthplace"  : "பிறந்த இடம்",
        "chart"       : "ஜாதகம்",
        "inner"       : "உள்",
        "outer"       : "வெளி",
        "transit"     : "கோச்சாரம்",
        "outerbirth"  : "வெளி பிறப்பு",
        "outerbirthplace": "வெளி பிறந்த இடம்"
    }
}


############################################################################
# Shodashavarga (Sixteen Divisional Chart) Names
# Keys are the standard English division names. Use get_varga_name() to
# look them up, accepting aliases like "D9" or "Navamsha" as well.
############################################################################
varga_names = {
    "english": {
        "Rashi"          : "Rashi",
        "Hora"           : "Hora",
        "Drekkana"       : "Drekkana",
        "Chaturthamsa"   : "Chaturthamsa",
        "Saptamsa"       : "Saptamsa",
        "Navamsa"        : "Navamsa",
        "Dasamsa"        : "Dasamsa",
        "Dwadasamsa"     : "Dwadasamsa",
        "Shodasamsa"     : "Shodasamsa",
        "Vimsamsa"       : "Vimsamsa",
        "Chaturvimsamsa" : "Chaturvimsamsa",
        "Bhamsa"         : "Bhamsa",
        "Trimsamsa"      : "Trimsamsa",
        "Khavedamsa"     : "Khavedamsa",
        "Akshavedamsa"   : "Akshavedamsa",
        "Shastiamsa"     : "Shastiamsa"
    },
    "kannada": {
        "Rashi"          : "ರಾಶಿ",
        "Hora"           : "ಹೋರಾ",
        "Drekkana"       : "ದ್ರೇಕ್ಕಾಣ",
        "Chaturthamsa"   : "ಚತುರ್ಥಾಂಶ",
        "Saptamsa"       : "ಸಪ್ತಾಂಶ",
        "Navamsa"        : "ನವಾಂಶ",
        "Dasamsa"        : "ದಶಾಂಶ",
        "Dwadasamsa"     : "ದ್ವಾದಶಾಂಶ",
        "Shodasamsa"     : "ಷೋಡಶಾಂಶ",
        "Vimsamsa"       : "ವಿಂಶಾಂಶ",
        "Chaturvimsamsa" : "ಚತುರ್ವಿಂಶಾಂಶ",
        "Bhamsa"         : "ಭಾಂಶ",
        "Trimsamsa"      : "ತ್ರಿಂಶಾಂಶ",
        "Khavedamsa"     : "ಖವೇದಾಂಶ",
        "Akshavedamsa"   : "ಅಕ್ಷವೇದಾಂಶ",
        "Shastiamsa"     : "ಷಷ್ಟ್ಯಂಶ"
    },
    "hindi": {
        "Rashi"          : "राशि",
        "Hora"           : "होरा",
        "Drekkana"       : "द्रेष्काण",
        "Chaturthamsa"   : "चतुर्थांश",
        "Saptamsa"       : "सप्तांश",
        "Navamsa"        : "नवांश",
        "Dasamsa"        : "दशांश",
        "Dwadasamsa"     : "द्वादशांश",
        "Shodasamsa"     : "षोडशांश",
        "Vimsamsa"       : "विंशांश",
        "Chaturvimsamsa" : "चतुर्विंशांश",
        "Bhamsa"         : "भांश",
        "Trimsamsa"      : "त्रिंशांश",
        "Khavedamsa"     : "खवेदांश",
        "Akshavedamsa"   : "अक्षवेदांश",
        "Shastiamsa"     : "षष्ट्यंश"
    },
    "sinhala": {
        "Rashi"          : "රාශි",
        "Hora"           : "හෝරා",
        "Drekkana"       : "ද්‍රේෂ්කාණ",
        "Chaturthamsa"   : "චතුර්ථාංශ",
        "Saptamsa"       : "සප්තාංශ",
        "Navamsa"        : "නවාංශ",
        "Dasamsa"        : "දශාංශ",
        "Dwadasamsa"     : "ද්වාදශාංශ",
        "Shodasamsa"     : "ෂෝඩශාංශ",
        "Vimsamsa"       : "විංශාංශ",
        "Chaturvimsamsa" : "චතුර්විංශාංශ",
        "Bhamsa"         : "භාංශ",
        "Trimsamsa"      : "ත්‍රිංශාංශ",
        "Khavedamsa"     : "ඛවේදාංශ",
        "Akshavedamsa"   : "අක්ෂවේදාංශ",
        "Shastiamsa"     : "ෂෂ්ට්‍යංශ"
    },
    "tamil": {
        "Rashi"          : "ராசி",
        "Hora"           : "ஹோரா",
        "Drekkana"       : "த்ரேஷ்காணம்",
        "Chaturthamsa"   : "சதுர்த்தாம்சம்",
        "Saptamsa"       : "சப்தாம்சம்",
        "Navamsa"        : "நவாம்சம்",
        "Dasamsa"        : "தசாம்சம்",
        "Dwadasamsa"     : "துவாதசாம்சம்",
        "Shodasamsa"     : "ஷோடசாம்சம்",
        "Vimsamsa"       : "விம்சாம்சம்",
        "Chaturvimsamsa" : "சதுர்விம்சாம்சம்",
        "Bhamsa"         : "பாம்சம்",
        "Trimsamsa"      : "திரிம்சாம்சம்",
        "Khavedamsa"     : "கவேதாம்சம்",
        "Akshavedamsa"   : "அக்ஷவேதாம்சம்",
        "Shastiamsa"     : "ஷஷ்டியாம்சம்"
    }
}

# Division numbers of the Shodashavarga (for reference / docs).
varga_numbers = {
    "Rashi": 1, "Hora": 2, "Drekkana": 3, "Chaturthamsa": 4,
    "Saptamsa": 7, "Navamsa": 9, "Dasamsa": 10, "Dwadasamsa": 12,
    "Shodasamsa": 16, "Vimsamsa": 20, "Chaturvimsamsa": 24,
    "Bhamsa": 27, "Trimsamsa": 30, "Khavedamsa": 40,
    "Akshavedamsa": 45, "Shastiamsa": 60
}

# What each division signifies (English, for reference / docs).
varga_significations = {
    "Rashi": "Body", "Hora": "Wealth", "Drekkana": "Siblings",
    "Chaturthamsa": "Luck", "Saptamsa": "Progeny",
    "Navamsa": "Wife & Marriage", "Dasamsa": "Profession",
    "Dwadasamsa": "Parents", "Shodasamsa": "Happiness through vehicle & property",
    "Vimsamsa": "Spiritual life", "Chaturvimsamsa": "Education",
    "Bhamsa": "Strength", "Trimsamsa": "Misfortune",
    "Khavedamsa": "Auspicious results", "Akshavedamsa": "General Wellbeing",
    "Shastiamsa": "General Wellbeing"
}

# Alternative spellings / shortcuts accepted by get_varga_name().
# Keys are normalized (lowercase, no spaces/hyphens/underscores).
VARGA_ALIASES = {
    "ascendant": "Rashi", "lagna": "Rashi", "rasi": "Rashi",
    "rashi": "Rashi", "d1": "Rashi",
    "d2": "Hora", "d3": "Drekkana", "dreshkana": "Drekkana",
    "d4": "Chaturthamsa", "d7": "Saptamsa",
    "d9": "Navamsa", "navamsha": "Navamsa", "navamsa": "Navamsa",
    "d10": "Dasamsa", "dasamamsa": "Dasamsa",
    "d12": "Dwadasamsa", "d16": "Shodasamsa",
    "d20": "Vimsamsa", "d24": "Chaturvimsamsa",
    "d27": "Bhamsa", "saptavimsamsa": "Bhamsa",
    "d30": "Trimsamsa", "d40": "Khavedamsa",
    "d45": "Akshavedamsa", "d60": "Shastiamsa"
}


############################################################################
# Helper Functions
############################################################################

def get_planet_symbol(planet, language="english"):
    """Return the planet abbreviation/symbol in the requested language.

    Parameters:
        planet   (str): Planet name. Must be one of: "Sun", "Moon", "Mars",
                        "Mercury", "Jupiter", "Venus", "Saturn", "Rahu", "Ketu".
        language (str): Language code. One of "english" (default), "kannada", "hindi".

    Returns:
        str: The abbreviation string for the planet in the given language.
             Falls back to English if the language or planet is not found.
    """
    lang = language.lower() if language else "english"
    if lang not in SUPPORTED_LANGUAGES:
        print(f"Warning: Language '{language}' is not supported. Falling back to English.")
        lang = "english"
    symbols = planet_symbols.get(lang, planet_symbols["english"])
    return symbols.get(planet, planet_symbols["english"].get(planet, planet))


def get_sign_name(sign, language="english"):
    """Return the zodiac sign name in the requested language.

    Parameters:
        sign     (str): English sign name e.g. "Aries", "Taurus", etc.
        language (str): Language code. One of "english" (default), "kannada", "hindi".

    Returns:
        str: The sign name string in the given language.
             Falls back to English if the language is not found.
    """
    lang = language.lower() if language else "english"
    if lang not in SUPPORTED_LANGUAGES:
        print(f"Warning: Language '{language}' is not supported. Falling back to English.")
        lang = "english"
    names = sign_names.get(lang, sign_names["english"])
    return names.get(sign, sign)


def get_ui_label(label_key, language="english"):
    """Return a UI label string (e.g. 'Asc', 'Birth') in the requested language.

    Parameters:
        label_key (str): Key from ui_labels dict e.g. "asc", "birth", "birthplace".
        language  (str): Language code. One of "english" (default), "kannada", "hindi".

    Returns:
        str: The label in the requested language. Falls back to English if not found.
    """
    lang = language.lower() if language else "english"
    if lang not in SUPPORTED_LANGUAGES:
        lang = "english"
    labels = ui_labels.get(lang, ui_labels["english"])
    return labels.get(label_key, ui_labels["english"].get(label_key, label_key))


def _normalize_varga_key(varga):
    """Normalize a division name for lookup: lowercase, alphanumeric only."""
    s = "".join(ch for ch in str(varga).strip().lower() if ch.isalnum())
    return VARGA_ALIASES.get(s, s)


def get_varga_name(varga, language="english"):
    """Return a Shodashavarga division name in the requested language.

    Parameters:
        varga    (str): Division name e.g. "Navamsa", "Dasamsa", "Hora".
                       Aliases like "D9", "D10" or "Navamsha" are accepted.
        language (str): Language code. One of "english" (default), "kannada",
                       "hindi", "sinhala", "tamil".

    Returns:
        str: The division name in the given language.
             e.g. get_varga_name("Navamsa", "sinhala") returns "නවාංශ".
             Unknown names are returned unchanged, so custom centre labels
             pass straight through.
    """
    lang = language.lower() if language else "english"
    if lang not in SUPPORTED_LANGUAGES:
        print(f"Warning: Language '{language}' is not supported. Falling back to English.")
        lang = "english"
    names = varga_names.get(lang, varga_names["english"])
    key = _normalize_varga_key(varga)
    for canonical, translated in names.items():
        if canonical.lower() == key.lower():
            return translated
    return varga
