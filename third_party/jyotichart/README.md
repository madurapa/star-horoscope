# Jyotichart



Jyotichart is a Python library for generating beautiful, highly customizable astrological charts in SVG format. It supports **North Indian (Diamond)**, **South Indian (Square)** and **East Indian / Maithili (3×3 grid with diagonals)** styles, including full natal charts, partial charts, transit overlays, and numerical representations (like Ashtakavarga).



---



## Features



- **Multiple Chart Styles**: Generate North Indian, South Indian and East Indian (Maithili/Bengali) format charts.

- **Full & Partial Charts**: Plot a complete horoscope or just a subset of specific planets.

- **Transit Overlays**: Generate transit charts that elegantly overlay transit planets on top of a base natal chart.

- **Numerical Charts**: Generate charts that show numerical values in each house (useful for Ashtakavarga or Bhava Bala).

- **High Customizability**: Adjust colors for the background, outer/inner boxes, specific signs, planet text, and toggle planetary aspects.

- **Rich Center Information**: Display Birth Details, Chart Type, Name, and overlay details directly in the chart center.



---



## Installation



Install the package using pip:


```bash

pip install jyotichart
```



---



## Required Python Libraries



Jyotichart is a **pure-Python** library with **no external dependencies**. It only uses modules from the Python Standard Library:



| Library | Purpose | Included With |
|---------|---------|---------------|
| `os`    | File path and directory handling | Python Standard Library |



The library generates SVG files that can be opened in any modern web browser or SVG viewer.



> **Python version requirement**: Python 3.7 or higher (as specified in `pyproject.toml`).



---



## Usage Guide



### 1. Generating a Natal Chart (Full)



You can generate a classic full Natal Chart by providing the ascendant sign and adding all 9 planets. If you leave `IsFullChart=True` (the default), the chart will safely throw an error if you forget to add a planet.


```python
import jyotichart as chart



# 1. Initialize the North Indian Chart (or use SouthChart for South Indian style)

north = chart.NorthChart("D1 Natal", "John Doe")



# 2. Add Birth Details (will automatically appear perfectly centered)

north.set_birth_details("08 October 1991", "14:47", "New York")



# 3. Set the Ascendant sign

north.set_ascendantsign("Aries")



# 4. Add Planets

north.add_planet(chart.SUN, "Su", 1)

north.add_planet(chart.MOON, "Mo", 2)

north.add_planet(chart.MARS, "Ma", 3)

north.add_planet(chart.MERCURY, "Me", 4)

# Add retrograde planet (will have an underline)

north.add_planet(chart.JUPITER, "Ju", 5, retrograde=True)

north.add_planet(chart.VENUS, "Ve", 6)

north.add_planet(chart.SATURN, "Sa", 7)

north.add_planet(chart.RAHU, "Ra", 8)

north.add_planet(chart.KETU, "Ke", 2)



# 5. Save the chart as an SVG file

north.draw("output_directory/", "north_natal", "svg")
```



#### Outputs:

|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_natal.svg" width="400">|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_natal.svg" width="400">|
|:---:|:---:|
| **North Indian Natal** | **South Indian Natal** |



---



### 2. Generating a Partial Chart



If you only want to display a subset of planets (for example, to emphasize a specific conjunction), you must pass `IsFullChart=False` during initialization. The chart will render successfully even with missing planets.



#### A. North Indian Partial Chart
```python
import jyotichart as chart



# 1. Initialize the chart as a partial chart

n_partial = chart.NorthChart("Partial", "Alice", IsFullChart=False)

n_partial.set_ascendantsign("Leo")



# 2. Only add a few specific planets

n_partial.add_planet(chart.SUN, "Su", 1)

n_partial.add_planet(chart.JUPITER, "Ju", 9)



# 3. Draw the chart

n_partial.draw("output_directory/", "north_partial", "svg")
```



#### B. South Indian Partial Chart
```python
import jyotichart as chart



# 1. Initialize the chart as a partial chart

s_partial = chart.SouthChart("Partial", "Alice", IsFullChart=False)

s_partial.set_ascendantsign("Leo")



# 2. Only add a few specific planets

s_partial.add_planet(chart.SUN, "Su", 1)

s_partial.add_planet(chart.JUPITER, "Ju", 9)



# 3. Draw the chart

s_partial.draw("output_directory/", "south_partial", "svg")
```



#### Outputs:

|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_partial.svg" width="400">|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_partial.svg" width="400">|
|:---:|:---:|
| **North Indian Partial** | **South Indian Partial** |



---



### 3. Customizing Colors (Houses, Planets, and Signs)



You can thoroughly customize the look and feel of your charts. This feature is available identically for all chart types (North, South, Transit, Numerical).



1. **Planet Colors**: Use the `colour="..."` argument inside `add_planet`.

2. **Sign Numbers (North) / Ascendant Label (South)**: Use `clr_sign="..."` inside `updatechartcfg`.

3. **Backgrounds and Lines**: Use `clr_background="..."` and `clr_line="..."`.

4. **Individual House Colors**: Pass an array of 12 colors to `clr_houses="..."`.


```python
import jyotichart as chart



# Create a chart

n_custom = chart.NorthChart("Colored", "Custom User", IsFullChart=True)

n_custom.set_ascendantsign("Gemini")



# 1. Customize the Planet color (set Venus to Cyan)

n_custom.add_planet(chart.SUN, "Su", 1)

n_custom.add_planet(chart.MOON, "Mo", 2)

n_custom.add_planet(chart.MARS, "Ma", 3)

n_custom.add_planet(chart.MERCURY, "Me", 4)

n_custom.add_planet(chart.VENUS, "Ve", 5, colour="cyan")

n_custom.add_planet(chart.JUPITER, "Ju", 6)

n_custom.add_planet(chart.SATURN, "Sa", 7)

n_custom.add_planet(chart.RAHU, "Ra", 8)

n_custom.add_planet(chart.KETU, "Ke", 2)



# 2. Customize Individual House Background Colors

# Create a list of 12 colors for the 12 houses (default is 'black')

housecolours = ['black'] * 12

housecolours[0] = '#2b2b2b' # Color the 1st house (or Aries in South Chart)

housecolours[4] = '#3d1212' # Color the 5th house (or Leo in South Chart)



# 3. Update the global chart configuration

n_custom.updatechartcfg(

    aspect=False,               # Disable planetary aspect lines

    clr_background='#1a1a1a',   # Main background color of the chart

    clr_line='orange',          # Grid lines color

    clr_sign='yellow',          # Sign numbers / Ascendant text color

    clr_houses=housecolours     # Apply the custom house background colors

)



# Draw the customized chart

n_custom.draw("output_directory/", "north_custom", "svg")
```



#### Outputs:

|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_custom.svg" width="400">|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_custom.svg" width="400">|
|:---:|:---:|
| **Custom Colored North** | **Custom Colored South** |



---



### 4. Toggling Planetary Aspects



By default, Jyotichart draws the aspect lines of all planets (for example, Mars' 4th, 7th, and 8th aspects). You can easily hide them to reduce visual clutter using the `updatechartcfg` method.


```python
import jyotichart as chart



my_chart = chart.NorthChart("D1 Natal", "John Doe", IsFullChart=False)

my_chart.set_ascendantsign("Aries")

my_chart.add_planet(chart.JUPITER, "Ju", 1)



# Set aspect=False to hide the aspect lines

my_chart.updatechartcfg(aspect=False)



my_chart.draw("output_directory/", "hidden_aspects", "svg")
```



#### Output:

<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/hidden_aspects.svg" width="400">



---



### 5. Generating a Transit Chart



You can create transit charts that perfectly overlay current transit planets onto a pre-existing natal chart. The natal planets stay in the inner loop, while the transit planets orbit in the outer boxes. Because these charts contain a high density of information (18 planets in total), it is highly recommended to disable aspects (`aspect=False`) to avoid visual clutter.



#### A. North Indian Transit Chart


```python
import jyotichart as chart



# 1. Create your base Natal chart with all planets

base_north = chart.NorthChart("D1 Natal", "John Doe")

base_north.set_ascendantsign("Aries")

base_north.add_planet(chart.SUN, "Su", 1)

base_north.add_planet(chart.MOON, "Mo", 2)

base_north.add_planet(chart.MARS, "Ma", 3)

base_north.add_planet(chart.MERCURY, "Me", 4)

base_north.add_planet(chart.JUPITER, "Ju", 5, retrograde=True)

base_north.add_planet(chart.VENUS, "Ve", 6)

base_north.add_planet(chart.SATURN, "Sa", 7)

base_north.add_planet(chart.RAHU, "Ra", 8)

base_north.add_planet(chart.KETU, "Ke", 2)

# Turn off inner chart aspects to reduce clutter

base_north.updatechartcfg(aspect=False)



# 2. Create the Transit Chart overlaying the base chart

n_transit = chart.NorthTransitChart("Transit", "John Doe", base_north)



# 3. Add transit planets (these will go in the outer ring)

n_transit.add_planet(chart.SUN, "Su", 10)

n_transit.add_planet(chart.MOON, "Mo", 12)

n_transit.add_planet(chart.MARS, "Ma", 1)

n_transit.add_planet(chart.MERCURY, "Me", 2)

n_transit.add_planet(chart.JUPITER, "Ju", 3)

n_transit.add_planet(chart.VENUS, "Ve", 4)

n_transit.add_planet(chart.SATURN, "Sa", 5)

n_transit.add_planet(chart.RAHU, "Ra", 6)

n_transit.add_planet(chart.KETU, "Ke", 12)



# 4. Turn off outer chart aspects and draw the overlay chart

n_transit.updatechartcfg(aspect=False)

n_transit.draw("output_directory/", "north_transit", "svg")
```

<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_transit.svg" width="600">



---



#### B. South Indian Transit Chart


```python
import jyotichart as chart



# 1. Create your base Natal chart with all planets

base_south = chart.SouthChart("D1 Natal", "John Doe")

base_south.set_ascendantsign("Aries")

base_south.add_planet(chart.SUN, "Su", 1)

base_south.add_planet(chart.MOON, "Mo", 2)

base_south.add_planet(chart.MARS, "Ma", 3)

base_south.add_planet(chart.MERCURY, "Me", 4)

base_south.add_planet(chart.JUPITER, "Ju", 5, retrograde=True)

base_south.add_planet(chart.VENUS, "Ve", 6)

base_south.add_planet(chart.SATURN, "Sa", 7)

base_south.add_planet(chart.RAHU, "Ra", 8)

base_south.add_planet(chart.KETU, "Ke", 2)

# Turn off inner chart aspects to reduce clutter

base_south.updatechartcfg(aspect=False)



# 2. Create the Transit Chart overlaying the base chart

s_transit = chart.SouthTransitChart("Transit", "John Doe", base_south)

s_transit.set_transit_details("12 Jan 2026", "10:00")



# 3. Add transit planets (these will go in the outer ring)

s_transit.add_planet(chart.SUN, "Su", 10)

s_transit.add_planet(chart.MOON, "Mo", 12)

s_transit.add_planet(chart.MARS, "Ma", 1)

s_transit.add_planet(chart.MERCURY, "Me", 2)

s_transit.add_planet(chart.JUPITER, "Ju", 3)

s_transit.add_planet(chart.VENUS, "Ve", 4)

s_transit.add_planet(chart.SATURN, "Sa", 5)

s_transit.add_planet(chart.RAHU, "Ra", 6)

s_transit.add_planet(chart.KETU, "Ke", 12)



# 4. Turn off outer chart aspects and draw the overlay chart

s_transit.updatechartcfg(aspect=False)

s_transit.draw("output_directory/", "south_transit", "svg")
```

<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_transit.svg" width="600">



---



### 6. Generating Numerical Charts



If you need to plot Ashtakavarga points, Bhava Bala, or any single numerical/text value per house, you can use Numerical Charts. 



#### A. North Indian Numerical Chart (e.g. Bhava Bala)


```python
import jyotichart as chart



# Initialize a Numerical Chart

n_num = chart.NorthNumericalChart("Bhava Bala", "User")

n_num.set_ascendantsign("Libra")



# Provide an array of realistic numerical data for the 12 houses

north_values = [324, 156, 210, 489, 512, 123, 765, 890, 432, 234, 567, 876]



# Loop through houses 1 to 12 and set the numerical value

for i in range(1, 13):

    n_num.set_house_value(i, north_values[i-1])



n_num.draw("output_directory/", "north_numerical", "svg")
```



#### B. South Indian Numerical Chart (e.g. Ashtakavarga)


```python
import jyotichart as chart



# Initialize a Numerical Chart

s_num = chart.SouthNumericalChart("Ashtakavarga", "User")

s_num.set_ascendantsign("Libra")



# Provide an array of realistic numerical data for the 12 houses

south_values = [2, 5, 8, 3, 1, 9, 4, 7, 6, 2, 8, 5]



# Loop through houses 1 to 12 and set the numerical value

for i in range(1, 13):

    s_num.set_house_value(i, south_values[i-1])



s_num.draw("output_directory/", "south_numerical", "svg")
```



#### Outputs:

|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_numerical.svg" width="400">|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_numerical.svg" width="400">|
|:---:|:---:|
| **North Indian Numerical** | **South Indian Numerical** |



---



### 7. East Indian (Maithili/Bengali) Charts

East Indian charts use the **fixed-sign method** (like South Indian) but are drawn **anti-clockwise** (South is clockwise). Popular in Bengal, Odisha, Andhra Pradesh and parts of Bihar.

**Fixed sign layout** (matches `east_indian.svg`):

| Position | Sign | Position | Sign |
|---|---|---|---|
| Top-centre (single) | Aries (1) | Bottom-centre (single) | Libra (7) |
| Top-left upper triangle | Taurus (2) | Bottom-right lower triangle | Scorpio (8) |
| Top-left lower triangle | Gemini (3) | Bottom-right upper triangle | Sagittarius (9) |
| Middle-left (single) | Cancer (4) | Middle-right (single) | Capricorn (10) |
| Bottom-left upper triangle | Leo (5) | Top-right lower triangle | Aquarius (11) |
| Bottom-left lower triangle | Virgo (6) | Top-right upper triangle | Pisces (12) |

Houses are counted anti-clockwise from the ascendant: `housenum=1` is always the ascendant sign, `housenum=2` the next sign forward in zodiac order, and so on. Use the same `add_planet(planet, symbol, housenum)` API as South Indian charts.

#### A. East Indian Natal Chart
```python
import jyotichart as chart

# 1. Initialize the East Indian chart
east = chart.EastChart("D1 Natal", "John Doe")
east.set_ascendantsign("Aries")

# 2. Birth details appear in the centre square
east.set_birth_details("08 October 1991", "14:47", "New York")

# 3. Add planets by house counted anti-clockwise from Lagna
east.add_planet(chart.SUN, "Su", 1)
east.add_planet(chart.MOON, "Mo", 2)
east.add_planet(chart.MARS, "Ma", 3)
east.add_planet(chart.MERCURY, "Me", 4)
east.add_planet(chart.JUPITER, "Ju", 5, retrograde=True)
east.add_planet(chart.VENUS, "Ve", 6)
east.add_planet(chart.SATURN, "Sa", 7)
east.add_planet(chart.RAHU, "Ra", 8)
east.add_planet(chart.KETU, "Ke", 2)

east.updatechartcfg(aspect=False)
east.draw("output_directory/", "east_natal", "svg")
# Output: output_directory/east_natal.svg — 3x3 grid with diagonals,
# Aries fixed top-centre, Asc marker on the Lagna sign.
```

#### B. East Indian Chart in Sinhala / Tamil
```python
import jyotichart as chart

LANG = "sinhala"  # or "tamil"
# Asc -> "ලග්න" (sinhala) / "லக்னம்" (tamil), centre labels translated automatically
east = chart.EastChart("D1 කේන්දරය", "කමල්", language=LANG)
east.set_birth_details("15 Aug 1990", "08:30", "Colombo")
east.set_ascendantsign("Leo")

planets = [chart.SUN, chart.MOON, chart.MARS, chart.MERCURY,
           chart.JUPITER, chart.VENUS, chart.SATURN, chart.RAHU, chart.KETU]
houses  = [1, 4, 10, 1, 9, 2, 7, 12, 6]
for planet, house in zip(planets, houses):
    east.add_planet(planet, chart.get_planet_symbol(planet, LANG), house)

east.updatechartcfg(aspect=False)
east.draw("output_directory/", f"east_{LANG}", "svg")
```

#### C. East Indian Transit Chart
```python
import jyotichart as chart

# 1. Base natal chart (fixed signs, anti-clockwise)
base = chart.EastChart("D1 Natal", "John Doe")
base.set_ascendantsign("Aries")
base.add_planet(chart.SUN, "Su", 1)
base.add_planet(chart.MOON, "Mo", 2)
base.add_planet(chart.MARS, "Ma", 3)
base.add_planet(chart.MERCURY, "Me", 4)
base.add_planet(chart.JUPITER, "Ju", 5)
base.add_planet(chart.VENUS, "Ve", 6)
base.add_planet(chart.SATURN, "Sa", 7)
base.add_planet(chart.RAHU, "Ra", 8)
base.add_planet(chart.KETU, "Ke", 2)
base.updatechartcfg(aspect=False)

# 2. Transit overlay — natal planets stay at base coords,
#    transit planets are shifted (+20,+15) so both remain visible
transit = chart.EastTransitChart("Transit", "John Doe", base)
transit.set_transit_details("12 Jan 2026", "10:00")
transit.add_planet(chart.SUN, "Su", 10)
transit.add_planet(chart.MOON, "Mo", 12)
transit.add_planet(chart.MARS, "Ma", 1)
transit.add_planet(chart.MERCURY, "Me", 2)
transit.add_planet(chart.JUPITER, "Ju", 3)
transit.add_planet(chart.VENUS, "Ve", 4)
transit.add_planet(chart.SATURN, "Sa", 5)
transit.add_planet(chart.RAHU, "Ra", 6)
transit.add_planet(chart.KETU, "Ke", 12)
transit.updatechartcfg(aspect=False)
transit.draw("output_directory/", "east_transit", "svg")
```

#### D. East Indian Numerical Chart (e.g. Ashtakavarga)
```python
import jyotichart as chart

num = chart.EastNumericalChart("Ashtakavarga", "User")
num.set_ascendantsign("Libra")

values = [2, 5, 8, 3, 1, 9, 4, 7, 6, 2, 8, 5]
for i in range(1, 13):
    num.set_house_value(i, values[i-1])

num.draw("output_directory/", "east_numerical", "svg")
# Values are placed at the centre of each fixed-sign compartment.
```



---



### 8. Language Support

Jyotichart supports **five languages** for chart labels, planet abbreviations, the Ascendant marker, and center box text. The default is English, and **all 9 chart types** accept the `language` parameter.

**Supported languages:** `"english"` *(default)*, `"kannada"`, `"hindi"`, `"sinhala"`, `"tamil"`

#### How Language Works Across Chart Types

| Feature | North Indian Charts | South / East Indian Charts |
|---|---|---|
| Planet symbols | User-provided via `add_planet()` — use `get_planet_symbol()` helper | Same |
| House numbers (01-12) | **Always numeric** — language does not change these | N/A (fixed signs) |
| "Asc" marker | N/A (uses numeric sign numbers) | Translated automatically (`Asc` / `ಲಗ್ನ` / `लग्न` / `ලග්න` / `லக்னம்`) |
| Center labels (Birth, BirthPlace, Chart) | N/A | Translated automatically |
| Transit chart variants | Supported | Supported |
| Numerical chart variants | Supported | Supported (Asc label translated) |

> **Note:** House/sign numbers in North Indian charts are always displayed as numeric digits (01-12) regardless of the selected language, since numbers are universally understood in astrology contexts.

---

#### Planet Abbreviations by Language

| Planet  | English | Kannada | Hindi | Sinhala | Tamil |
|---------|---------|---------|-------|---------|-------|
| Sun     | `Su`    | `ಸೂ`   | `सू` | `සූ`   | `சூ`  |
| Moon    | `Mo`    | `ಚಂ`   | `चं` | `චං`   | `சந்` |
| Mars    | `Ma`    | `ಮಂ`   | `मं` | `කු`   | `செ`  |
| Mercury | `Me`    | `ಬು`   | `बु` | `බු`   | `பு`  |
| Jupiter | `Ju`    | `ಗು`   | `गु` | `ගු`   | `கு`  |
| Venus   | `Ve`    | `ಶು`   | `शु` | `ශු`   | `சுக்` |
| Saturn  | `Sa`    | `ಶ`    | `श`  | `ශ`    | `ச`   |
| Rahu    | `Ra`    | `ರಾ`   | `रा` | `රා`   | `ரா`  |
| Ketu    | `Ke`    | `ಕೇ`   | `के` | `කේ`   | `கே`  |

#### Sign Names by Language (via `get_sign_name()`)

| Sign | English | Kannada | Hindi | Sinhala | Tamil |
|---|---|---|---|---|---|
| Aries | Aries | `ಮೇಷ` | `मेष` | `මේෂ` | `மேஷம்` |
| Taurus | Taurus | `ವೃಷಭ` | `वृषभ` | `වෘෂභ` | `ரிஷபம்` |
| Gemini | Gemini | `ಮಿಥುನ` | `मिथुन` | `මිථුන` | `மிதுனம்` |
| Cancer | Cancer | `ಕರ್ಕ` | `कर्क` | `කර්කට` | `கடகம்` |
| Leo | Leo | `ಸಿಂಹ` | `सिंह` | `සිංහ` | `சிம்மம்` |
| Virgo | Virgo | `ಕನ್ಯಾ` | `कन्या` | `කන්‍යා` | `கன்னி` |
| Libra | Libra | `ತುಲಾ` | `तुला` | `තුලා` | `துலாம்` |
| Scorpio | Scorpio | `ವೃಶ್ಚಿಕ` | `वृश्चिक` | `වෘශ්චික` | `விருச்சிகம்` |
| Sagittarius | Saggitarius | `ಧನು` | `धनु` | `ධනු` | `தனுசு` |
| Capricorn | Capricorn | `ಮಕರ` | `मकर` | `මකර` | `மகரம்` |
| Aquarius | Aquarius | `ಕುಂಭ` | `कुम्भ` | `කුම්භ` | `கும்பம்` |
| Pisces | Pisces | `ಮೀನ` | `मीन` | `මීන` | `மீனம்` |

#### UI Labels by Language (Asc marker + centre box)

| Label | English | Kannada | Hindi | Sinhala | Tamil |
|---|---|---|---|---|---|
| Asc | `Asc` | `ಲಗ್ನ` | `लग्न` | `ලග්න` | `லக்னம்` |
| Birth | `Birth` | `ಜನನ` | `जन्म` | `උපත` | `பிறப்பு` |
| BirthPlace | `BirthPlace` | `ಜನ್ಮಸ್ಥಳ` | `जन्मस्थान` | `උපන් ස්ථානය` | `பிறந்த இடம்` |
| Chart | `Chart` | `ಕುಂಡಲಿ` | `कुंडली` | `කේන්දරය` | `ஜாதகம்` |
| Transit | `Transit` | `ಗೋಚಾರ` | `गोचर` | `ගෝචර` | `கோச்சாரம்` |
| Inner | `Inner` | `ಒಳ` | `आंतर` | `ඇතුළු` | `உள்` |
| Outer | `Outer` | `ಹೊರ` | `बाहर` | `පිටත` | `வெளி` |

---

#### A. North Indian Chart in Kannada
```python
import jyotichart as chart

# 1. Initialize with language="kannada"
north = chart.NorthChart("D1 ಲಗ್ನ", "ರಾಮ", language="kannada")
north.set_ascendantsign("Scorpio")

# 2. Use get_planet_symbol() to automatically get Kannada abbreviations
north.add_planet(chart.SUN,     chart.get_planet_symbol(chart.SUN,     "kannada"), 1)
north.add_planet(chart.MOON,    chart.get_planet_symbol(chart.MOON,    "kannada"), 4)
north.add_planet(chart.MARS,    chart.get_planet_symbol(chart.MARS,    "kannada"), 10)
north.add_planet(chart.MERCURY, chart.get_planet_symbol(chart.MERCURY, "kannada"), 1)
north.add_planet(chart.JUPITER, chart.get_planet_symbol(chart.JUPITER, "kannada"), 9)
north.add_planet(chart.VENUS,   chart.get_planet_symbol(chart.VENUS,   "kannada"), 2)
north.add_planet(chart.SATURN,  chart.get_planet_symbol(chart.SATURN,  "kannada"), 7)
north.add_planet(chart.RAHU,    chart.get_planet_symbol(chart.RAHU,    "kannada"), 12)
north.add_planet(chart.KETU,    chart.get_planet_symbol(chart.KETU,    "kannada"), 6)

# 3. House numbers (01-12) remain as English numerals always
north.updatechartcfg(aspect=False)
north.draw("output_directory/", "north_kannada", "svg")
```

#### Output:
|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_kannada.svg" width="400">|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/north_hindi.svg" width="400">|
|:---:|:---:|
| **North Indian - Kannada** | **North Indian - Hindi** |

---

#### B. North Indian Chart in Hindi
```python
import jyotichart as chart

# 1. Initialize with language="hindi"
north = chart.NorthChart("D1 कुंडली", "राम", language="hindi")
north.set_ascendantsign("Scorpio")

# 2. Use get_planet_symbol() to automatically get Hindi abbreviations
north.add_planet(chart.SUN,     chart.get_planet_symbol(chart.SUN,     "hindi"), 1)
north.add_planet(chart.MOON,    chart.get_planet_symbol(chart.MOON,    "hindi"), 4)
north.add_planet(chart.MARS,    chart.get_planet_symbol(chart.MARS,    "hindi"), 10)
north.add_planet(chart.MERCURY, chart.get_planet_symbol(chart.MERCURY, "hindi"), 1)
north.add_planet(chart.JUPITER, chart.get_planet_symbol(chart.JUPITER, "hindi"), 9)
north.add_planet(chart.VENUS,   chart.get_planet_symbol(chart.VENUS,   "hindi"), 2)
north.add_planet(chart.SATURN,  chart.get_planet_symbol(chart.SATURN,  "hindi"), 7)
north.add_planet(chart.RAHU,    chart.get_planet_symbol(chart.RAHU,    "hindi"), 12)
north.add_planet(chart.KETU,    chart.get_planet_symbol(chart.KETU,    "hindi"), 6)

north.updatechartcfg(aspect=False)
north.draw("output_directory/", "north_hindi", "svg")
```

---

#### C. South Indian Chart in Kannada

On South Indian charts, the **"Asc"** marker automatically becomes **"ಲಗ್ನ"** and center box labels (Birth, BirthPlace, Chart) are rendered in Kannada.
```python
import jyotichart as chart

# 1. Initialize South Indian chart with Kannada language
south = chart.SouthChart("D1 ಲಗ್ನ", "ರಾಮ", language="kannada")

# 2. Birth details — center labels appear in Kannada automatically
#    Birth -> ಜನನ  |  BirthPlace -> ಜನ್ಮಸ್ಥಳ  |  Chart -> ಕುಂಡಲಿ  |  Asc -> ಲಗ್ನ
south.set_birth_details("15 Aug 1990", "08:30", "ಬೆಂಗಳೂರು")
south.set_ascendantsign("Scorpio")

# 3. Add planets with Kannada symbols
south.add_planet(chart.SUN,     chart.get_planet_symbol(chart.SUN,     "kannada"), 1)
south.add_planet(chart.MOON,    chart.get_planet_symbol(chart.MOON,    "kannada"), 4)
south.add_planet(chart.MARS,    chart.get_planet_symbol(chart.MARS,    "kannada"), 10)
south.add_planet(chart.MERCURY, chart.get_planet_symbol(chart.MERCURY, "kannada"), 1)
south.add_planet(chart.JUPITER, chart.get_planet_symbol(chart.JUPITER, "kannada"), 9)
south.add_planet(chart.VENUS,   chart.get_planet_symbol(chart.VENUS,   "kannada"), 2)
south.add_planet(chart.SATURN,  chart.get_planet_symbol(chart.SATURN,  "kannada"), 7)
south.add_planet(chart.RAHU,    chart.get_planet_symbol(chart.RAHU,    "kannada"), 12)
south.add_planet(chart.KETU,    chart.get_planet_symbol(chart.KETU,    "kannada"), 6)

south.updatechartcfg(aspect=False)
south.draw("output_directory/", "south_kannada", "svg")
```

#### D. South Indian Chart in Hindi

On South Indian charts with Hindi, the **"Asc"** marker becomes **"लग्न"** and center labels (जन्म, जन्मस्थान, कुंडली) are rendered in Hindi.
```python
import jyotichart as chart

# 1. Initialize South Indian chart with Hindi language
south = chart.SouthChart("D1 कुंडली", "राम", language="hindi")

# 2. Birth details — center labels appear in Hindi automatically
#    Birth -> जन्म  |  BirthPlace -> जन्मस्थान  |  Chart -> कुंडली  |  Asc -> लग्न
south.set_birth_details("15 Aug 1990", "08:30", "दिल्ली")
south.set_ascendantsign("Scorpio")

# 3. Add planets with Hindi symbols
south.add_planet(chart.SUN,     chart.get_planet_symbol(chart.SUN,     "hindi"), 1)
south.add_planet(chart.MOON,    chart.get_planet_symbol(chart.MOON,    "hindi"), 4)
south.add_planet(chart.MARS,    chart.get_planet_symbol(chart.MARS,    "hindi"), 10)
south.add_planet(chart.MERCURY, chart.get_planet_symbol(chart.MERCURY, "hindi"), 1)
south.add_planet(chart.JUPITER, chart.get_planet_symbol(chart.JUPITER, "hindi"), 9)
south.add_planet(chart.VENUS,   chart.get_planet_symbol(chart.VENUS,   "hindi"), 2)
south.add_planet(chart.SATURN,  chart.get_planet_symbol(chart.SATURN,  "hindi"), 7)
south.add_planet(chart.RAHU,    chart.get_planet_symbol(chart.RAHU,    "hindi"), 12)
south.add_planet(chart.KETU,    chart.get_planet_symbol(chart.KETU,    "hindi"), 6)

south.updatechartcfg(aspect=False)
south.draw("output_directory/", "south_hindi", "svg")
```

#### Outputs:
|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_kannada.svg" width="400">|<img src="https://raw.githubusercontent.com/VicharaVandana/jyotichart/package/docs/images/south_hindi.svg" width="400">|
|:---:|:---:|
| **South Indian - Kannada** | **South Indian - Hindi** |

---

#### E. South Indian Chart in Sinhala

On South Indian charts, the **"Asc"** marker becomes **"ලග්න"** and centre labels (`උපත`, `උපන් ස්ථානය`, `කේන්දරය`) are rendered in Sinhala.
```python
import jyotichart as chart

south = chart.SouthChart("D1 කේන්දරය", "කමල්", language="sinhala")
# Birth -> උපත | BirthPlace -> උපන් ස්ථානය | Chart -> කේන්දරය | Asc -> ලග්න
south.set_birth_details("15 Aug 1990", "08:30", "Colombo")
south.set_ascendantsign("Scorpio")

planets = [chart.SUN, chart.MOON, chart.MARS, chart.MERCURY,
           chart.JUPITER, chart.VENUS, chart.SATURN, chart.RAHU, chart.KETU]
houses  = [1, 4, 10, 1, 9, 2, 7, 12, 6]
for planet, house in zip(planets, houses):
    south.add_planet(planet, chart.get_planet_symbol(planet, "sinhala"), house)

south.updatechartcfg(aspect=False)
south.draw("output_directory/", "south_sinhala", "svg")
```

#### F. South Indian Chart in Tamil

On South Indian charts, the **"Asc"** marker becomes **"லக்னம்"** and centre labels (`பிறப்பு`, `பிறந்த இடம்`, `ஜாதகம்`) are rendered in Tamil.
```python
import jyotichart as chart

south = chart.SouthChart("D1 ஜாதகம்", "முருகன்", language="tamil")
# Birth -> பிறப்பு | BirthPlace -> பிறந்த இடம் | Chart -> ஜாதகம் | Asc -> லக்னம்
south.set_birth_details("15 Aug 1990", "08:30", "Chennai")
south.set_ascendantsign("Scorpio")

planets = [chart.SUN, chart.MOON, chart.MARS, chart.MERCURY,
           chart.JUPITER, chart.VENUS, chart.SATURN, chart.RAHU, chart.KETU]
houses  = [1, 4, 10, 1, 9, 2, 7, 12, 6]
for planet, house in zip(planets, houses):
    south.add_planet(planet, chart.get_planet_symbol(planet, "tamil"), house)

south.updatechartcfg(aspect=False)
south.draw("output_directory/", "south_tamil", "svg")
```

#### G. East Indian Chart in Sinhala / Tamil

East Indian charts localise exactly like South Indian charts (fixed signs + translated Asc/centre labels).
```python
import jyotichart as chart

for LANG, name, pob in [("sinhala", "කමල්", "Colombo"), ("tamil", "முருகன்", "Chennai")]:
    east = chart.EastChart(f"D1 {LANG}", name, language=LANG)
    east.set_birth_details("15 Aug 1990", "08:30", pob)
    east.set_ascendantsign("Leo")
    planets = [chart.SUN, chart.MOON, chart.MARS, chart.MERCURY,
               chart.JUPITER, chart.VENUS, chart.SATURN, chart.RAHU, chart.KETU]
    houses  = [1, 4, 10, 1, 9, 2, 7, 12, 6]
    for planet, house in zip(planets, houses):
        east.add_planet(planet, chart.get_planet_symbol(planet, LANG), house)
    east.updatechartcfg(aspect=False)
    east.draw("output_directory/", f"east_{LANG}", "svg")
```

---

#### Quick Reference: get_planet_symbol() and SUPPORTED_LANGUAGES
```python
import jyotichart as chart

# Get a single planet symbol in any language
chart.get_planet_symbol(chart.SUN, "kannada")  # returns "ಸೂ"
chart.get_planet_symbol(chart.SUN, "hindi")    # returns "सू"
chart.get_planet_symbol(chart.SUN, "sinhala")  # returns "සූ"
chart.get_planet_symbol(chart.SUN, "tamil")    # returns "சூ"
chart.get_planet_symbol(chart.SUN, "english")  # returns "Su"

# Sign names and UI labels are also translated
chart.get_sign_name("Aries", "sinhala")  # returns "මේෂ"
chart.get_sign_name("Aries", "tamil")    # returns "மேஷம்"

# Check all supported languages
print(chart.SUPPORTED_LANGUAGES)  # ['english', 'kannada', 'hindi', 'sinhala', 'tamil']

# Build a full chart for any language efficiently with a loop
LANG = "tamil"   # switch to "sinhala", "hindi", "kannada" or "english" as needed
planets = [chart.SUN, chart.MOON, chart.MARS, chart.MERCURY,
           chart.JUPITER, chart.VENUS, chart.SATURN, chart.RAHU, chart.KETU]
houses  = [1, 4, 10, 1, 9, 2, 7, 12, 6]

my_chart = chart.EastChart("D1", "My Name", language=LANG)
my_chart.set_ascendantsign("Aries")
for planet, house in zip(planets, houses):
    my_chart.add_planet(planet, chart.get_planet_symbol(planet, LANG), house)
my_chart.updatechartcfg(aspect=False)
my_chart.draw("output_directory/", "my_chart", "svg")
```

---



## 9. Classes Reference



Jyotichart provides 9 primary chart classes to accommodate any formatting need:



1. **`NorthChart(chartname, personname, IsFullChart=True, language="english")`**: Renders a standard diamond-shaped North Indian chart.

2. **`SouthChart(chartname, personname, IsFullChart=True, language="english")`**: Renders a standard square-shaped South Indian chart.

3. **`EastChart(chartname, personname, IsFullChart=True, language="english")`**: Renders an East Indian / Maithili chart (3×3 grid with diagonal corners, fixed signs, anti-clockwise). Aries is fixed top-centre; houses are counted anti-clockwise from Lagna.

4. **`NorthTransitChart(chartname, personname, parentNorthChart, IsFullChart=True, language="english")`**: Renders a North Indian chart with an outer orbit containing transit planets. You MUST pass a fully instantiated `NorthChart` as the `parentNorthChart` parameter.

5. **`SouthTransitChart(chartname, personname, parentSouthChart, IsFullChart=True, language="english")`**: Renders a South Indian chart with an outer orbit containing transit planets. You MUST pass a fully instantiated `SouthChart` as the `parentSouthChart` parameter.

6. **`EastTransitChart(chartname, personname, parentEastChart, IsFullChart=True, language="english")`**: Renders an East Indian transit overlay. Natal planets use base coordinates, transit planets are shifted (+20,+15) so both remain visible. You MUST pass a fully instantiated `EastChart` as the `parentEastChart` parameter.

7. **`NorthNumericalChart(chartname, personname, language="english")`**: Renders a North Indian chart specifically formatted to center a large numerical value in each house instead of planets.

8. **`SouthNumericalChart(chartname, personname, language="english")`**: Renders a South Indian chart specifically formatted to center a large numerical value in each house instead of planets.

9. **`EastNumericalChart(chartname, personname, language="english")`**: Renders an East Indian chart with one large numerical value per fixed-sign compartment (anti-clockwise).



---



## 10. API Reference & Methods



Below is a detailed reference of the most frequently used methods and parameters across the chart classes.



### `add_planet(planet, symbol, housenum, [retrograde], [aspectsymbol], [colour])`

Adds a planet to the chart in the specified house. **(Available on: Natal Charts, Transit Charts)**



**Mandatory Parameters:**

- `planet` (str): The planet to add. Use the provided constants: `chart.SUN`, `chart.MOON`, `chart.MARS`, `chart.MERCURY`, `chart.JUPITER`, `chart.VENUS`, `chart.SATURN`, `chart.RAHU`, `chart.KETU`.

- `symbol` (str): The text that will be displayed on the chart for this planet (e.g., `"Mo"`, `"Ju"`).

- `housenum` (int): The astrological house number (1-12) to place the planet in. 



**Optional Parameters:**

- `retrograde` (bool): Defaults to `False`. If `True`, the planet symbol will be underlined. (Note: Rahu and Ketu default to `True`).

- `aspectsymbol` (str): Symbol to use for the planet's aspect lines. If not provided, it uses traditional unicode astrological symbols (e.g. `♃` for Jupiter).

- `colour` (str): Defaults to `"white"`. Change the color of this specific planet text on the chart.



### `set_ascendantsign(sign)`

Sets the ascendant sign (Lagna), which dictates the numbering of the houses. **(Available on: Natal Charts, Numerical Charts)**

- `sign` (str): Must be exactly one of: `"Aries"`, `"Taurus"`, `"Gemini"`, `"Cancer"`, `"Leo"`, `"Virgo"`, `"Libra"`, `"Scorpio"`, `"Saggitarius"`, `"Capricorn"`, `"Aquarius"`, `"Pisces"`.



### `set_house_value(housenum, value, [colour])`

Sets the numerical value displayed at the center of a given house. **(Available on: Numerical Charts)**

- `housenum` (int): The astrological house number (1-12).

- `value` (int/str): The number (or short text string) to display in the house center.

- `colour` (str): Defaults to `"lime"`. The color of the value string.



### `updatechartcfg([aspect], [clr_background], [clr_outbox], [clr_line], [clr_sign], [clr_houses], [show_center_lagna], [font_family], [font_sizes], [clr_details])`

Updates global chart colors, fonts and visibility configurations. Any parameters you omit will retain their default values. **(Available on: All Charts)**

- `show_center_lagna` (bool/str/None): `None` (default) leaves the current setting untouched. `True` shows a two-line rising-sign + Lagna label in the middle square (e.g. `මීන` + `ලග්න`, `Leo` + `Asc`), `False` hides it. Pass a **string** instead (e.g. `show_center_lagna="Navamsa"`) to keep line 1 as the rising sign but replace line 2 with your own text — useful for divisional charts so the centre reads `Leo` / `Navamsa` instead of `Leo` / `Asc`. Known Shodashavarga names (including aliases like `"D9"`) are auto-translated via `get_varga_name()`; any other string passes through unchanged. Off by default in every language; opt in per chart. Applies to South/East families (natal, transit, numerical); North charts have no centre square.



- `aspect` (bool): `True` (default) or `False`. Toggles whether planetary aspect lines are drawn.

- `clr_background` (str): The main background color of the SVG. Defaults to `"black"`.

- `clr_outbox` (str): The border color of the chart. Defaults to `"red"`.

- `clr_line` (str): The color of the internal grid lines. Defaults to `"yellow"`.

- `clr_sign` (str): The color of the sign numbers. Defaults to `"pink"`.

- `clr_houses` (list of str): An array of 12 strings, allowing you to set an individual background color for each house.

- `font_family` (str/None): `None` (default) keeps `"sans-serif"`. Any CSS font-family value, e.g. `"Georgia, serif"`, applied to all text in the chart.

- `font_sizes` (dict/None): `None` (default) keeps each style's built-in sizes. A dict of `{name: px}` overrides, e.g. `{"planet": 17, "sign": 24}`. Names may be exact css classes (`"planet"`, `"sign-num"`, `"natal-planet"`, `"num-value"`, ...) or generic aliases: `"sign"` (sign numbers + East triangle marker), `"planet"` (all planet texts), `"aspect"` (all aspect texts), `"details"` (centre details), `"value"` (numerical values), `"lagna"` (centre Lagna label). Unknown keys are ignored.

```python
c.updatechartcfg(
    clr_background="white", clr_outbox="gray", clr_line="gray",
    clr_Asc="black", font_family="Georgia, serif",
    font_sizes={"sign": 24, "planet": 17, "aspect": 18, "details": 14},
)
# See examples/styled_light.py for a full white-bg / gray-border / black-text chart.
```

- `clr_details` (str): Colour of the centre-box text (name, birth details, chart name, Lagna label). Defaults to `"white"` — set to `"black"` for light backgrounds. **Gotcha:** a light theme also needs `clr_houses=["white"] * 12`, since the 12 house boxes default to `"black"`.



### `get_planet_symbol(planet, language="english")`

Module-level helper function. Returns the planet abbreviation in the requested language. **(Module-level utility)**

- `planet` (str): Planet constant e.g. `chart.SUN`, `chart.MOON`, `"Mars"` etc.

- `language` (str): One of `"english"` (default), `"kannada"`, `"hindi"`, `"sinhala"`, `"tamil"`.

- Returns e.g. `"Su"` (english), `"ಸೂ"` (kannada), `"सू"` (hindi), `"සූ"` (sinhala), `"சூ"` (tamil).



### `get_sign_name(sign, language="english")`

Module-level helper function. Returns the zodiac sign name in the requested language. **(Module-level utility)**

- `sign` (str): English sign name e.g. `"Aries"`, `"Scorpio"` etc.

- `language` (str): One of `"english"` (default), `"kannada"`, `"hindi"`, `"sinhala"`, `"tamil"`.

### `get_varga_name(varga, language="english")`

Module-level helper function. Returns a Shodashavarga division name in the requested language. **(Module-level utility)**

- `varga` (str): Division name e.g. `"Navamsa"`, `"Dasamsa"`, `"Hora"`. Aliases like `"D9"`, `"D10"` or `"Navamsha"` are accepted.

- `language` (str): One of `"english"` (default), `"kannada"`, `"hindi"`, `"sinhala"`, `"tamil"`.

- Returns e.g. `"Navamsa"` (english), `"ನವಾಂಶ"` (kannada), `"नवांश"` (hindi), `"නවාංශ"` (sinhala), `"நவாம்சம்"` (tamil). Unknown names pass through unchanged.

```python
chart.get_varga_name("Navamsa", "sinhala")  # returns "නවාංශ"
chart.get_varga_name("D10", "tamil")        # returns "தசாம்சம்"

# Localised divisional centre label (auto-translates known varga names):
c.updatechartcfg(show_center_lagna=chart.get_varga_name("Navamsa", "sinhala"))
# ... or simply pass English and let the chart translate it:
c.updatechartcfg(show_center_lagna="Navamsa")
```

#### Shodashavarga Divisions Reference

| No. | Division | Signification | Kannada | Hindi | Sinhala | Tamil |
|---|---|---|---|---|---|---|
| 1 | Rashi | Body | `ರಾಶಿ` | `राशि` | `රාශි` | `ராசி` |
| 2 | Hora | Wealth | `ಹೋರಾ` | `होरा` | `හෝරා` | `ஹோரா` |
| 3 | Drekkana | Siblings | `ದ್ರೇಕ್ಕಾಣ` | `द्रेष्काण` | `ද්‍රේෂ්කාණ` | `த்ரேஷ்காணம்` |
| 4 | Chaturthamsa | Luck | `ಚತುರ್ಥಾಂಶ` | `चतुर्थांश` | `චතුර්ථාංශ` | `சதுர்த்தாம்சம்` |
| 7 | Saptamsa | Progeny | `ಸಪ್ತಾಂಶ` | `सप्तांश` | `සප්තාංශ` | `சப்தாம்சம்` |
| 9 | Navamsa | Wife & Marriage | `ನವಾಂಶ` | `नवांश` | `නවාංශ` | `நவாம்சம்` |
| 10 | Dasamsa | Profession | `ದಶಾಂಶ` | `दशांश` | `දශාංශ` | `தசாம்சம்` |
| 12 | Dwadasamsa | Parents | `ದ್ವಾದಶಾಂಶ` | `द्वादशांश` | `ද්වාදශාංශ` | `துவாதசாம்சம்` |
| 16 | Shodasamsa | Happiness through vehicle & property | `ಷೋಡಶಾಂಶ` | `षोडशांश` | `ෂෝඩශාංශ` | `ஷோடசாம்சம்` |
| 20 | Vimsamsa | Spiritual life | `ವಿಂಶಾಂಶ` | `विंशांश` | `විංශාංශ` | `விம்சாம்சம்` |
| 24 | Chaturvimsamsa | Education | `ಚತುರ್ವಿಂಶಾಂಶ` | `चतुर्विंशांश` | `චතුර්විංශාංශ` | `சதுர்விம்சாம்சம்` |
| 27 | Bhamsa | Strength | `ಭಾಂಶ` | `भांश` | `භාංශ` | `பாம்சம்` |
| 30 | Trimsamsa | Misfortune | `ತ್ರಿಂಶಾಂಶ` | `त्रिंशांश` | `ත්‍රිංශාංශ` | `திரிம்சாம்சம்` |
| 40 | Khavedamsa | Auspicious results | `ಖವೇದಾಂಶ` | `खवेदांश` | `ඛවේදාංශ` | `கவேதாம்சம்` |
| 45 | Akshavedamsa | General Wellbeing | `ಅಕ್ಷವೇದಾಂಶ` | `अक्षवेदांश` | `අක්ෂවේදාංශ` | `அக்ஷவேதாம்சம்` |
| 60 | Shastiamsa | General Wellbeing | `ಷಷ್ಟ್ಯಂಶ` | `षष्ट्यंश` | `ෂෂ්ට්‍යංශ` | `ஷஷ்டியாம்சம்` |

> **Note on varga translations:** the Hindi forms are the standard Sanskrit originals (e.g. `नवांश`, `दशांश`). The Kannada, Sinhala and Tamil forms are regular transliterations of those Sanskrit technical terms into each script. If your parampara/school uses a variant spelling for any term, please raise it and the table will be corrected — `get_varga_name()` passes unknown strings through unchanged, so nothing breaks in the meantime.



### `set_birth_details(dob, tob, pob)` and `set_transit_details(date, time)`

Populates the center box of South/East Indian charts with highly structured metadata. **(Available on: SouthChart, EastChart and SouthTransitChart, EastTransitChart respectively)**

- `dob` / `date` (str): The date string (e.g., `"08 October 1991"`).

- `tob` / `time` (str): The time string (e.g., `"14:47"`).

- `pob` (str): Place of birth (e.g., `"New York"`).



### Rendering: `draw()` vs `to_svg_string()`

Two rendering methods are available on all 9 chart classes. Only SVG output is supported (`format="svg"`); there is no PNG/PDF export.

- `draw(location, filename, format="svg")` — writes `{location}{filename}.svg` (UTF-16) and returns `"Success"`. This is the file-saving method used throughout the examples above.

- `to_svg_string()` — renders the same chart and returns the SVG XML as a Python `str` instead of writing a file. Returns an error string if the chart is not ready. Use it to embed charts in HTML pages or reports:

```python
svg = south.to_svg_string()          # "<svg ...>...</svg>"
html = "<html><body>%s</body></html>" % svg
open("report.html", "w", encoding="utf-8").write(html)
# See examples/styled_light.py, which writes examples/output/light_report.html this way.
```



---



## Reference Constants



For convenience and readability, the library provides planet constants you can import and use directly without spelling them out as strings:
`chart.SUN`, `chart.MOON`, `chart.MARS`, `chart.MERCURY`, `chart.JUPITER`, `chart.VENUS`, `chart.SATURN`, `chart.RAHU`, `chart.KETU`.



For language support:
`chart.SUPPORTED_LANGUAGES` — list of all supported language codes: `["english", "kannada", "hindi", "sinhala", "tamil"]`.





---



# Changelog



All notable changes to this project will be documented in this file.



## [7.1.0] - 2026-09-23



### Added

- **Configurable fonts**: `updatechartcfg(font_family=..., font_sizes=...)` on all 9 chart classes. Any CSS font-family plus per-element size overrides (`{"sign": 24, "planet": 17, ...}` with generic aliases `sign/planet/aspect/details/value/lagna` or exact css classes). Backed by shared `support/fonts.py`; defaults render identically to before.

- **`to_svg_string()` rendering method** on all 9 chart classes: returns the SVG XML as a string for embedding in HTML/reports instead of writing a file. `draw()` file output unchanged; SVG remains the only supported format.

- **East triangle overlap fix**: per-sign compact layout tables with middle-anchored labels keep planet/aspect/Asc text strictly inside the 8 corner triangles (houses 2,3,5,6,8,9,11,12 with Aries Lagna), including transit overlays; smaller `sign-num-tri` Asc marker.

- **`examples/styled_light.py`**: white background, gray borders/grid, black signs and planet text, serif fonts, plus an HTML report with embedded SVG strings.

- **`clr_details`**: new `updatechartcfg` parameter for centre-box text colour (default `"white"`). Required for light themes — together with `clr_houses=["white"] * 12`, since house boxes also default to `"black"`.



---



## [7.0.0] - 2026-09-22



### Added

- **East Indian (Maithili/Bengali) chart style**: New `EastChart`, `EastTransitChart` and `EastNumericalChart` classes (9 chart types total). Fixed-sign, anti-clockwise layout matching `east_indian.svg` — Aries fixed top-centre, remaining signs anti-clockwise through split corner triangles. Reuses South fixed-sign `housenum → sign` logic (`gen.get_signofsign`) with East geometry (`eastindianchart.py`, `eastindian_transitchart.py`, `eastindian_numericalchart.py`).

- **Sinhala + Tamil language support**: `SUPPORTED_LANGUAGES` is now `["english", "kannada", "hindi", "sinhala", "tamil"]`. All 9 chart classes accept `language="sinhala"` / `"tamil"`. Planet symbols, sign names (`get_sign_name`) and UI labels (Asc, Birth, BirthPlace, Chart, Inner, Outer, Transit) translated in `support/languages.py`.

- **README**: New Section 7 (East Indian charts with natal/transit/numerical + Sinhala/Tamil examples), expanded Section 8 (5-language tables for planets, signs and UI labels, sections E–G), updated Classes Reference (6 → 9) and API reference.



---



## [6.0.0] - 2026-07-05



### Added

- **Multi-Language Support**: All 6 chart classes now accept a `language` parameter (`"english"` default, `"kannada"`, `"hindi"`). Planet abbreviations, sign labels, the Ascendant marker, and center box text (Birth, BirthPlace, Chart etc.) are automatically rendered in the selected language on South Indian charts.

- **`get_planet_symbol(planet, language)`**: New module-level helper that returns the correct planet abbreviation for the given language (e.g. `"ಸೂ"` for Sun in Kannada, `"सू"` for Sun in Hindi).

- **`get_sign_name(sign, language)`**: New module-level helper that returns the zodiac sign name in the given language.

- **`support/languages.py`**: Centralized translation module containing planet symbols, sign names, and UI labels for English, Kannada, and Hindi.

- **`SUPPORTED_LANGUAGES`**: Module-level constant listing all supported language codes.

- **Required Python Libraries section** in README: Documents that jyotichart has no external dependencies beyond the Python Standard Library.



---



## [5.0.0] - 2026-07-05



### Added

- **Partial Charts**: You can now generate charts with missing planets (e.g., just Sun and Jupiter) by initializing charts with `IsFullChart=False`. The chart will cleanly render without throwing missing planet validation errors.

- **Toggling Aspects**: Added the ability to completely disable planetary aspect lines via `updatechartcfg(aspect=False)` for cleaner, less cluttered outputs (especially useful in Transit Charts).

- **Extensive API Reference**: Massively updated README with complete, copy-pastable code samples, generated visual examples, and a comprehensive method and class reference.



### Fixed

- **Critical Class Variable Leak**: Fixed a major bug where `planets` were stored as a shared class variable. Previously, generating a full natal chart would cause subsequent partial charts to inappropriately display all 9 planets. This state leak has been patched across `NorthChart`, `SouthChart`, `NorthTransitChart`, and `SouthTransitChart`.

- **Retrograde Rendering Cleanup**: Removed the parentheses `()` around retrograde planets to reduce visual noise. Retrograde planets are now exclusively indicated by an underline (e.g. `Ju` underlined).



### Changed

- **Transit Layout Updates**: North and South Indian Transit charts have been structurally refined for better label visibility and inner/outer orbit distinctions.

- **Center Box Text Optimization**: Overhauled the central text area for South Indian charts (and transit charts) to tightly fit Birth Details, Chart Name, and Transit Dates without overlapping the borders.



---



## [4.0.0] - Previous Release

- Initial stable release including base North/South natal and numerical charts.

